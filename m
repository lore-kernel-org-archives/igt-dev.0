Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2C8C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 23:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9633B10E2B9;
	Fri, 14 Jun 2024 23:06:40 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C2310E2B9;
 Fri, 14 Jun 2024 23:06:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5805767502548274008=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_IGT_KMS_Test_cleanup_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Jun 2024 23:06:26 -0000
Message-ID: <171840638642.80112.2736514948839656184@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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

--===============5805767502548274008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT KMS Test cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/134685/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7889_full -> XEIGTPW_11258_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11258_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - {shard-lnl}:        [SKIP][1] ([Intel XE#656]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - {shard-lnl}:        [PASS][4] -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@psr2-suspend:
    - {shard-lnl}:        [PASS][6] -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-4/igt@kms_psr@psr2-suspend.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-1/igt@kms_psr@psr2-suspend.html

  * igt@xe_exec_basic@many-execqueues-null:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-3/igt@xe_exec_basic@many-execqueues-null.html

  
New tests
---------

  New tests have been introduced between XEIGT_7889_full and XEIGTPW_11258_full:

### New IGT tests (45) ###

  * igt@kms_properties@connector-properties-atomic@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.35] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_properties@connector-properties-atomic@pipe-none-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-atomic@pipe-none-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-atomic@pipe-none-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_properties@connector-properties-atomic@pipe-none-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-8:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.99] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_properties@connector-properties-legacy@pipe-none-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-legacy@pipe-none-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-legacy@pipe-none-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-legacy@pipe-none-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-legacy@pipe-none-hdmi-a-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-legacy@pipe-none-hdmi-a-7:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@connector-properties-legacy@pipe-none-hdmi-a-8:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@crtc-properties-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_properties@crtc-properties-atomic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_properties@crtc-properties-atomic@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_properties@crtc-properties-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_properties@crtc-properties-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_properties@crtc-properties-atomic@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_properties@crtc-properties-atomic@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_properties@crtc-properties-legacy@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_properties@crtc-properties-legacy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_properties@crtc-properties-legacy@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_properties@crtc-properties-legacy@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_properties@crtc-properties-legacy@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_properties@crtc-properties-legacy@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_properties@crtc-properties-legacy@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_properties@plane-properties-atomic@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_properties@plane-properties-atomic@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11258_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][9] -> [FAIL][10] ([Intel XE#827]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][11] -> [INCOMPLETE][12] ([Intel XE#1195])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#373])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#653])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#870])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][23] -> [FAIL][24] ([Intel XE#771] / [Intel XE#899])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][25] -> [FAIL][26] ([Intel XE#899])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#1551]) +2 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][29] -> [TIMEOUT][30] ([Intel XE#1473] / [Intel XE#392])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#288])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#1192] / [Intel XE#1201])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#944])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [DMESG-WARN][35] ([Intel XE#1214]) -> [PASS][36] +1 other test pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][37] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][39] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][40] +8 other tests pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - {shard-lnl}:        [FAIL][41] -> [PASS][42] +1 other test pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][43] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - {shard-lnl}:        [DMESG-WARN][45] -> [PASS][46] +2 other tests pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][47] ([Intel XE#361]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_create@create-contexts:
    - shard-dg2-set2:     [INCOMPLETE][49] ([Intel XE#1195]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@xe_create@create-contexts.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-433/igt@xe_create@create-contexts.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-dg2-set2:     [FAIL][51] ([Intel XE#1069]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-small.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][53] ([Intel XE#1473]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][55] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-464/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][57] ([Intel XE#2105]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][61] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [PASS][62] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][63] ([Intel XE#1214] / [Intel XE#569]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][65] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][66] ([Intel XE#1214] / [Intel XE#1551])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][68] ([Intel XE#1201] / [Intel XE#362])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#1760])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-435/igt@xe_wedged@basic-wedged.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_7889 -> IGTPW_11258

  IGTPW_11258: 11258
  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2: 00e9498b453447a5afe527bd0e174587b12f66d2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/index.html

--===============5805767502548274008==
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
<tr><td><b>Series:</b></td><td>IGT KMS Test cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134685/">https://patchwork.freedesktop.org/series/134685/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7889_full -&gt; XEIGTPW_11258_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11258_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-4/igt@kms_psr@psr2-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-1/igt@kms_psr@psr2-suspend.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-3/igt@xe_exec_basic@many-execqueues-null.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7889_full and XEIGTPW_11258_full:</p>
<h3>New IGT tests (45)</h3>
<ul>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-none-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-none-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-none-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-none-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-none-hdmi-a-8:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-none-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-none-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-none-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-none-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-none-hdmi-a-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-none-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-none-hdmi-a-8:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11258_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-contexts:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@xe_create@create-contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-433/igt@xe_create@create-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-433/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-464/igt@xe_evict@evict-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/shard-dg2-435/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11258/shard-dg2-463/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7889 -&gt; IGTPW_11258</li>
</ul>
<p>IGTPW_11258: 11258<br />
  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2: 00e9498b453447a5afe527bd0e174587b12f66d2</p>

</body>
</html>

--===============5805767502548274008==--
