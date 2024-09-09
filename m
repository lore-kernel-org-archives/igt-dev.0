Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9BEECE585
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 18:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A7C10E631;
	Mon,  9 Sep 2024 18:27:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B8310E63C;
 Mon,  9 Sep 2024 18:27:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3848642987319160265=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_RFC_tests/intel/kms=5Ffrontbu?=
 =?utf-8?q?ffer=5Ftracking=3A_Introduce_plane-fbc-dr_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Sep 2024 18:27:06 -0000
Message-ID: <172590642641.977607.6841159496334603177@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
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

--===============3848642987319160265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test (rev2)
URL   : https://patchwork.freedesktop.org/series/138218/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8011_full -> XEIGTPW_11713_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11713_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_frontbuffer_tracking@plane-fbc-dr} (NEW):
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-dr.html
    - shard-lnl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_frontbuffer_tracking@plane-fbc-dr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_ccs@suspend-resume:
    - {shard-bmg}:        [PASS][3] -> [INCOMPLETE][4] +5 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-1/igt@xe_ccs@suspend-resume.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-1/igt@xe_ccs@suspend-resume.html

  
New tests
---------

  New tests have been introduced between XEIGT_8011_full and XEIGTPW_11713_full:

### New IGT tests (1) ###

  * igt@kms_frontbuffer_tracking@plane-fbc-dr:
    - Statuses : 3 incomplete(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11713_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-lnl:          [PASS][5] -> [SKIP][6] ([Intel XE#1885])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-5/igt@core_hotunplug@hotrebind-lateclose.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_atomic@crtc-invalid-params:
    - shard-lnl:          [PASS][7] -> [SKIP][8] ([Intel XE#2423]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@kms_atomic@crtc-invalid-params.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_atomic@crtc-invalid-params.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#1659])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][11] ([Intel XE#1725])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#367])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#787]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#373])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#599])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-4/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1424])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#308])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#323])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] ([Intel XE#877]) +1 other test dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#886]) +2 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#651]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#656]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#653])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * {igt@kms_frontbuffer_tracking@plane-fbc-dr} (NEW):
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][31] ([Intel XE#1195])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-dr.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#653])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [PASS][33] -> [SKIP][34] ([Intel XE#2351]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1503] / [Intel XE#599])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:
    - shard-lnl:          [PASS][36] -> [DMESG-WARN][37] ([Intel XE#324]) +2 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#361])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [PASS][40] -> [SKIP][41] ([Intel XE#2446])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#1649]) +3 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-move.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#327])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#362])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#771] / [Intel XE#899])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#899])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_vrr@flip-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#1522]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-5/igt@kms_vrr@flipline.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-2/igt@kms_vrr@flipline.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#1195]) +1 other test incomplete
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_ccs@suspend-resume.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@xe_ccs@suspend-resume.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#288]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - shard-lnl:          [PASS][56] -> [SKIP][57] ([Intel XE#1130]) +11 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][58] -> [DMESG-FAIL][59] ([Intel XE#1620] / [Intel XE#1760])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#1999]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@xe_live_ktest@xe_bo.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#2249])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][64] ([Intel XE#2249])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#979])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#1195] / [Intel XE#569])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][68] ([Intel XE#911]) -> [PASS][69] +3 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][70] ([Intel XE#1426]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - {shard-bmg}:        [DMESG-WARN][72] ([Intel XE#877]) -> [PASS][73] +5 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - {shard-bmg}:        [FAIL][74] ([Intel XE#2436]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_color@deep-color:
    - {shard-bmg}:        [INCOMPLETE][76] -> [PASS][77] +2 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-5/igt@kms_color@deep-color.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-8/igt@kms_color@deep-color.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - {shard-bmg}:        [FAIL][78] -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][80] ([Intel XE#324]) -> [PASS][81] +2 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@kms_plane@plane-position-covered.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-3/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - shard-lnl:          [DMESG-WARN][82] ([Intel XE#324]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][84] ([Intel XE#899]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][86] ([Intel XE#2443]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_vrr@max-min.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-6/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][88] ([Intel XE#1473]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][90] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][92] ([Intel XE#958]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#316]) -> [SKIP][95] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-lnl:          [SKIP][96] ([Intel XE#1407]) -> [SKIP][97] ([Intel XE#2351])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][99] ([Intel XE#316]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1124]) -> [SKIP][101] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][103] ([Intel XE#1124]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#610]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#610])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#367]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#367])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][109] ([Intel XE#2191]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][111] ([Intel XE#367])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1252]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#1252])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-lnl:          [SKIP][114] ([Intel XE#1399]) -> [SKIP][115] ([Intel XE#2351]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][117] ([Intel XE#1252])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][121] ([Intel XE#787]) +48 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][123] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#787]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][127] ([Intel XE#314])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][129] ([Intel XE#306]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-lnl:          [SKIP][130] ([Intel XE#373]) -> [SKIP][131] ([Intel XE#2423])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#373]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][135] ([Intel XE#373]) +8 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#307]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#308]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#308])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#455]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][143] ([Intel XE#308])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          [SKIP][144] ([Intel XE#309]) -> [SKIP][145] ([Intel XE#2423]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][146] ([Intel XE#703]) -> [SKIP][147] ([Intel XE#2423])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@kms_feature_discovery@display-3x.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1135]) -> [SKIP][149] ([Intel XE#1135] / [Intel XE#1201]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_feature_discovery@psr1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][151] ([Intel XE#455]) +12 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#651]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][154] ([Intel XE#656]) -> [SKIP][155] ([Intel XE#2351]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][157] ([Intel XE#651]) +23 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - shard-lnl:          [SKIP][158] ([Intel XE#651]) -> [SKIP][159] ([Intel XE#2351]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1158]) -> [SKIP][161] ([Intel XE#1158] / [Intel XE#1201])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][163] ([Intel XE#653]) +23 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#653]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][167] ([Intel XE#605])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#498]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#498]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][173] ([Intel XE#2318]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][175] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#870]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#870])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][179] ([Intel XE#1129])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#908]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#908])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1489]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][185] ([Intel XE#1489]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1122]) -> [SKIP][187] ([Intel XE#1122] / [Intel XE#1201])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#929]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][191] ([Intel XE#929]) +10 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          [SKIP][192] ([Intel XE#1406]) -> [SKIP][193] ([Intel XE#2351])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_psr@pr-no-drrs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][195] ([Intel XE#1149])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][197] ([Intel XE#327]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1127]) -> [SKIP][199] ([Intel XE#1127] / [Intel XE#1201])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][201] ([Intel XE#1127])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#327]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][205] ([Intel XE#1729])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][207] ([Intel XE#330])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-lnl:          [SKIP][208] ([Intel XE#756]) -> [SKIP][209] ([Intel XE#2423])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][211] ([Intel XE#756]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#756]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#756])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1091]) -> [SKIP][215] ([Intel XE#1091] / [Intel XE#1201]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][219] ([Intel XE#1123]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][221] ([Intel XE#1126])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1126]) -> [SKIP][223] ([Intel XE#1126] / [Intel XE#1201])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          [SKIP][224] ([Intel XE#688]) -> [SKIP][225] ([Intel XE#1130]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][227] ([Intel XE#288]) +19 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#288]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#288]) +21 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][231] ([Intel XE#2360])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          [SKIP][232] ([Intel XE#2229]) -> [FAIL][233] ([Intel XE#1999])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][235] ([Intel XE#2229])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2541]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][239] ([Intel XE#2541]) +5 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#977]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#977])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][243] ([Intel XE#2284] / [Intel XE#366])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#944]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#944])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][247] ([Intel XE#944])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
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
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8011 -> IGTPW_11713
  * Linux: xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a -> xe-1910-3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6

  IGTPW_11713: 9107fbd6df3a209334b29eb73a82d393d61ad44d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a: 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a
  xe-1910-3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6: 3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/index.html

--===============3848642987319160265==
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
<tr><td><b>Series:</b></td><td>RFC tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138218/">https://patchwork.freedesktop.org/series/138218/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8011_full -&gt; XEIGTPW_11713_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11713_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_frontbuffer_tracking@plane-fbc-dr} (NEW):<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-dr.html">INCOMPLETE</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_frontbuffer_tracking@plane-fbc-dr.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_ccs@suspend-resume:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-1/igt@xe_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-1/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8011_full and XEIGTPW_11713_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_frontbuffer_tracking@plane-fbc-dr:<ul>
<li>Statuses : 3 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11713_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-5/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@kms_atomic@crtc-invalid-params.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_atomic@crtc-invalid-params.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@plane-fbc-dr} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-dr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-5/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-2/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-5/igt@kms_color@deep-color.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-8/igt@kms_color@deep-color.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-3/igt@kms_plane@plane-position-covered.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-6/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8011 -&gt; IGTPW_11713</li>
<li>Linux: xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a -&gt; xe-1910-3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6</li>
</ul>
<p>IGTPW_11713: 9107fbd6df3a209334b29eb73a82d393d61ad44d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a: 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a<br />
  xe-1910-3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6: 3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6</p>

</body>
</html>

--===============3848642987319160265==--
