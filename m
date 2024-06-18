Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FEFC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 22:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D0410E7DC;
	Tue, 18 Jun 2024 22:10:13 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA74010E7DC;
 Tue, 18 Jun 2024 22:10:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1887049327250671695=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_add_tests_to_check_crc_for_su?=
 =?utf-8?q?pported_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy, Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Jun 2024 22:10:10 -0000
Message-ID: <171874861087.104452.4746615278032737969@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618052652.411119-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240618052652.411119-1-santhosh.reddy.guddati@intel.com>
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

--===============1887049327250671695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add tests to check crc for supported formats
URL   : https://patchwork.freedesktop.org/series/134990/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7890_full -> XEIGTPW_11268_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_11268_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11268_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11268_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][1] ([Intel XE#1214]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][3] +4 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  
New tests
---------

  New tests have been introduced between XEIGT_7890_full and XEIGTPW_11268_full:

### New IGT tests (5) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats:
    - Statuses : 1 pass(s)
    - Exec time: [418.87] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [104.89] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [107.33] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [103.05] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [102.89] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11268_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1124] / [Intel XE#1201])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#787]) +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#455] / [Intel XE#787])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#373])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][11] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#282])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][16] -> [DMESG-WARN][17] ([Intel XE#1214]) +4 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1195]) +2 other tests incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#651]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#929])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#327])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#288])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][25] ([Intel XE#2105])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [PASS][26] -> [FAIL][27] ([Intel XE#1045] / [Intel XE#1204])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#1192] / [Intel XE#1201])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#569])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [DMESG-WARN][32] ([Intel XE#1214]) -> [PASS][33] +2 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - {shard-lnl}:        [FAIL][34] ([Intel XE#1659]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][36] ([Intel XE#1201]) -> [PASS][37] +4 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - {shard-lnl}:        [DMESG-WARN][40] -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [INCOMPLETE][42] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][44] ([Intel XE#1195]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - {shard-lnl}:        [FAIL][46] ([Intel XE#886]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][48] ([Intel XE#1214] / [Intel XE#1551]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][50] ([Intel XE#1201] / [Intel XE#417]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_hdmi_inject@inject-audio.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][52] ([Intel XE#1201] / [i915#2575]) -> [PASS][53] +6 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-lnl}:        [SKIP][54] ([Intel XE#1211]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2-set2:     [SKIP][56] ([Intel XE#1201] / [Intel XE#1664]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - {shard-lnl}:        [FAIL][58] -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][60] ([Intel XE#771] / [Intel XE#899]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][62] ([Intel XE#899]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [SKIP][64] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][65] +14 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][66] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-dg2-set2:     [DMESG-FAIL][68] ([Intel XE#1760]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_evict@evict-threads-small-multi-vm.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-exec-after:
    - {shard-lnl}:        [ABORT][72] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-7/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][75] ([Intel XE#316]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][77] ([Intel XE#619])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][78] ([Intel XE#1201]) -> [SKIP][79] ([Intel XE#1124] / [Intel XE#1201])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][81] ([Intel XE#1124]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1201]) -> [SKIP][83] ([Intel XE#1201] / [Intel XE#610])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][85] ([Intel XE#367])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201]) -> [SKIP][87] ([Intel XE#455] / [Intel XE#787])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1201]) -> [SKIP][89] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][91] ([Intel XE#1252]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][93] ([Intel XE#787]) +62 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][95] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][97] ([Intel XE#306]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_chamelium_color@degamma.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [i915#2575]) -> [SKIP][99] ([Intel XE#1201] / [Intel XE#373])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][101] ([Intel XE#373]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][102] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][103] ([Intel XE#282]) +2 other tests dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][105] ([Intel XE#308])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][107] ([Intel XE#1214] / [Intel XE#282])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][108] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][109] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [i915#2575]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#323])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [i915#2575]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#307])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][115] ([Intel XE#455]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [i915#2575]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#701])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][119] ([Intel XE#1137])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][120] ([Intel XE#1214] / [Intel XE#1551]) -> [INCOMPLETE][121] ([Intel XE#1195] / [Intel XE#2049])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#455])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][125] ([Intel XE#651]) +19 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][129] ([Intel XE#658])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201]) -> [SKIP][131] ([Intel XE#651])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][133] ([Intel XE#653]) +21 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][136] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][137] ([Intel XE#1162])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][139] ([Intel XE#908])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_psr@pr-cursor-blt.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][143] ([Intel XE#929]) +12 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_psr@psr2-basic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][145] ([Intel XE#1127])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [i915#2575]) -> [SKIP][147] ([Intel XE#1201] / [Intel XE#327])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#362])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][151] ([Intel XE#330])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [i915#2575]) -> [SKIP][153] ([Intel XE#1091] / [Intel XE#1201])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@sriov_basic@bind-unbind-vf.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][155] ([Intel XE#1091])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][157] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][159] ([Intel XE#1126]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][163] ([Intel XE#288]) +17 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][165] ([Intel XE#366])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_pm@d3cold-basic.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#366])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][168] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][169] ([Intel XE#1551] / [Intel XE#569])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][170] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][171] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][173] ([Intel XE#944])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#944])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-WARN][176] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][177] ([Intel XE#1760])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1664
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
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
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_7890 -> IGTPW_11268
  * Linux: xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb -> xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165

  IGTPW_11268: 11268
  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb: c00c421245452a4a82a893cd2e1bfd9663a761fb
  xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165: b3cee15446d95e97d9d663cdcbc611e698354165

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/index.html

--===============1887049327250671695==
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
<tr><td><b>Series:</b></td><td>add tests to check crc for supported formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134990/">https://patchwork.freedesktop.org/series/134990/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7890_full -&gt; XEIGTPW_11268_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_11268_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11268_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11268_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7890_full and XEIGTPW_11268_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [418.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [104.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [107.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [103.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-supported-formats@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [102.89] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11268_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1664">Intel XE#1664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_evict@evict-threads-small-multi-vm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@xe_evict@evict-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-435/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11268/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7890 -&gt; IGTPW_11268</li>
<li>Linux: xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb -&gt; xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165</li>
</ul>
<p>IGTPW_11268: 11268<br />
  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb: c00c421245452a4a82a893cd2e1bfd9663a761fb<br />
  xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165: b3cee15446d95e97d9d663cdcbc611e698354165</p>

</body>
</html>

--===============1887049327250671695==--
