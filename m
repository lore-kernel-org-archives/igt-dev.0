Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1662FC2BA18
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B697810E1B9;
	Tue, 18 Jun 2024 05:21:48 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9850A10E1B9;
 Tue, 18 Jun 2024 05:21:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1239438673493441439=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_tests/api=5Fintel=5Fbb=3A_Fix?=
 =?utf-8?q?_render-ccs_subtest_hang_on_DG2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Jun 2024 05:21:47 -0000
Message-ID: <171868810761.99140.1538434267753669176@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617091054.63602-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240617091054.63602-1-zbigniew.kempczynski@intel.com>
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

--===============1239438673493441439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/api_intel_bb: Fix render-ccs subtest hang on DG2
URL   : https://patchwork.freedesktop.org/series/134941/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7890_full -> XEIGTPW_11264_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): shard-adlp 

Known issues
------------

  Here are the changes found in XEIGTPW_11264_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1214]) +7 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#373])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][7] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#929])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#327])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][16] -> [FAIL][17] ([Intel XE#899])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][18] -> [TIMEOUT][19] ([Intel XE#1473] / [Intel XE#392])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][20] ([Intel XE#1195])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [PASS][21] -> [FAIL][22] ([Intel XE#1045] / [Intel XE#1204])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#1192] / [Intel XE#1201])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][25] -> [DMESG-WARN][26] ([Intel XE#1214] / [Intel XE#569]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][29] ([Intel XE#1201]) -> [PASS][30] +4 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][32] +1 other test pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [INCOMPLETE][33] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][35] ([Intel XE#1195]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][37] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][39] ([Intel XE#1201] / [i915#2575]) -> [PASS][40] +7 other tests pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2-set2:     [SKIP][41] ([Intel XE#1201] / [Intel XE#1664]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [SKIP][43] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][44] +14 other tests pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][45] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-dg2-set2:     [DMESG-FAIL][47] ([Intel XE#1760]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_evict@evict-threads-small-multi-vm.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [DMESG-WARN][49] ([Intel XE#1214] / [Intel XE#1551]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_module_load@unload.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_module_load@unload.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][51] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][53] ([Intel XE#1214]) -> [PASS][54] +4 other tests pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s4-basic-exec.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][55] ([Intel XE#1201]) -> [SKIP][56] ([Intel XE#1124] / [Intel XE#1201])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][57] ([Intel XE#1201]) -> [SKIP][58] ([Intel XE#1201] / [Intel XE#610])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#1201] / [i915#2575]) -> [SKIP][60] ([Intel XE#1201] / [Intel XE#367])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#1201]) -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][63] ([Intel XE#1201] / [i915#2575]) -> [SKIP][64] ([Intel XE#1201] / [Intel XE#373])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][66] ([Intel XE#1214] / [Intel XE#282])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][67] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][68] ([Intel XE#1214] / [Intel XE#282])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#1201] / [i915#2575]) -> [SKIP][72] ([Intel XE#1201] / [Intel XE#323])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#1201] / [i915#2575]) -> [SKIP][74] ([Intel XE#1201] / [Intel XE#307])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#1201] / [i915#2575]) -> [SKIP][76] ([Intel XE#1201] / [Intel XE#701])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201]) -> [SKIP][78] ([Intel XE#1201] / [Intel XE#455])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#1201]) -> [SKIP][80] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#1201]) -> [SKIP][82] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][83] ([Intel XE#1551]) -> [FAIL][84] ([Intel XE#616]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][85] ([Intel XE#361]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#455])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201]) -> [SKIP][88] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_psr@psr2-sprite-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#1201] / [i915#2575]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#327])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [i915#2575]) -> [SKIP][92] ([Intel XE#1091] / [Intel XE#1201])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@sriov_basic@bind-unbind-vf.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][94] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#1999]) -> [SKIP][96] ([Intel XE#1192] / [Intel XE#1201])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#366])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][99] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][100] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][102] ([Intel XE#1201] / [Intel XE#944])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-WARN][103] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][104] ([Intel XE#1760])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1664
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_7890 -> IGTPW_11264

  IGTPW_11264: e7df668c29958e6a997e010721cf376b5487db00 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb: c00c421245452a4a82a893cd2e1bfd9663a761fb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/index.html

--===============1239438673493441439==
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
<tr><td><b>Series:</b></td><td>tests/api_intel_bb: Fix render-ccs subtest hang on DG2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134941/">https://patchwork.freedesktop.org/series/134941/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7890_full -&gt; XEIGTPW_11264_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11264_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1664">Intel XE#1664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_evict@evict-threads-small-multi-vm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@xe_evict@evict-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_module_load@unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@xe_pm@s4-basic-exec.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11264/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7890 -&gt; IGTPW_11264</li>
</ul>
<p>IGTPW_11264: e7df668c29958e6a997e010721cf376b5487db00 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb: c00c421245452a4a82a893cd2e1bfd9663a761fb</p>

</body>
</html>

--===============1239438673493441439==--
