Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785DFC3ABA2
	for <igt-dev@archiver.kernel.org>; Mon, 16 Sep 2024 14:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C81F10E383;
	Mon, 16 Sep 2024 14:05:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBB710E04B;
 Mon, 16 Sep 2024 14:05:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7217660716492687591=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=3A_drm=5Ffdinfo=3A_Fix_?=
 =?utf-8?q?zero_tolerance_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Sep 2024 14:05:36 -0000
Message-ID: <172649553650.1018682.306101261476603866@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240916090329.5279-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240916090329.5279-1-janusz.krzysztofik@linux.intel.com>
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

--===============7217660716492687591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests: drm_fdinfo: Fix zero tolerance checks
URL   : https://patchwork.freedesktop.org/series/138704/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8020_full -> XEIGTPW_11745_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11745_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11745_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11745_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_plane_cursor@overlay:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-5/igt@kms_plane_cursor@overlay.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_plane_cursor@overlay.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - {shard-bmg}:        [FAIL][5] ([Intel XE#2333]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@xe_vm@large-userptr-misaligned-binds-8388608:
    - {shard-bmg}:        [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-8388608.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-7/igt@xe_vm@large-userptr-misaligned-binds-8388608.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11745_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#1201] / [i915#6077]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#599])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#1201] / [Intel XE#829]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#1659])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1195]) +2 other tests incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#373])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-2/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1424])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-5/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#877]) +2 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#886]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1401] / [Intel XE#1745])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1401])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#656]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-lnl:          [PASS][29] -> [INCOMPLETE][30] ([Intel XE#2050])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#1201]) +18 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_lease@lease-invalid-crtc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
    - shard-lnl:          [PASS][33] -> [DMESG-WARN][34] ([Intel XE#324]) +2 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][35] -> [DMESG-FAIL][36] ([Intel XE#324]) +2 other tests dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#718])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1406])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#1649]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-3/igt@kms_psr@psr2-sprite-render.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-7/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1127])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][43] -> [FAIL][44] ([Intel XE#771] / [Intel XE#899])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#899])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#2443]) +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-5/igt@kms_vrr@flip-basic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#1522]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-7/igt@kms_vrr@flip-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-4/igt@kms_vrr@flip-dpms.html

  * igt@xe_evict@evict-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#688])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@xe_evict@evict-large-cm.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][52] -> [TIMEOUT][53] ([Intel XE#2105])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#1204] / [Intel XE#2136])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][56] -> [ABORT][57] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][58] -> [ABORT][59] ([Intel XE#2310] / [Intel XE#2317])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - {shard-bmg}:        [FAIL][60] ([Intel XE#1426]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][62] ([Intel XE#886]) -> [PASS][63] +2 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_force_connector_basic@force-edid:
    - {shard-bmg}:        [DMESG-WARN][64] ([Intel XE#877]) -> [PASS][65] +8 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-8/igt@kms_force_connector_basic@force-edid.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-1/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][66] ([Intel XE#899]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][68] ([Intel XE#1551]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][70] ([Intel XE#2443]) -> [PASS][71] +3 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-8/igt@kms_vrr@flipline.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][72] ([Intel XE#1473]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][74] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][76] ([Intel XE#1473]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][78] ([Intel XE#2514]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
    - {shard-bmg}:        [FAIL][80] ([Intel XE#2514]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][82] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#455]) -> [SKIP][85] ([Intel XE#1201])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][87] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#316]) -> [SKIP][89] ([Intel XE#1201] / [Intel XE#316])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][91] ([Intel XE#316])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1124]) -> [SKIP][93] ([Intel XE#1201] / [Intel XE#829])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][95] ([Intel XE#1124]) +6 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#619]) -> [SKIP][97] ([Intel XE#1201] / [Intel XE#619])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][99] ([Intel XE#1201] / [Intel XE#829])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#829])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1124]) -> [SKIP][103] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][105] ([Intel XE#346])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#367]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#367])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][109] ([Intel XE#1201])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][111] ([Intel XE#367]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#2191]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#2191])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][119] ([Intel XE#787]) +48 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#829])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#787]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][125] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#306]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_chamelium_color@gamma.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][129] ([Intel XE#373]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][131] ([Intel XE#1201])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#373]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#373]) -> [SKIP][135] ([Intel XE#1201]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][136] ([Intel XE#1178] / [Intel XE#1204]) -> [SKIP][137] ([Intel XE#1201])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][139] ([Intel XE#455]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_content_protection@lic-type-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][141] ([Intel XE#308]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#308]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][145] ([Intel XE#1201]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [i915#3804]) -> [SKIP][147] ([i915#3804])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1137]) -> [SKIP][149] ([Intel XE#1137] / [Intel XE#1201])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1135]) -> [SKIP][151] ([Intel XE#1135] / [Intel XE#1201])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_feature_discovery@psr1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][152] ([Intel XE#1504]) -> [TIMEOUT][153] ([Intel XE#1504]) +1 other test timeout
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-3/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#455]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][157] ([Intel XE#1201]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#651]) -> [SKIP][159] ([Intel XE#1201])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#651]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][163] ([Intel XE#651]) +16 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][165] ([Intel XE#1201]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#783]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][169] ([Intel XE#653]) +12 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#653]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#783])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#653]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#829])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_plane_lowres@tiling-yf.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +13 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201]) -> [SKIP][179] ([Intel XE#2763]) +8 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][181] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#2763]) +20 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1122]) -> [SKIP][185] ([Intel XE#1122] / [Intel XE#1201])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1489]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][189] ([Intel XE#1201])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][191] ([Intel XE#1489]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][193] ([Intel XE#1122])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][195] ([Intel XE#929]) +8 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#929]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][199] ([Intel XE#1201]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][201] ([Intel XE#1149])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#829])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#327]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#327])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][207] ([Intel XE#327]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][209] ([Intel XE#756])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][211] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][213] ([Intel XE#1123])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1123]) -> [SKIP][215] ([Intel XE#1123] / [Intel XE#1201])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][217] ([Intel XE#288]) +17 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#288]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#288]) +20 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][221] ([Intel XE#378])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@xe_module_load@force-load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2541]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][225] ([Intel XE#2541]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][227] ([Intel XE#979])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][231] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#579]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#579])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#944]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][237] ([Intel XE#944]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_query@multigpu-query-topology.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_8020 -> IGTPW_11745
  * Linux: xe-1951-7a8eccb85643c21e82007be3ae31bbca47611079 -> xe-1953-cc4f651bb61d44e9eefb0712d43052e5cb14f8e3

  IGTPW_11745: 11745
  IGT_8020: 7860f9a9394da0a18fc0bf0223a79b533e569f95 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1951-7a8eccb85643c21e82007be3ae31bbca47611079: 7a8eccb85643c21e82007be3ae31bbca47611079
  xe-1953-cc4f651bb61d44e9eefb0712d43052e5cb14f8e3: cc4f651bb61d44e9eefb0712d43052e5cb14f8e3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/index.html

--===============7217660716492687591==
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
<tr><td><b>Series:</b></td><td>tests: drm_fdinfo: Fix zero tolerance checks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138704/">https://patchwork.freedesktop.org/series/138704/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8020_full -&gt; XEIGTPW_11745_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11745_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11745_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11745_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a6-dp4.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-5/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_plane_cursor@overlay.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-8388608:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-8388608.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-7/igt@xe_vm@large-userptr-misaligned-binds-8388608.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11745_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-5/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_lease@lease-invalid-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-3/igt@kms_psr@psr2-sprite-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-7/igt@kms_psr@psr2-sprite-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-5/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-7/igt@kms_vrr@flip-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-4/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-8/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-1/igt@kms_force_connector_basic@force-edid.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-8/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@kms_vrr@flipline.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html">PASS</a></li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-lnl-3/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8020/shard-dg2-463/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11745/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8020 -&gt; IGTPW_11745</li>
<li>Linux: xe-1951-7a8eccb85643c21e82007be3ae31bbca47611079 -&gt; xe-1953-cc4f651bb61d44e9eefb0712d43052e5cb14f8e3</li>
</ul>
<p>IGTPW_11745: 11745<br />
  IGT_8020: 7860f9a9394da0a18fc0bf0223a79b533e569f95 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1951-7a8eccb85643c21e82007be3ae31bbca47611079: 7a8eccb85643c21e82007be3ae31bbca47611079<br />
  xe-1953-cc4f651bb61d44e9eefb0712d43052e5cb14f8e3: cc4f651bb61d44e9eefb0712d43052e5cb14f8e3</p>

</body>
</html>

--===============7217660716492687591==--
