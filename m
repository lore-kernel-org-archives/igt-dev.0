Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082B5C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915610EA59;
	Thu, 27 Jun 2024 07:41:14 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074BE10EA63;
 Thu, 27 Jun 2024 07:41:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2193830832066264693=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_New_test_to_validate_link-off?=
 =?utf-8?q?_between_active_regions_=28LOBF=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Jun 2024 07:41:13 -0000
Message-ID: <171947407302.163598.12897091451223072021@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626191537.1507452-1-jeevan.b@intel.com>
In-Reply-To: <20240626191537.1507452-1-jeevan.b@intel.com>
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

--===============2193830832066264693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New test to validate link-off between active regions (LOBF)
URL   : https://patchwork.freedesktop.org/series/135446/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7904_full -> XEIGTPW_11322_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11322_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11322_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11322_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_sequence@queue-idle@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@kms_sequence@queue-idle@pipe-b-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_sequence@queue-idle@pipe-b-hdmi-a-6.html

  * {igt@kms_vrr@lobf} (NEW):
    - {shard-lnl}:        NOTRUN -> [CRASH][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-7/igt@kms_vrr@lobf.html

  * {igt@kms_vrr@lobf@pipe-a-edp-1} (NEW):
    - {shard-lnl}:        NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-7/igt@kms_vrr@lobf@pipe-a-edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - {shard-lnl}:        [SKIP][5] ([Intel XE#1124]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * {igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p}:
    - {shard-lnl}:        NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  
New tests
---------

  New tests have been introduced between XEIGT_7904_full and XEIGTPW_11322_full:

### New IGT tests (2) ###

  * igt@kms_vrr@lobf:
    - Statuses : 1 crash(s) 1 skip(s)
    - Exec time: [0.0, 2.68] s

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [2.51] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11322_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#308])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][17] ([Intel XE#616])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][18] ([Intel XE#1551]) +1 other test dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#323])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#877])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-434/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#1195]) +4 other tests incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#1195] / [Intel XE#2049])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][28] -> [FAIL][29] ([Intel XE#616]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#870])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_pm_backlight@fade.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1122] / [Intel XE#1201])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1149] / [Intel XE#1201])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#327])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_sequence@queue-idle:
    - shard-dg2-set2:     [PASS][39] -> [ABORT][40] ([Intel XE#1553])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@kms_sequence@queue-idle.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_sequence@queue-idle.html

  * igt@kms_sequence@queue-idle@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#1214] / [Intel XE#1553])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@kms_sequence@queue-idle@pipe-b-dp-4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_sequence@queue-idle@pipe-b-dp-4.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1500])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#771] / [Intel XE#899])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#899])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * {igt@kms_vrr@lobf} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#756])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1126] / [Intel XE#1201])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][52] -> [TIMEOUT][53] ([Intel XE#1473] / [Intel XE#392])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-large-external:
    - shard-dg2-set2:     [PASS][54] -> [INCOMPLETE][55] ([Intel XE#1195] / [Intel XE#1473]) +2 other tests incomplete
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-435/igt@xe_evict@evict-large-external.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@xe_evict@evict-large-external.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][56] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [PASS][58] -> [DMESG-WARN][59] ([Intel XE#1214] / [Intel XE#2046])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#1173]) +3 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#366])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [PASS][62] -> [DMESG-WARN][63] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [PASS][64] -> [DMESG-WARN][65] ([Intel XE#1214]) +6 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-463/igt@xe_pm@s4-basic-exec.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@xe_pm@s4-basic-exec.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [DMESG-WARN][66] ([Intel XE#1214]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - {shard-lnl}:        [FAIL][68] ([Intel XE#1659]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [INCOMPLETE][72] ([Intel XE#1150] / [Intel XE#1195]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][74] ([Intel XE#1195]) -> [PASS][75] +2 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_psr@fbc-psr-suspend@edp-1:
    - {shard-lnl}:        [DMESG-WARN][78] ([Intel XE#2052]) -> [PASS][79] +6 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-7/igt@kms_psr@fbc-psr-suspend@edp-1.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][80] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][82] ([Intel XE#2105]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-435/igt@xe_live_ktest@xe_bo.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][86] ([Intel XE#1214] / [Intel XE#569]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@xe_pm@s3-vm-bind-prefetch.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [INCOMPLETE][88] ([Intel XE#1195]) -> [FAIL][89] ([Intel XE#1178])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_content_protection@legacy.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-FAIL][90] -> [FAIL][91] ([Intel XE#1178])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][92] ([Intel XE#1214]) -> [INCOMPLETE][93] ([Intel XE#1195])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][94] ([Intel XE#1214] / [Intel XE#1551]) -> [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][97] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
  [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * IGT: IGT_7904 -> IGTPW_11322
  * Linux: xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954 -> xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada

  IGTPW_11322: 150ef53ebad688eb29c91c116c66131f358abd85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7904: f13702b8e4e847c56da3ef6f0969065d686049c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954: c02b84a0d04c551044f5b479e6599692c7c1f954
  xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada: 39235fee2ef6c0933097ee921c86a676dba72ada

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/index.html

--===============2193830832066264693==
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
<tr><td><b>Series:</b></td><td>New test to validate link-off between active regions (LOBF)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135446/">https://patchwork.freedesktop.org/series/135446/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7904_full -&gt; XEIGTPW_11322_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11322_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11322_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11322_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_sequence@queue-idle@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@kms_sequence@queue-idle@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_sequence@queue-idle@pipe-b-hdmi-a-6.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@lobf} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-7/igt@kms_vrr@lobf.html">CRASH</a></li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@lobf@pipe-a-edp-1} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-7/igt@kms_vrr@lobf@pipe-a-edp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p}:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7904_full and XEIGTPW_11322_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>Statuses : 1 crash(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11322_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-434/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@kms_sequence@queue-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_sequence@queue-idle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@kms_sequence@queue-idle@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-435/igt@kms_sequence@queue-idle@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@lobf} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-435/igt@xe_evict@evict-large-external.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-463/igt@xe_evict@evict-large-external.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046">Intel XE#2046</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-463/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_flip@blocking-absolute-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend@edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052">Intel XE#2052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-lnl-7/igt@kms_psr@fbc-psr-suspend@edp-1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-435/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-464/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7904 -&gt; IGTPW_11322</li>
<li>Linux: xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954 -&gt; xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada</li>
</ul>
<p>IGTPW_11322: 150ef53ebad688eb29c91c116c66131f358abd85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7904: f13702b8e4e847c56da3ef6f0969065d686049c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954: c02b84a0d04c551044f5b479e6599692c7c1f954<br />
  xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada: 39235fee2ef6c0933097ee921c86a676dba72ada</p>

</body>
</html>

--===============2193830832066264693==--
