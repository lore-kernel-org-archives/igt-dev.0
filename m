Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1118AC3DA49
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 10:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AE410E127;
	Fri,  2 Aug 2024 10:32:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC8D10E127;
 Fri,  2 Aug 2024 10:32:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3373124068684353545=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib/xe/xe=5Fquery=3A_Do_not_r?=
 =?utf-8?q?equire_QUERY=5FOA=5FUNITS_for_all_Xe_tests_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 02 Aug 2024 10:32:48 -0000
Message-ID: <172259476895.502952.14859408568672929532@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
In-Reply-To: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
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

--===============3373124068684353545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests (rev6)
URL   : https://patchwork.freedesktop.org/series/136499/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7952_full -> XEIGTPW_11522_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11522_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11522_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11522_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_plane_cursor@primary.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_plane_cursor@primary.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-lnl:          [ABORT][5] ([Intel XE#2421]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          [SKIP][7] ([Intel XE#1439]) -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {shard-bmg}:        [ABORT][9] ([Intel XE#2421]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - {shard-bmg}:        [PASS][11] -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - {shard-bmg}:        [SKIP][13] ([Intel XE#1124]) -> [SKIP][14] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - {shard-bmg}:        [SKIP][15] ([Intel XE#2314]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - {shard-bmg}:        [SKIP][17] ([Intel XE#2251]) -> [SKIP][18] +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - {shard-bmg}:        [SKIP][19] ([Intel XE#2325]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - {shard-bmg}:        [SKIP][21] ([Intel XE#2252]) -> [SKIP][22] +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic:
    - {shard-bmg}:        [SKIP][23] -> [FAIL][24] +2 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_content_protection@atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - {shard-bmg}:        NOTRUN -> [FAIL][25] +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - {shard-bmg}:        [FAIL][26] -> [INCOMPLETE][27] +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-1/igt@kms_content_protection@legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - {shard-bmg}:        [FAIL][28] -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@kms_content_protection@uevent.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - {shard-bmg}:        [SKIP][30] ([Intel XE#2320]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-bmg}:        [DMESG-WARN][32] -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - {shard-bmg}:        [SKIP][34] ([Intel XE#2425]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - {shard-bmg}:        [SKIP][36] ([Intel XE#2323]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@psr1:
    - {shard-bmg}:        [SKIP][38] ([Intel XE#2374]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - {shard-bmg}:        [SKIP][40] ([Intel XE#2316]) -> [DMESG-WARN][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * {igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3}:
    - {shard-bmg}:        [PASS][42] -> [DMESG-WARN][43] +4 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - {shard-bmg}:        [SKIP][44] ([Intel XE#2444]) -> [DMESG-WARN][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@wf_vblank-ts-check:
    - {shard-bmg}:        NOTRUN -> [SKIP][46] +23 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - {shard-bmg}:        [SKIP][47] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - {shard-bmg}:        [SKIP][49] ([Intel XE#2293]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][51] ([Intel XE#2312]) -> [SKIP][52] +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - {shard-bmg}:        [FAIL][53] ([Intel XE#2333]) -> [SKIP][54] +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][55] ([Intel XE#2311]) -> [SKIP][56] +8 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - {shard-bmg}:        [SKIP][57] ([Intel XE#2313]) -> [SKIP][58] +11 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - {shard-bmg}:        [SKIP][59] ([Intel XE#2444]) -> [SKIP][60] +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - {shard-bmg}:        [SKIP][61] ([Intel XE#498]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][63] +7 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - {shard-bmg}:        [SKIP][64] ([Intel XE#2318]) -> [SKIP][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - {shard-bmg}:        [SKIP][66] ([Intel XE#1489]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - {shard-bmg}:        [SKIP][68] ([Intel XE#2234]) -> [SKIP][69] +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-render.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - {shard-bmg}:        [SKIP][70] ([Intel XE#2329]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - {shard-bmg}:        [SKIP][72] ([Intel XE#2426]) -> [FAIL][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - {shard-bmg}:        [SKIP][74] ([Intel XE#1499]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_vrr@flip-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@kms_vrr@flip-basic.html

  * igt@xe_compute@ccs-mode-basic:
    - {shard-bmg}:        [FAIL][76] ([Intel XE#1050]) -> [SKIP][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - {shard-bmg}:        [PASS][78] -> [SKIP][79] +77 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-2/igt@xe_copy_basic@mem-set-linear-0x369.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        NOTRUN -> [TIMEOUT][80]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - {shard-bmg}:        [SKIP][81] ([Intel XE#2322]) -> [SKIP][82] +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11522_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#623])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1466])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic@crtc-invalid-params:
    - shard-lnl:          [PASS][85] -> [SKIP][86] ([Intel XE#2423]) +46 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_atomic@crtc-invalid-params.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_atomic@crtc-invalid-params.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][87] -> [SKIP][88] ([Intel XE#1201] / [i915#2575]) +35 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#1426]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][91] -> [INCOMPLETE][92] ([Intel XE#1195]) +1 other test incomplete
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][93] ([Intel XE#1426])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#1201]) +20 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1407]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#607])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1124]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1124]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1201]) +20 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1512])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#787]) +111 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1399]) +9 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#787]) +27 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#306]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#373])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#373]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#1188]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1201] / [i915#2575]) +13 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1424]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#2028]) +2 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +27 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#323])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#323])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#309]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [i915#3804])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1421]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][127] -> [DMESG-WARN][128] ([Intel XE#2019]) +1 other test dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][129] ([Intel XE#2019])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1401]) +8 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#651]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#651]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][135] -> [SKIP][136] ([Intel XE#1201] / [Intel XE#2351]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [PASS][137] -> [SKIP][138] ([Intel XE#2351]) +32 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#656]) +28 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#2351]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#2351]) +18 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#653]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1470])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#356])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#356])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#2423]) +14 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][148] -> [DMESG-WARN][149] ([Intel XE#1162])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [FAIL][150] ([Intel XE#616])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][151] ([Intel XE#1551]) +1 other test dmesg-fail
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#599]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +4 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#498]) +12 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#2318]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#2318]) +13 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#1122] / [Intel XE#1201]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#736])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1129] / [Intel XE#1201])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
    - shard-lnl:          NOTRUN -> [FAIL][164] ([Intel XE#718])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][165] -> [SKIP][166] ([Intel XE#1201] / [Intel XE#2446])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-lnl:          [PASS][167] -> [SKIP][168] ([Intel XE#2446])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1439]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1128])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          [PASS][173] -> [FAIL][174] ([Intel XE#1649]) +1 other test fail
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#1406]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][176] -> [FAIL][177] ([Intel XE#899])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-lnl:          [PASS][178] -> [FAIL][179] ([Intel XE#2443]) +1 other test fail
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#756])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#756]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#1201] / [Intel XE#756])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#1126] / [Intel XE#1201])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#944])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#944])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#688]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][188] -> [TIMEOUT][189] ([Intel XE#1473])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][190] ([Intel XE#1473] / [Intel XE#392])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#1130] / [Intel XE#1201]) +31 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#1392]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#288]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#1201] / [Intel XE#2360])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - shard-lnl:          NOTRUN -> [FAIL][196] ([Intel XE#2343])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][197] ([Intel XE#1195] / [Intel XE#2105])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-bal-userptr:
    - shard-dg2-set2:     [PASS][198] -> [SKIP][199] ([Intel XE#1130] / [Intel XE#1201]) +103 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_exec_threads@threads-bal-userptr.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_exec_threads@threads-bal-userptr.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#1192] / [Intel XE#1201])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#2229])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [PASS][202] -> [SKIP][203] ([Intel XE#1192] / [Intel XE#1201])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#1130]) +23 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_mmap@small-bar.html

  * igt@xe_oa@blocking:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#1201] / [Intel XE#2419]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_oa@blocking.html

  * igt@xe_oa@stress-open-close:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#2419]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@xe_oa@stress-open-close.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#2419])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_oa@stress-open-close.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#1201] / [Intel XE#977])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#1061] / [Intel XE#1201])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_peer2peer@read.html
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#1061])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][211] ([Intel XE#1173])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#2284] / [Intel XE#366])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][214] -> [INCOMPLETE][215] ([Intel XE#1195] / [Intel XE#1358])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [PASS][216] -> [FAIL][217] ([Intel XE#1924] / [Intel XE#2028])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@xe_pm@s2idle-multiple-execs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#584])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][219] -> [ABORT][220] ([Intel XE#1358] / [Intel XE#1607])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_pm@s4-basic.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][221] ([Intel XE#1201] / [Intel XE#944])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@query-uc-fw-version-guc:
    - shard-lnl:          [PASS][222] -> [SKIP][223] ([Intel XE#1130]) +103 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@xe_query@query-uc-fw-version-guc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_query@query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][224] -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@core_getversion@basic.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@core_getversion@basic.html
    - shard-lnl:          [FAIL][226] -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@core_getversion@basic.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][228] -> [PASS][229] +3 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@core_setmaster@master-drop-set-shared-fd.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html
    - shard-lnl:          [SKIP][230] -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@core_setmaster@master-drop-set-shared-fd.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - {shard-bmg}:        [SKIP][232] ([Intel XE#2444]) -> [PASS][233] +17 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][234] ([Intel XE#1426]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][236] ([Intel XE#1659]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2351]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [FAIL][240] ([Intel XE#2436]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][242] ([i915#2575]) -> [PASS][243] +8 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_color@ctm-negative.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_color@ctm-negative.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - {shard-bmg}:        [SKIP][244] ([Intel XE#2291]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - {shard-bmg}:        [DMESG-WARN][246] -> [PASS][247] +5 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - {shard-bmg}:        [SKIP][248] ([Intel XE#2316]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [FAIL][250] ([Intel XE#886]) -> [PASS][251] +1 other test pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#2351]) -> [PASS][253] +4 other tests pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201]) -> [PASS][255] +14 other tests pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201] / [i915#2575]) -> [PASS][257] +18 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_lease@lease-invalid-crtc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][258] ([Intel XE#2019]) -> [PASS][259] +1 other test pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-WARN][260] ([Intel XE#324]) -> [PASS][261] +1 other test pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_multiple@tiling-4:
    - {shard-bmg}:        [FAIL][262] -> [PASS][263] +2 other tests pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_plane_multiple@tiling-4.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][265] +18 other tests pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2-set2:     [INCOMPLETE][266] ([Intel XE#1195]) -> [PASS][267] +1 other test pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-lnl:          [SKIP][268] ([Intel XE#2446]) -> [PASS][269] +2 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_pm_rpm@basic-pci-d3-state.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_pm_rpm@basic-pci-d3-state.html
    - {shard-bmg}:        [SKIP][270] ([Intel XE#2446]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_pm_rpm@basic-pci-d3-state.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [SKIP][272] ([Intel XE#2351]) -> [PASS][273] +27 other tests pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_psr@psr2-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][274] ([Intel XE#2423]) -> [PASS][275] +33 other tests pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][276] ([Intel XE#899]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-lnl:          [FAIL][278] ([Intel XE#2028]) -> [PASS][279] +2 other tests pass
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@negative-basic:
    - {shard-bmg}:        [SKIP][280] ([Intel XE#1499]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][282] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - {shard-bmg}:        [SKIP][284] -> [PASS][285] +53 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_balancer@virtual-all-active:
    - {shard-bmg}:        [TIMEOUT][286] -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@xe_exec_balancer@virtual-all-active.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-2/igt@xe_exec_balancer@virtual-all-active.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#1130]) -> [PASS][289] +17 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_basic@many-execqueues-many-vm-basic.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_basic@many-execqueues-many-vm-basic.html

  * igt@xe_pm@d3hot-mocs:
    - {shard-bmg}:        [SKIP][290] ([Intel XE#1130]) -> [PASS][291] +12 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@xe_pm@d3hot-mocs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [INCOMPLETE][292] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][295] +80 other tests pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          [FAIL][296] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][297] +1 other test pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_vm@large-split-binds-16777216:
    - shard-lnl:          [SKIP][298] ([Intel XE#1130]) -> [PASS][299] +92 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@xe_vm@large-split-binds-16777216.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@xe_vm@large-split-binds-16777216.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [ABORT][300] ([Intel XE#2421]) -> [ABORT][301] ([Intel XE#2418]) +1 other test abort
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@core_hotunplug@hotrebind.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@core_hotunplug@hotrebind.html
    - shard-lnl:          [ABORT][302] ([Intel XE#2421]) -> [ABORT][303] ([Intel XE#2418]) +1 other test abort
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@core_hotunplug@hotrebind.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [ABORT][304] ([Intel XE#2421]) -> [SKIP][305] ([Intel XE#1201])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [ABORT][306] ([Intel XE#2421]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#1885])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
    - shard-lnl:          [ABORT][308] ([Intel XE#2421]) -> [SKIP][309] ([Intel XE#1885])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_3d:
    - shard-lnl:          [SKIP][310] ([Intel XE#2423]) -> [SKIP][311] ([Intel XE#1465])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_3d.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_3d.html

  * igt@kms_addfb_basic@unused-offsets:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1201] / [i915#2575]) -> [SKIP][313] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_addfb_basic@unused-offsets.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-lnl:          [SKIP][314] ([Intel XE#2423]) -> [FAIL][315] ([Intel XE#1426])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#1201]) -> [SKIP][317] ([Intel XE#316]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][319] ([Intel XE#1201] / [Intel XE#2351])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          [SKIP][320] ([Intel XE#2351]) -> [DMESG-WARN][321] ([Intel XE#1725])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][323] ([Intel XE#316]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][324] -> [SKIP][325] ([Intel XE#1201])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#316]) -> [SKIP][327] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2351]) -> [SKIP][329] ([Intel XE#1201] / [Intel XE#316])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-lnl:          [SKIP][330] ([Intel XE#2351]) -> [SKIP][331] ([Intel XE#1407]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][333] ([Intel XE#1201] / [Intel XE#2351])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#1201]) -> [SKIP][335] ([Intel XE#1124])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][337] ([Intel XE#1201])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          [SKIP][338] ([Intel XE#1467]) -> [SKIP][339] ([Intel XE#2351])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][341] ([Intel XE#1201])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-lnl:          [SKIP][342] ([Intel XE#1428]) -> [SKIP][343] ([Intel XE#2351])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#1124]) -> [SKIP][345] ([Intel XE#1124] / [Intel XE#1201])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#2351]) -> [SKIP][347] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][348] ([Intel XE#1124]) -> [SKIP][349] ([Intel XE#2351]) +4 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][351] ([Intel XE#1124]) +5 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][353] ([Intel XE#1124] / [Intel XE#1201])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#1201]) -> [SKIP][355] ([Intel XE#1201] / [Intel XE#619])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          [SKIP][356] ([Intel XE#2351]) -> [SKIP][357] ([Intel XE#1467])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][359] ([Intel XE#607])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#1201]) -> [SKIP][361] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][363] ([Intel XE#1201]) +3 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][364] ([Intel XE#2351]) -> [SKIP][365] ([Intel XE#1124]) +6 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#1124]) -> [SKIP][367] ([Intel XE#1201])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#1201] / [i915#2575]) -> [SKIP][369] ([Intel XE#1201] / [Intel XE#367])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][371] ([Intel XE#1201] / [i915#2575])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][373] ([Intel XE#2191])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][375] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          [SKIP][376] ([Intel XE#2191]) -> [SKIP][377] ([Intel XE#2423]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2191]) -> [SKIP][379] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#1201] / [i915#2575]) -> [SKIP][381] ([Intel XE#1201] / [Intel XE#2191])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-lnl:          [SKIP][382] ([Intel XE#2423]) -> [SKIP][383] ([Intel XE#1512])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][385] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
    - shard-lnl:          [SKIP][386] ([Intel XE#2423]) -> [SKIP][387] ([Intel XE#367]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][389] ([Intel XE#367])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][391] ([Intel XE#1201] / [Intel XE#2351])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][393] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][394] ([Intel XE#1399]) -> [SKIP][395] ([Intel XE#2351]) +13 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][397] ([Intel XE#1201]) +6 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][399] ([Intel XE#787]) +27 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][401] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][403] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#787]) -> [SKIP][405] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-dp-4.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][407] ([Intel XE#1252])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][408] -> [SKIP][409] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][411] ([Intel XE#1201]) +2 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#1201]) -> [SKIP][413] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][414] ([Intel XE#2351]) -> [SKIP][415] ([Intel XE#1399]) +6 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#1201]) -> [SKIP][417] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#1201]) -> [SKIP][419] ([Intel XE#314])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          [SKIP][420] ([Intel XE#2351]) -> [SKIP][421] ([Intel XE#314])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][422] ([i915#2575]) -> [SKIP][423] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#373]) -> [SKIP][425] ([Intel XE#1201] / [i915#2575])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][427] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html
    - shard-lnl:          [SKIP][428] ([Intel XE#306]) -> [SKIP][429] ([Intel XE#2423])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_chamelium_color@ctm-0-25.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#1201] / [i915#2575]) -> [SKIP][431] ([Intel XE#1201] / [Intel XE#306])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][433] ([Intel XE#1201] / [i915#2575])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          [SKIP][434] ([Intel XE#2423]) -> [SKIP][435] ([Intel XE#306]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][437] ([Intel XE#1201] / [Intel XE#306])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#373]) -> [SKIP][439] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][441] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
    - shard-lnl:          [SKIP][442] ([Intel XE#373]) -> [SKIP][443] ([Intel XE#2423]) +8 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     [SKIP][444] ([i915#2575]) -> [SKIP][445] ([Intel XE#373])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][447] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#1201] / [i915#2575]) -> [SKIP][449] ([Intel XE#1201] / [Intel XE#373])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_chamelium_frames@vga-frame-dump.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html
    - shard-lnl:          [SKIP][450] ([Intel XE#2423]) -> [SKIP][451] ([Intel XE#373]) +7 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_chamelium_frames@vga-frame-dump.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#1201] / [i915#2575]) -> [SKIP][453] ([Intel XE#373])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][455] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +3 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][457] ([Intel XE#373]) +3 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][458] ([i915#2575]) -> [SKIP][459] ([Intel XE#1201] / [Intel XE#307])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
    - shard-lnl:          [SKIP][460] ([Intel XE#2423]) -> [SKIP][461] ([Intel XE#307])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#307]) -> [SKIP][463] ([Intel XE#1201] / [Intel XE#307])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#1201] / [i915#2575]) -> [SKIP][465] ([Intel XE#1201] / [Intel XE#308])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-lnl:          [SKIP][466] ([Intel XE#2423]) -> [SKIP][467] ([Intel XE#1413]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     [SKIP][468] ([i915#2575]) -> [SKIP][469] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_cursor_crc@cursor-random-32x10.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#308]) -> [SKIP][471] ([Intel XE#1201] / [Intel XE#308])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][473] ([Intel XE#455])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][475] ([Intel XE#1201] / [Intel XE#308])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][477] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-lnl:          [SKIP][478] ([Intel XE#2423]) -> [SKIP][479] ([Intel XE#1424]) +3 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#455]) -> [SKIP][481] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#1201] / [i915#2575]) -> [SKIP][483] ([Intel XE#455])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][485] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-lnl:          [SKIP][486] ([Intel XE#1413]) -> [SKIP][487] ([Intel XE#2423]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][489] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html
    - shard-lnl:          [SKIP][490] ([Intel XE#1424]) -> [SKIP][491] ([Intel XE#2423])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          [SKIP][492] ([Intel XE#309]) -> [SKIP][493] ([Intel XE#2423]) +4 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][495] ([Intel XE#1201] / [i915#2575])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-lnl:          [SKIP][496] ([Intel XE#323]) -> [SKIP][497] ([Intel XE#2423])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][499] ([Intel XE#1201] / [Intel XE#455])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][500] ([Intel XE#599]) -> [SKIP][501] ([Intel XE#2423]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_display_modes@extended-mode-basic.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][503] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-lnl:          [SKIP][504] ([Intel XE#307]) -> [SKIP][505] ([Intel XE#2423])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_display_modes@mst-extended-mode-negative.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][507] ([Intel XE#1201] / [Intel XE#2351])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-lnl:          [SKIP][508] ([Intel XE#599]) -> [SKIP][509] ([Intel XE#2351])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#1201]) -> [SKIP][511] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-lnl:          [SKIP][512] ([Intel XE#2351]) -> [SKIP][513] ([Intel XE#599])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][514] ([Intel XE#2423]) -> [SKIP][515] ([Intel XE#702])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_feature_discovery@display-2x.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#1201] / [i915#2575]) -> [SKIP][517] ([Intel XE#1138] / [Intel XE#1201])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          [SKIP][518] ([Intel XE#2423]) -> [SKIP][519] ([Intel XE#1138])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_feature_discovery@display-4x.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][521] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          [SKIP][522] ([Intel XE#2423]) -> [SKIP][523] ([Intel XE#1421]) +4 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][525] ([Intel XE#2019])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          [SKIP][526] ([Intel XE#1421]) -> [SKIP][527] ([Intel XE#2423]) +2 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_flip@2x-plain-flip-ts-check.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][529] ([Intel XE#1201] / [i915#2575]) +6 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [FAIL][530] ([Intel XE#1901] / [Intel XE#2028]) -> [SKIP][531] ([Intel XE#2423])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          [SKIP][532] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][533] ([Intel XE#2351]) +2 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][534] -> [SKIP][535] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          [SKIP][536] ([Intel XE#2351]) -> [SKIP][537] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][539] ([Intel XE#1201]) +3 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#651]) -> [SKIP][541] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#1201]) -> [SKIP][543] ([Intel XE#651])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][545] ([Intel XE#1201]) +15 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][546] ([Intel XE#651]) -> [SKIP][547] ([Intel XE#2351]) +9 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#1201]) -> [SKIP][549] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
    - shard-lnl:          [SKIP][550] ([Intel XE#2351]) -> [SKIP][551] ([Intel XE#651]) +8 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][553] ([Intel XE#1201] / [Intel XE#658])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-lnl:          [SKIP][554] ([Intel XE#2351]) -> [SKIP][555] ([Intel XE#1469])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][557] ([Intel XE#651]) +12 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][558] -> [SKIP][559] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][560] -> [SKIP][561] ([Intel XE#651])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#651]) -> [SKIP][563] ([Intel XE#1201])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][565] ([Intel XE#1201] / [Intel XE#651])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][567] ([Intel XE#1201] / [Intel XE#2351]) +4 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][569] ([Intel XE#1201]) +12 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#1201]) -> [SKIP][571] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][573] ([Intel XE#653])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][575] ([Intel XE#1201] / [Intel XE#2351]) +5 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][577] ([Intel XE#653]) +10 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#1201]) -> [SKIP][579] ([Intel XE#1158] / [Intel XE#1201])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][581] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][582] -> [SKIP][583] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#653]) -> [SKIP][585] ([Intel XE#1201] / [Intel XE#2351])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#653]) -> [SKIP][587] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][588] ([Intel XE#2351]) -> [SKIP][589] ([Intel XE#656]) +28 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][590] ([Intel XE#656]) -> [SKIP][591] ([Intel XE#2351]) +26 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#1201]) -> [SKIP][593] ([Intel XE#653]) +2 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#653]) -> [SKIP][595] ([Intel XE#1201])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-lnl:          [SKIP][596] ([Intel XE#605]) -> [SKIP][597] ([Intel XE#2423])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@kms_getfb@getfb-reject-ccs.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][599] ([Intel XE#1201] / [i915#2575])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][601] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html
    - shard-lnl:          [SKIP][602] ([Intel XE#1470]) -> [SKIP][603] ([Intel XE#2423])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-lnl:          [FAIL][604] ([Intel XE#2028]) -> [SKIP][605] ([Intel XE#2423])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][607] ([Intel XE#455]) +8 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][608] ([Intel XE#2423]) -> [SKIP][609] ([Intel XE#599]) +2 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [SKIP][610] ([i915#2575]) -> [SKIP][611] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_lease@lease-revoke:
    - shard-dg2-set2:     [SKIP][612] ([i915#2575]) -> [SKIP][613] ([Intel XE#1201] / [i915#2575])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_lease@lease-revoke.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_lease@lease-revoke.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][615] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
    - shard-lnl:          [SKIP][616] ([Intel XE#498]) -> [SKIP][617] ([Intel XE#2423])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-lnl:          [SKIP][618] ([Intel XE#2423]) -> [SKIP][619] ([Intel XE#498])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          [SKIP][620] ([Intel XE#2318]) -> [SKIP][621] ([Intel XE#2423])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][623] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-lnl:          [SKIP][624] ([Intel XE#2423]) -> [SKIP][625] ([Intel XE#2318]) +1 other test skip
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][626] ([Intel XE#1201]) -> [SKIP][627] ([Intel XE#1201] / [Intel XE#870])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [SKIP][628] ([Intel XE#2351]) -> [FAIL][629] ([Intel XE#1430])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#1201]) -> [SKIP][631] ([Intel XE#1129] / [Intel XE#1201])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#908]) -> [SKIP][633] ([Intel XE#1201] / [Intel XE#908])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][634] ([Intel XE#1201]) -> [SKIP][635] ([Intel XE#1201] / [Intel XE#2446])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#1201]) -> [SKIP][637] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][638] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][639] ([Intel XE#1489]) +3 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][640] -> [SKIP][641] ([Intel XE#1201] / [Intel XE#1489])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][642] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][643] ([Intel XE#1201]) +3 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#1489]) -> [SKIP][645] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#1201]) -> [SKIP][647] ([Intel XE#1122] / [Intel XE#1201])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          [SKIP][648] ([Intel XE#2351]) -> [SKIP][649] ([Intel XE#1128])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][651] ([Intel XE#1122])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-dg2-set2:     [SKIP][652] ([Intel XE#1201]) -> [SKIP][653] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html
    - shard-lnl:          [SKIP][654] ([Intel XE#2351]) -> [SKIP][655] ([Intel XE#1406]) +3 other tests skip
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_psr@fbc-pr-primary-render.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][656] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][657] ([Intel XE#1201]) +9 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][658] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][659] ([Intel XE#929]) +7 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][660] ([Intel XE#929]) -> [SKIP][661] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][662] ([Intel XE#929]) -> [SKIP][663] ([Intel XE#1201] / [Intel XE#2351])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          [SKIP][664] ([Intel XE#1406]) -> [SKIP][665] ([Intel XE#2351]) +3 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_psr@pr-sprite-blt.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@pr-suspend:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#1201]) -> [SKIP][667] ([Intel XE#929])
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr@pr-suspend.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][668] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][669] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_psr@psr-dpms.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][670] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][671] ([Intel XE#1149])
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][672] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][673] ([Intel XE#1127])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][674] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][675] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-lnl:          [SKIP][676] ([Intel XE#1437]) -> [SKIP][677] ([Intel XE#2423]) +2 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][678] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][679] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][681] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-lnl:          [SKIP][682] ([Intel XE#2423]) -> [SKIP][683] ([Intel XE#1437]) +2 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          [SKIP][684] ([Intel XE#2423]) -> [SKIP][685] ([Intel XE#1435]) +1 other test skip
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][686] ([Intel XE#2423]) -> [SKIP][687] ([Intel XE#362])
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][688] ([i915#2575]) -> [SKIP][689] ([Intel XE#1201] / [Intel XE#1500])
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][690] ([Intel XE#2019]) -> [SKIP][691] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][692] ([Intel XE#2443]) -> [SKIP][693] ([Intel XE#2423])
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_vrr@flip-basic.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][694] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][695] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_vrr@flipline.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][696] ([Intel XE#1499] / [Intel XE#599]) -> [SKIP][697] ([Intel XE#2423])
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-lnl:          [SKIP][698] ([Intel XE#756]) -> [SKIP][699] ([Intel XE#2423])
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_writeback@writeback-check-output.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][700] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][701] ([Intel XE#1201] / [Intel XE#756])
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-lnl:          [SKIP][702] ([Intel XE#2423]) -> [SKIP][703] ([Intel XE#756])
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][704] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][705] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][706] ([Intel XE#1201] / [i915#2575]) -> [SKIP][707] ([Intel XE#1091] / [Intel XE#1201])
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          [SKIP][708] ([Intel XE#2423]) -> [SKIP][709] ([Intel XE#1091])
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          [SKIP][710] ([Intel XE#1447]) -> [SKIP][711] ([Intel XE#1130])
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@xe_compute@ccs-mode-basic.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [SKIP][712] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][713] ([Intel XE#1050])
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          [SKIP][714] ([Intel XE#1130]) -> [SKIP][715] ([Intel XE#1447])
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][716] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][717] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455])
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][718] ([Intel XE#1130]) -> [SKIP][719] ([Intel XE#1123] / [Intel XE#1201])
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][720] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][721] ([Intel XE#1130] / [Intel XE#1201])
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][722] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][723] ([Intel XE#1473] / [Intel XE#392])
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          [SKIP][724] ([Intel XE#1130]) -> [SKIP][725] ([Intel XE#688]) +6 other tests skip
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          [SKIP][726] ([Intel XE#688]) -> [SKIP][727] ([Intel XE#1130]) +6 other tests skip
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_evict@evict-large-multi-vm.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][728] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [SKIP][729] ([Intel XE#1130] / [Intel XE#1201])
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          [SKIP][730] ([Intel XE#1130]) -> [SKIP][731] ([Intel XE#1392]) +10 other tests skip
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          [SKIP][732] ([Intel XE#1392]) -> [SKIP][733] ([Intel XE#1130]) +5 other tests skip
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][734] ([Intel XE#288]) -> [SKIP][735] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-dg2-set2:     [SKIP][736] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][737] ([Intel XE#288]) +7 other tests skip
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@many-rebind:
    - shard-dg2-set2:     [SKIP][738] ([Intel XE#1130]) -> [SKIP][739] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_fault_mode@many-rebind.html
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_exec_fault_mode@many-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][740] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][741] ([Intel XE#1130] / [Intel XE#1201]) +13 other tests skip
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-fault:
    - shard-dg2-set2:     [SKIP][742] ([Intel XE#1130]) -> [SKIP][743] ([Intel XE#1201] / [Intel XE#288])
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-fault.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-fault.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][744] ([Intel XE#288]) -> [SKIP][745] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][746] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][747] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][748] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][749] ([Intel XE#288]) +3 other tests skip
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][750] ([Intel XE#2360]) -> [SKIP][751] ([Intel XE#1130] / [Intel XE#1201])
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          [SKIP][752] ([Intel XE#584]) -> [SKIP][753] ([Intel XE#1130])
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@xe_gt_freq@freq_suspend.html
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][754] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][755] ([Intel XE#255])
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][756] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][757] ([Intel XE#2229])
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][758] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][759] ([Intel XE#1201] / [Intel XE#560])
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][760] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][761] ([Intel XE#378])
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_module_load@force-load.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][762] ([Intel XE#1204] / [Intel XE#2136]) -> [DMESG-FAIL][763] ([Intel XE#2019])
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_module_load@reload-no-display.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          [SKIP][764] ([Intel XE#1130]) -> [SKIP][765] ([Intel XE#379])
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_noexec_ping_pong.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     [SKIP][766] ([Intel XE#2419]) -> [SKIP][767] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_oa@map-oa-buffer.html
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][768] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][769] ([Intel XE#2419]) +2 other tests skip
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][770] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][771] ([Intel XE#1130] / [Intel XE#1201])
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          [SKIP][772] ([Intel XE#1130]) -> [SKIP][773] ([Intel XE#977])
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_pat@pat-index-xelp.html
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][774] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][775] ([Intel XE#979])
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][776] ([Intel XE#1061] / [Intel XE#1201]) -> [FAIL][777] ([Intel XE#1173])
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_peer2peer@write.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][778] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][779] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html
    - shard-lnl:          [SKIP][780] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][781] ([Intel XE#1130]) +1 other test skip
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          [SKIP][782] ([Intel XE#2284]) -> [SKIP][783] ([Intel XE#1130])
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@xe_pm@d3cold-mocs.html
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     [SKIP][784] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][785] ([Intel XE#1130] / [Intel XE#1201])
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][786] ([Intel XE#1130]) -> [DMESG-WARN][787] ([Intel XE#1551] / [Intel XE#569])
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html
    - shard-lnl:          [SKIP][788] ([Intel XE#1130]) -> [SKIP][789] ([Intel XE#584])
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@xe_pm@s3-vm-bind-userptr.html
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][790] ([Intel XE#2019]) -> [SKIP][791] ([Intel XE#1130] / [Intel XE#1201])
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [SKIP][792] ([Intel XE#1130]) -> [ABORT][793] ([Intel XE#1794])
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][794] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][795] ([Intel XE#1130] / [Intel XE#1201])
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
    - shard-lnl:          [SKIP][796] ([Intel XE#944]) -> [SKIP][797] ([Intel XE#1130])
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][798] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][799] ([Intel XE#944])
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_query@multigpu-query-invalid-extension.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][800] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][801] ([Intel XE#1201] / [Intel XE#944])
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@xe_query@multigpu-query-topology.html
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          [SKIP][802] ([Intel XE#1130]) -> [SKIP][803] ([Intel XE#944]) +2 other tests skip
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][804] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][805] ([Intel XE#944]) +1 other test skip
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
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
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2376
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2428
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2444
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_7952 -> IGTPW_11522
  * Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -> xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a

  IGTPW_11522: 11522
  IGT_7952: 7952
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
  xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a: 974ee82a5f44e91fd93895cc12fb1e76e55b229a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/index.html

--===============3373124068684353545==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136499/">https://patchwork.freedesktop.org/series/136499/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7952_full -&gt; XEIGTPW_11522_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11522_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11522_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11522_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_plane_cursor@primary.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251">Intel XE#2251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_content_protection@atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-2/igt@kms_content_protection@legacy.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@kms_content_protection@uevent.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3}:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2444">Intel XE#2444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2444">Intel XE#2444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@kms_vrr@flip-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-2/igt@xe_copy_basic@mem-set-linear-0x369.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11522_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_atomic@crtc-invalid-params.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_atomic@crtc-invalid-params.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_exec_threads@threads-bal-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_exec_threads@threads-bal-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_oa@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@xe_oa@stress-open-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_oa@stress-open-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_pm@d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@xe_query@query-uc-fw-version-guc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_query@query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +103 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@core_getversion@basic.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> +3 other tests pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2444">Intel XE#2444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_color@ctm-negative.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_plane_multiple@tiling-4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@kms_plane_multiple@tiling-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +2 other tests pass</li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-4/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_psr@psr2-suspend.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-1/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@virtual-all-active:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@xe_exec_balancer@virtual-all-active.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-2/igt@xe_exec_balancer@virtual-all-active.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@xe_pm@d3hot-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-bmg-3/igt@xe_pm@d3hot-mocs.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html">PASS</a> +80 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-16777216:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@xe_vm@large-split-binds-16777216.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@xe_vm@large-split-binds-16777216.html">PASS</a> +92 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) +1 other test abort</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_lease@lease-revoke.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_lease@lease-revoke.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-3/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_fault_mode@many-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_exec_fault_mode@many-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-4/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-433/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-8/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-435/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-6/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-6/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-7/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-436/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7952 -&gt; IGTPW_11522</li>
<li>Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -&gt; xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a</li>
</ul>
<p>IGTPW_11522: 11522<br />
  IGT_7952: 7952<br />
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5<br />
  xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a: 974ee82a5f44e91fd93895cc12fb1e76e55b229a</p>

</body>
</html>

--===============3373124068684353545==--
