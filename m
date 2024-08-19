Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D93C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 12:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9801710E261;
	Mon, 19 Aug 2024 12:44:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424CB10E261;
 Mon, 19 Aug 2024 12:44:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7039062102437148829=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_add_test_to_validate_fallback?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 19 Aug 2024 12:44:12 -0000
Message-ID: <172407145225.694758.4218342556884862615@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
In-Reply-To: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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

--===============7039062102437148829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate fallback (rev3)
URL   : https://patchwork.freedesktop.org/series/134660/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7975_full -> XEIGTPW_11593_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11593_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11593_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11593_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_fallback@dp-fallback (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_fallback@dp-fallback.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-dg2-set2:     [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-180.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@xe_pm@s2idle-basic:
    - shard-lnl:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@xe_pm@s2idle-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@xe_pm@s2idle-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - {shard-bmg}:        [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - {shard-bmg}:        [FAIL][10] ([Intel XE#2141]) -> [FAIL][11] +2 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  
New tests
---------

  New tests have been introduced between XEIGT_7975_full and XEIGTPW_11593_full:

### New IGT tests (1) ###

  * igt@kms_fallback@dp-fallback:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 10.44] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11593_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#1659]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1399]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#599])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1195])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1421])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#886]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#656]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#651])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#2028] / [Intel XE#2533]) +2 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_backlight@fade:
    - shard-lnl:          [PASS][28] -> [SKIP][29] ([Intel XE#870])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_pm_backlight@fade.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#718])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#1430])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#1649]) +3 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#2028]) +5 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#2443]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_vrr@max-min.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#756])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1392])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][42] -> [TIMEOUT][43] ([Intel XE#2105])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][44] -> [DMESG-WARN][45] ([Intel XE#1620])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [PASS][46] -> [SKIP][47] ([Intel XE#1192])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@xe_live_ktest@xe_bo.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#2229])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#2019]) +2 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_module_load@reload.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_module_load@reload.html

  * igt@xe_oa@oa-exponents:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#2541])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2284] / [Intel XE#366])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-6/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][53] -> [DMESG-WARN][54] ([Intel XE#1162] / [Intel XE#569])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [FAIL][55] ([Intel XE#827]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][57] ([Intel XE#1033]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][59] ([Intel XE#827]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][61] ([Intel XE#1426]) -> [PASS][62] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][63] ([Intel XE#1659]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][65] ([Intel XE#877]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [FAIL][67] ([Intel XE#2422] / [Intel XE#886]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [FAIL][69] ([Intel XE#2422]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][71] ([Intel XE#886]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-lnl:          [FAIL][73] ([Intel XE#1901]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-lnl:          [FAIL][75] ([Intel XE#1901] / [Intel XE#2028]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-lnl:          [DMESG-WARN][77] -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][79] ([Intel XE#324]) -> [PASS][80] +5 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#361]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][83] ([Intel XE#771] / [Intel XE#899]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][85] ([Intel XE#899]) -> [PASS][86] +2 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][87] ([Intel XE#899]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [FAIL][89] ([Intel XE#2028]) -> [PASS][90] +5 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#2019] / [Intel XE#2226]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [FAIL][93] ([Intel XE#2443]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][95] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][97] ([Intel XE#1473]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][99] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - {shard-bmg}:        [FAIL][101] ([Intel XE#2343]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - shard-lnl:          [FAIL][103] ([Intel XE#2343]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1192]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [DMESG-WARN][109] ([Intel XE#2019]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_module_load@many-reload.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-regs-whitelisted:
    - {shard-bmg}:        [FAIL][111] ([Intel XE#2514]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-3/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          [FAIL][113] ([Intel XE#2514]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-lnl:          [FAIL][115] -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][117] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-lnl:          [FAIL][119] ([Intel XE#2028] / [Intel XE#2512]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:
    - {shard-bmg}:        [DMESG-WARN][121] ([Intel XE#877]) -> [PASS][122] +4 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#873]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#873])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#316]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][128] ([Intel XE#316]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#610]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#610])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1124]) -> [SKIP][132] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][134] ([Intel XE#1124]) +9 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][136] ([Intel XE#367]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#2191]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#2191])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#367]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#787]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1252]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#1252])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][148] ([Intel XE#787]) +83 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][152] ([Intel XE#314])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#314]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][156] ([Intel XE#306]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#306]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#306])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][160] ([Intel XE#373]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#373]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][164] ([Intel XE#307])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][166] ([Intel XE#308]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][168] ([Intel XE#323]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][169] ([i915#3804]) -> [SKIP][170] ([Intel XE#1201] / [i915#3804])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][172] ([Intel XE#1137])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][174] ([Intel XE#1135])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_feature_discovery@psr1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1135]) -> [SKIP][176] ([Intel XE#1135] / [Intel XE#1201])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_feature_discovery@psr2.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#455]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][180] ([Intel XE#455]) +18 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [i915#5274]) -> [SKIP][182] ([i915#5274])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][184] ([Intel XE#651]) +22 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#651]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][188] ([Intel XE#658])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][190] ([Intel XE#653]) +26 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#653]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#356]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#356])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#498]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][200] ([Intel XE#2318]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][202] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2318]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][208] ([Intel XE#870])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1122]) -> [SKIP][210] ([Intel XE#1122] / [Intel XE#1201])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][212] ([Intel XE#1489]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1489]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][216] ([Intel XE#1122]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#929]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][220] ([Intel XE#929]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][222] ([Intel XE#327]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#362])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][226] ([Intel XE#2168])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_vrr@lobf.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][228] ([Intel XE#756])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1091]) -> [SKIP][230] ([Intel XE#1091] / [Intel XE#1201])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][232] ([Intel XE#1123])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][233] ([Intel XE#1473]) -> [INCOMPLETE][234] ([Intel XE#1195] / [Intel XE#1473])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][235] ([Intel XE#1473]) -> [FAIL][236] ([Intel XE#1000])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#288]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][240] ([Intel XE#288]) +22 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2360]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#2360])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][244] ([Intel XE#255])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][245] ([Intel XE#1999]) -> [SKIP][246] ([Intel XE#1192] / [Intel XE#1201])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2541]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_oa@disabled-read-error.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][250] ([Intel XE#2541]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@xe_oa@polling-small-buf.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][252] ([Intel XE#979])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][256] ([Intel XE#2284])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#944]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][260] ([Intel XE#944]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][262] ([Intel XE#1760])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_wedged@basic-wedged.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-WARN][263] ([Intel XE#1760]) -> [SKIP][264] ([Intel XE#1130] / [Intel XE#1201])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2422
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2512
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7975 -> IGTPW_11593
  * Linux: xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c -> xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94

  IGTPW_11593: 11593
  IGT_7975: 7975
  xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c: d6dac3db19935f5939cbb033eea30c90bdf3888c
  xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94: 02f693a1a747b2784cedbbd7f6cf35be9a652d94

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/index.html

--===============7039062102437148829==
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
<tr><td><b>Series:</b></td><td>add test to validate fallback (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134660/">https://patchwork.freedesktop.org/series/134660/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7975_full -&gt; XEIGTPW_11593_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11593_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11593_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11593_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_fallback@dp-fallback (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-180.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@xe_pm@s2idle-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-180.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7975_full and XEIGTPW_11593_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_fallback@dp-fallback:<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 10.44] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11593_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533">Intel XE#2533</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_pm_backlight@fade.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_vrr@max-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_oa@oa-exponents.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-6/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2422">Intel XE#2422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2422">Intel XE#2422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-3/igt@xe_oa@oa-regs-whitelisted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-8/igt@xe_pm@s2idle-exec-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2512">Intel XE#2512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-lnl-3/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-435/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-466/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-463/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7975/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11593/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7975 -&gt; IGTPW_11593</li>
<li>Linux: xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c -&gt; xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94</li>
</ul>
<p>IGTPW_11593: 11593<br />
  IGT_7975: 7975<br />
  xe-1786-d6dac3db19935f5939cbb033eea30c90bdf3888c: d6dac3db19935f5939cbb033eea30c90bdf3888c<br />
  xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94: 02f693a1a747b2784cedbbd7f6cf35be9a652d94</p>

</body>
</html>

--===============7039062102437148829==--
