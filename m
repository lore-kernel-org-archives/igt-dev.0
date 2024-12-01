Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF11D4976C
	for <igt-dev@archiver.kernel.org>; Sun,  1 Dec 2024 13:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1421810E023;
	Sun,  1 Dec 2024 13:41:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C8D10E023;
 Sun,  1 Dec 2024 13:41:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8576002963639176920=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/pciids=3A_add_missing_?=
 =?utf-8?q?PTL_pciid_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 01 Dec 2024 13:41:05 -0000
Message-ID: <173306046595.1265822.10611239447458563384@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129174221.313955-1-matthew.auld@intel.com>
In-Reply-To: <20241129174221.313955-1-matthew.auld@intel.com>
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

--===============8576002963639176920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/pciids: add missing PTL pciid (rev2)
URL   : https://patchwork.freedesktop.org/series/141940/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8132_full -> XEIGTPW_12224_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12224_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12224_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12224_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][1], [PASS][2]) +1 other test ( 1 dmesg-warn, 1 pass )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-rmfb@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-panning-interruptible@d-dp2:
    - shard-bmg:          [PASS][4] -> ([DMESG-WARN][5], [DMESG-WARN][6]) ([Intel XE#3468]) +1 other test ( 2 dmesg-warn )
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-bmg:          [PASS][7] -> ([FAIL][8], [PASS][9])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_pm_dc@dc5-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_pm_dc@dc5-dpms.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [PASS][10] -> ([FAIL][11], [FAIL][12]) +1 other test ( 2 fail )
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-bmg:          [PASS][13] -> ([PASS][14], [DMESG-WARN][15]) +3 other tests ( 1 dmesg-warn, 1 pass )
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-bmg:          [PASS][16] -> ([DMESG-WARN][17], [DMESG-WARN][18])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_threads@threads-hang-basic:
    - shard-bmg:          [PASS][19] -> ([FAIL][20], [FAIL][21])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_exec_threads@threads-hang-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_exec_threads@threads-hang-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-1x1:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][22], [PASS][23])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-1x1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-1x1.html

  * igt@xe_module_load@reload:
    - shard-lnl:          [PASS][24] -> ([ABORT][25], [PASS][26])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-1/igt@xe_module_load@reload.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-3/igt@xe_module_load@reload.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-1/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-lnl:          [PASS][27] -> ([PASS][28], [DMESG-WARN][29])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-8/igt@xe_module_load@reload-no-display.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@xe_module_load@reload-no-display.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-7/igt@xe_module_load@reload-no-display.html

  
#### Warnings ####

  * igt@kms_properties@crtc-properties-legacy:
    - shard-bmg:          [DMESG-WARN][30] ([Intel XE#1727]) -> ([PASS][31], [DMESG-WARN][32]) +1 other test ( 1 dmesg-warn, 1 pass )
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_properties@crtc-properties-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_properties@crtc-properties-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_properties@crtc-properties-legacy.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [DMESG-WARN][33] ([Intel XE#3468]) -> ([FAIL][34], [FAIL][35]) +1 other test ( 2 fail )
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_compute_preempt@compute-preempt-many.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html

  
New tests
---------

  New tests have been introduced between XEIGT_8132_full and XEIGTPW_12224_full:

### New IGT tests (62) ###

  * igt@kms_color@deep-color@pipe-a-dp-2-ctm:
    - Statuses : 2 pass(s)
    - Exec time: [5.31, 5.33] s

  * igt@kms_color@deep-color@pipe-a-dp-2-degamma:
    - Statuses : 2 pass(s)
    - Exec time: [5.27, 5.28] s

  * igt@kms_color@deep-color@pipe-a-dp-2-gamma:
    - Statuses : 2 pass(s)
    - Exec time: [5.30] s

  * igt@kms_color@deep-color@pipe-b-dp-2-ctm:
    - Statuses : 2 pass(s)
    - Exec time: [5.31, 5.32] s

  * igt@kms_color@deep-color@pipe-b-dp-2-degamma:
    - Statuses : 2 pass(s)
    - Exec time: [5.28] s

  * igt@kms_color@deep-color@pipe-b-dp-2-gamma:
    - Statuses : 2 pass(s)
    - Exec time: [5.32] s

  * igt@kms_color@deep-color@pipe-c-dp-2-ctm:
    - Statuses : 2 pass(s)
    - Exec time: [5.32, 5.33] s

  * igt@kms_color@deep-color@pipe-c-dp-2-degamma:
    - Statuses : 2 pass(s)
    - Exec time: [5.29] s

  * igt@kms_color@deep-color@pipe-c-dp-2-gamma:
    - Statuses : 2 pass(s)
    - Exec time: [5.30, 5.32] s

  * igt@kms_color@deep-color@pipe-d-dp-2-ctm:
    - Statuses : 2 pass(s)
    - Exec time: [5.33] s

  * igt@kms_color@deep-color@pipe-d-dp-2-degamma:
    - Statuses : 2 pass(s)
    - Exec time: [5.27] s

  * igt@kms_color@deep-color@pipe-d-dp-2-gamma:
    - Statuses : 2 pass(s)
    - Exec time: [5.31, 5.32] s

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.65, 2.66] s

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.52] s

  * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.70] s

  * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [1.70] s

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-dp-2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.93] s

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.91] s

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.75] s

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [4.79, 4.81] s

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.59] s

  * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.79] s

  * igt@kms_cursor_crc@cursor-random-64x64@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.58] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.61] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.40] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [4.08, 4.58] s

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [4.09, 4.38] s

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [4.59, 4.63] s

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [4.39, 4.42] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.63] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.67] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-2:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.56, 0.58] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.55] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.77] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.49] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.54] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.46] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.48] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-2-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-2-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.95] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-2-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.01] s

  * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.95] s

  * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.05] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.18] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.18] s

  * igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.23] s

  * igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12224_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][36], [DMESG-WARN][37]) ([Intel XE#3467] / [Intel XE#3468])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@core_hotunplug@hotreplug.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [PASS][38] -> ([PASS][39], [DMESG-WARN][40]) ([Intel XE#3426])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-bmg:          NOTRUN -> ([DMESG-FAIL][41], [DMESG-FAIL][42]) ([Intel XE#1727] / [Intel XE#3468]) +3 other tests ( 2 dmesg-fail )
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-4-rc-ccs:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][43], [DMESG-WARN][44]) ([Intel XE#3468]) +15 other tests ( 2 dmesg-warn )
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-4-rc-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-4-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          NOTRUN -> ([SKIP][45], [SKIP][46]) ([Intel XE#2385])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][47], [SKIP][48]) ([Intel XE#2327]) +2 other tests ( 2 skip )
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][49], [DMESG-FAIL][50]) ([Intel XE#3468]) +2 other tests ( 1 dmesg-fail, 1 dmesg-warn )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2327]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-bmg:          [PASS][52] -> ([INCOMPLETE][53], [INCOMPLETE][54]) ([Intel XE#1727] / [Intel XE#3225] / [Intel XE#3468])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [PASS][55] -> ([DMESG-FAIL][56], [DMESG-WARN][57]) ([Intel XE#1727] / [Intel XE#3468])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][58], [SKIP][59]) ([Intel XE#610])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1124])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#1124]) +6 other tests ( 2 skip )
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][63] -> ([SKIP][64], [PASS][65]) ([Intel XE#2314] / [Intel XE#2894]) +1 other test ( 1 pass, 1 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#367])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][67], [SKIP][68]) ([Intel XE#367]) +2 other tests ( 2 skip )
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#2652] / [Intel XE#787]) +8 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2887]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#3432])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#2887]) +10 other tests ( 2 skip )
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#2252]) +5 other tests ( 2 skip )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> ([SKIP][77], [SKIP][78]) ([Intel XE#2325])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#2321])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          NOTRUN -> ([SKIP][81], [SKIP][82]) ([Intel XE#2320])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-size-change:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][83] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_crc@cursor-size-change.html

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][84] ([Intel XE#1727] / [Intel XE#3468])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([DMESG-FAIL][85], [DMESG-FAIL][86]) ([Intel XE#3468]) +4 other tests ( 2 dmesg-fail )
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][87] -> ([DMESG-WARN][88], [SKIP][89]) ([Intel XE#2291] / [Intel XE#3468])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][90] -> ([DMESG-WARN][91], [PASS][92]) ([Intel XE#877]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          NOTRUN -> ([DMESG-FAIL][93], [DMESG-FAIL][94]) ([Intel XE#2705] / [Intel XE#3468])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-bmg:          [PASS][95] -> ([DMESG-FAIL][96], [DMESG-FAIL][97]) ([Intel XE#3468]) +19 other tests ( 2 dmesg-fail )
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2286])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#2286])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][101] -> ([PASS][102], [SKIP][103]) ([Intel XE#2425])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [PASS][104] -> ([DMESG-FAIL][105], [DMESG-FAIL][106]) ([Intel XE#1727] / [Intel XE#3468])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [PASS][107] -> ([DMESG-FAIL][108], [DMESG-FAIL][109]) ([Intel XE#2705] / [Intel XE#3468]) +1 other test ( 2 dmesg-fail )
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][110] -> ([SKIP][111], [DMESG-WARN][112]) ([Intel XE#2316] / [Intel XE#3468])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> ([SKIP][113], [PASS][114]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [PASS][115] -> ([PASS][116], [SKIP][117]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][118] -> [INCOMPLETE][119] ([Intel XE#2635]) +1 other test incomplete
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-bmg:          [PASS][120] -> ([DMESG-FAIL][121], [DMESG-WARN][122]) ([Intel XE#3468]) +7 other tests ( 1 dmesg-fail, 1 dmesg-warn )
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_flip@absolute-wf_vblank.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip@absolute-wf_vblank.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][123] -> ([FAIL][124], [PASS][125]) ([Intel XE#886]) +3 other tests ( 1 fail, 1 pass )
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
    - shard-bmg:          [PASS][126] -> ([PASS][127], [DMESG-FAIL][128]) ([Intel XE#3468])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][129] ([Intel XE#3468]) +1 other test dmesg-fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][130] -> [DMESG-FAIL][131] ([Intel XE#3468]) +3 other tests dmesg-fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][132] -> ([DMESG-WARN][133], [DMESG-WARN][134]) ([Intel XE#3468]) +75 other tests ( 2 dmesg-warn )
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> ([FAIL][135], [PASS][136]) ([Intel XE#2882]) +1 other test ( 1 fail, 1 pass )
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][137], [SKIP][138]) ([Intel XE#2293] / [Intel XE#2380]) +2 other tests ( 2 skip )
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][139], [SKIP][140]) ([Intel XE#2293]) +2 other tests ( 2 skip )
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [PASS][141] -> ([DMESG-WARN][142], [PASS][143]) ([Intel XE#2705]) +1 other test ( 1 dmesg-warn, 1 pass )
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [PASS][144] -> ([PASS][145], [DMESG-WARN][146]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) +1 other test ( 1 dmesg-warn, 1 pass )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][147], [SKIP][148]) ([Intel XE#2311]) +9 other tests ( 2 skip )
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([FAIL][149], [FAIL][150]) ([Intel XE#2333]) +3 other tests ( 2 fail )
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][151] ([Intel XE#2333]) +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][152], [SKIP][153]) ([Intel XE#2352])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][154], [SKIP][155]) ([Intel XE#2311] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2311]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][157], [SKIP][158]) ([Intel XE#2313]) +14 other tests ( 2 skip )
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2313]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][162], [SKIP][163]) ([Intel XE#2340])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_lease@lease-unleased-connector@pipe-c-dp-2:
    - shard-bmg:          [PASS][164] -> ([DMESG-WARN][165], [PASS][166]) ([Intel XE#3468]) +28 other tests ( 1 dmesg-warn, 1 pass )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-bmg:          [PASS][167] -> ([INCOMPLETE][168], [INCOMPLETE][169]) ([Intel XE#1727] / [Intel XE#3468]) +3 other tests ( 2 incomplete )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_lease@setcrtc-implicit-plane.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_lease@setcrtc-implicit-plane.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2501])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][171] -> [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests incomplete
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-bmg:          [PASS][173] -> ([DMESG-WARN][174], [DMESG-WARN][175]) ([Intel XE#2705] / [Intel XE#3468]) +3 other tests ( 2 dmesg-warn )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][176], [SKIP][177]) ([Intel XE#870])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][178] -> ([FAIL][179], [FAIL][180]) ([Intel XE#718])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> ([SKIP][181], [SKIP][182]) ([Intel XE#2392])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][183], [SKIP][184]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test ( 2 skip )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          [PASS][185] -> [DMESG-WARN][186] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes@plane-32:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][187], [DMESG-WARN][188]) ([Intel XE#1727] / [Intel XE#3468]) +7 other tests ( 2 dmesg-warn )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_rpm@universal-planes@plane-32.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_pm_rpm@universal-planes@plane-32.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#1489]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][193] -> ([FAIL][194], [FAIL][195]) ([Intel XE#3633]) +1 other test ( 2 fail )
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#2234] / [Intel XE#2850]) +7 other tests ( 2 skip )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][198], [SKIP][199]) ([Intel XE#2414])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#3414]) +1 other test ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][202] -> ([PASS][203], [SKIP][204]) ([Intel XE#1435])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][205] -> [FAIL][206] ([Intel XE#899])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          NOTRUN -> ([SKIP][207], [SKIP][208]) ([Intel XE#756])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          NOTRUN -> ([SKIP][209], [SKIP][210]) ([Intel XE#2905]) +4 other tests ( 2 skip )
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-discovery.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2905])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][212] -> ([DMESG-WARN][213], [INCOMPLETE][214]) ([Intel XE#1473] / [Intel XE#3468])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [PASS][215] -> [TIMEOUT][216] ([Intel XE#1473])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [PASS][217] -> ([PASS][218], [TIMEOUT][219]) ([Intel XE#1473] / [Intel XE#2472])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@many-basic:
    - shard-bmg:          [PASS][220] -> ([DMESG-WARN][221], [DMESG-WARN][222]) ([Intel XE#1727])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_exec_basic@many-basic.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exec_basic@many-basic.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_exec_basic@many-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#2322])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][224], [SKIP][225]) ([Intel XE#2322]) +3 other tests ( 2 skip )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-bmg:          [PASS][226] -> [DMESG-WARN][227] ([Intel XE#3468]) +46 other tests dmesg-warn
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension:
    - shard-bmg:          NOTRUN -> ([PASS][228], [INCOMPLETE][229]) ([Intel XE#3580])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exercise_blt@fast-copy-inc-dimension.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exercise_blt@fast-copy-inc-dimension.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [PASS][230] -> [DMESG-WARN][231] ([Intel XE#3343] / [Intel XE#3468])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][232], [PASS][233]) ([Intel XE#3468]) +3 other tests ( 1 dmesg-warn, 1 pass )
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][234] ([Intel XE#3467] / [Intel XE#3468])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [PASS][235] -> ([DMESG-WARN][236], [DMESG-WARN][237]) ([Intel XE#3467] / [Intel XE#3468])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][238] -> ([SKIP][239], [SKIP][240]) ([Intel XE#1192]) +1 other test ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_live_ktest@xe_migrate.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_live_ktest@xe_migrate.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][241] -> ([DMESG-WARN][242], [DMESG-WARN][243]) ([Intel XE#3467])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_module_load@reload.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_module_load@reload.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_module_load@reload.html

  * igt@xe_module_load@unload:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][244], [DMESG-WARN][245]) ([Intel XE#3467])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_module_load@unload.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_module_load@unload.html

  * igt@xe_oa@buffer-fill@rcs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][246] ([Intel XE#3468]) +6 other tests dmesg-warn
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_oa@buffer-fill@rcs-0.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#2427])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_peer2peer@read.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][249], [DMESG-WARN][250]) ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-bmg:          [PASS][251] -> [DMESG-FAIL][252] ([Intel XE#1727] / [Intel XE#3468])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_pm@s2idle-mocs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][253], [DMESG-WARN][254]) ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) +1 other test ( 2 dmesg-warn )
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_pm@s3-exec-after.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [PASS][255] -> ([DMESG-WARN][256], [DMESG-WARN][257]) ([Intel XE#1727] / [Intel XE#3468]) +5 other tests ( 2 dmesg-warn )
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_pm@s4-exec-after.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_pm@s4-exec-after.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#944]) +1 other test ( 2 skip )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@query-invalid-extension:
    - shard-bmg:          [PASS][260] -> ([DMESG-WARN][261], [PASS][262]) ([Intel XE#1727]) +1 other test ( 1 dmesg-warn, 1 pass )
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@xe_query@query-invalid-extension.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_query@query-invalid-extension.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_query@query-invalid-extension.html

  * igt@xe_render_copy@render-random@render-tile64-256x256:
    - shard-bmg:          [PASS][263] -> [DMESG-WARN][264] ([Intel XE#1727]) +5 other tests dmesg-warn
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_render_copy@render-random@render-tile64-256x256.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_render_copy@render-random@render-tile64-256x256.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
    - shard-bmg:          [INCOMPLETE][265] ([Intel XE#3468]) -> ([PASS][266], [PASS][267]) +1 other test ( 2 pass )
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-FAIL][268] ([Intel XE#3468]) -> ([PASS][269], [PASS][270]) +17 other tests ( 2 pass )
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][271] ([Intel XE#3468]) -> [PASS][272] +5 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-WARN][273] ([Intel XE#2705] / [Intel XE#3468]) -> ([PASS][274], [PASS][275]) +1 other test ( 2 pass )
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][276] -> ([PASS][277], [PASS][278]) +2 other tests ( 2 pass )
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          [DMESG-FAIL][279] ([Intel XE#2705]) -> ([PASS][280], [PASS][281])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled:
    - shard-bmg:          [DMESG-FAIL][282] -> ([PASS][283], [PASS][284])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][285] ([Intel XE#2882]) -> ([PASS][286], [PASS][287]) +2 other tests ( 2 pass )
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][288] ([Intel XE#3321]) -> ([PASS][289], [PASS][290])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [ABORT][291] ([Intel XE#2625]) -> ([PASS][292], [PASS][293])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [ABORT][294] -> ([PASS][295], [PASS][296])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          [DMESG-WARN][297] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> ([PASS][298], [PASS][299]) +1 other test ( 2 pass )
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_plane@pixel-format:
    - shard-bmg:          [INCOMPLETE][300] ([Intel XE#1035] / [Intel XE#3468]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_plane@pixel-format.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_plane@pixel-format.html

  * igt@kms_plane_cursor@viewport:
    - shard-bmg:          [DMESG-FAIL][302] ([Intel XE#1727] / [Intel XE#3468]) -> ([PASS][303], [PASS][304]) +1 other test ( 2 pass )
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_plane_cursor@viewport.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_cursor@viewport.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128 (NEW):
    - shard-bmg:          [DMESG-FAIL][305] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][306] +1 other test pass
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64 (NEW):
    - shard-bmg:          [DMESG-FAIL][307] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][309] ([Intel XE#2566] / [Intel XE#3468]) -> [PASS][310] +1 other test pass
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][311] ([Intel XE#718]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [FAIL][313] -> ([PASS][314], [PASS][315])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_pm_rpm@basic-pci-d3-state.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-bmg:          [DMESG-WARN][316] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][317] +6 other tests pass
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-bmg:          [FAIL][318] ([Intel XE#3559]) -> ([PASS][319], [PASS][320]) +3 other tests ( 2 pass )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][321] ([Intel XE#899]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@query-idle@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][323] ([Intel XE#3468]) -> ([PASS][324], [PASS][325]) +104 other tests ( 2 pass )
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [DMESG-WARN][326] ([Intel XE#3426]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][328] -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - shard-bmg:          [INCOMPLETE][330] ([Intel XE#1727] / [Intel XE#3468]) -> ([PASS][331], [PASS][332]) +1 other test ( 2 pass )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset-rpm.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2:
    - shard-bmg:          [SKIP][333] -> ([PASS][334], [PASS][335])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html

  * igt@xe_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-vram01-vram01-multicopy:
    - shard-bmg:          [DMESG-WARN][336] ([Intel XE#3468]) -> [PASS][337] +42 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-vram01-vram01-multicopy.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-vram01-vram01-multicopy.html

  * igt@xe_exec_balancer@twice-parallel-userptr:
    - shard-bmg:          [DMESG-WARN][338] ([Intel XE#1727]) -> ([PASS][339], [PASS][340]) +1 other test ( 2 pass )
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_exec_balancer@twice-parallel-userptr.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exec_balancer@twice-parallel-userptr.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exec_balancer@twice-parallel-userptr.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][341] ([Intel XE#1727]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][343] ([Intel XE#3343]) -> ([PASS][344], [PASS][345]) +1 other test ( 2 pass )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-lnl:          [DMESG-WARN][346] -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-WARN][348] ([Intel XE#3467] / [Intel XE#3468]) -> ([PASS][349], [PASS][350]) +1 other test ( 2 pass )
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [SKIP][351] ([Intel XE#1192]) -> ([PASS][352], [PASS][353])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          [DMESG-WARN][354] ([Intel XE#1727] / [Intel XE#3468]) -> ([PASS][355], [PASS][356]) +3 other tests ( 2 pass )
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_pm@d3hot-mmap-system.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_pm@d3hot-mmap-system.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-FAIL][357] ([Intel XE#3468]) -> ([DMESG-WARN][358], [DMESG-WARN][359]) ([Intel XE#3468])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][360] ([Intel XE#3468]) -> ([DMESG-FAIL][361], [DMESG-FAIL][362]) ([Intel XE#1727] / [Intel XE#3468])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [INCOMPLETE][363] ([Intel XE#2715] / [Intel XE#3468]) -> [FAIL][364] ([Intel XE#1178]) +1 other test fail
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_content_protection@atomic.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][365] ([Intel XE#2715] / [Intel XE#3468]) -> ([FAIL][366], [FAIL][367]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128:
    - shard-bmg:          [DMESG-FAIL][368] ([Intel XE#3468]) -> ([DMESG-FAIL][369], [PASS][370]) ([Intel XE#3468])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x128.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [DMESG-WARN][371] ([Intel XE#3468]) -> ([PASS][372], [SKIP][373]) ([Intel XE#2291])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [FAIL][374] ([Intel XE#1695]) -> [DMESG-FAIL][375] ([Intel XE#3468])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [DMESG-FAIL][376] ([Intel XE#3468]) -> [FAIL][377] ([Intel XE#1695])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [DMESG-FAIL][378] ([Intel XE#3468]) -> ([FAIL][379], [PASS][380]) ([Intel XE#2882])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][381] ([Intel XE#3321]) -> ([PASS][382], [FAIL][383]) ([Intel XE#3321])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][384] ([Intel XE#2882]) -> ([DMESG-WARN][385], [DMESG-WARN][386]) ([Intel XE#3468]) +6 other tests ( 2 dmesg-warn )
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [DMESG-WARN][387] ([Intel XE#2932]) -> ([DMESG-WARN][388], [PASS][389]) ([Intel XE#2932]) +3 other tests ( 1 dmesg-warn, 1 pass )
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [DMESG-FAIL][390] ([Intel XE#3468]) -> [FAIL][391] ([Intel XE#2333]) +6 other tests fail
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][392] ([Intel XE#2333]) -> [DMESG-FAIL][393] ([Intel XE#3468]) +4 other tests dmesg-fail
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [DMESG-FAIL][394] ([Intel XE#3468]) -> ([FAIL][395], [SKIP][396]) ([Intel XE#2312] / [Intel XE#2333]) +1 other test ( 1 fail, 1 skip )
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][397] ([Intel XE#2333]) -> ([INCOMPLETE][398], [SKIP][399]) ([Intel XE#1727] / [Intel XE#2312] / [Intel XE#3468])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][400] ([Intel XE#2333]) -> ([SKIP][401], [FAIL][402]) ([Intel XE#2312] / [Intel XE#2333])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][403] ([Intel XE#2333]) -> ([DMESG-FAIL][404], [DMESG-FAIL][405]) ([Intel XE#3468]) +7 other tests ( 2 dmesg-fail )
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [FAIL][406] ([Intel XE#2333]) -> ([SKIP][407], [DMESG-FAIL][408]) ([Intel XE#2312] / [Intel XE#3468])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [DMESG-FAIL][409] ([Intel XE#3468]) -> ([FAIL][410], [FAIL][411]) ([Intel XE#2333]) +11 other tests ( 2 fail )
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][412] ([Intel XE#2311]) -> ([SKIP][413], [SKIP][414]) ([Intel XE#2311] / [Intel XE#2312]) +12 other tests ( 2 skip )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][415] ([Intel XE#2313]) -> ([SKIP][416], [SKIP][417]) ([Intel XE#2312] / [Intel XE#2313]) +12 other tests ( 2 skip )
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_lease@invalid-create-leases:
    - shard-bmg:          [DMESG-WARN][418] ([Intel XE#3468]) -> ([DMESG-WARN][419], [PASS][420]) ([Intel XE#3468])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_lease@invalid-create-leases.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_lease@invalid-create-leases.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_lease@invalid-create-leases.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [DMESG-FAIL][421] ([Intel XE#3468]) -> ([FAIL][422], [FAIL][423]) ([Intel XE#1430])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][424] ([Intel XE#3289]) -> ([SKIP][425], [SKIP][426]) ([Intel XE#1439] / [Intel XE#836])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [SKIP][427] ([Intel XE#3289]) -> ([DMESG-WARN][428], [DMESG-WARN][429]) ([Intel XE#1727] / [Intel XE#3468])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][430] ([Intel XE#1473]) -> [INCOMPLETE][431] ([Intel XE#1473])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-bmg:          [DMESG-WARN][432] ([Intel XE#3468]) -> [DMESG-WARN][433] ([Intel XE#1727])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][434] ([Intel XE#1473] / [Intel XE#3468]) -> ([TIMEOUT][435], [TIMEOUT][436]) ([Intel XE#1473])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][437] ([Intel XE#1473]) -> ([INCOMPLETE][438], [DMESG-WARN][439]) ([Intel XE#1473] / [Intel XE#3468])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][440] ([Intel XE#1473] / [Intel XE#2472]) -> ([TIMEOUT][441], [PASS][442]) ([Intel XE#1473] / [Intel XE#2472])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_evict@evict-threads-large.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-WARN][443] ([Intel XE#3467]) -> ([PASS][444], [DMESG-WARN][445]) ([Intel XE#3467])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][446] ([Intel XE#1192]) -> ([SKIP][447], [SKIP][448]) ([Intel XE#2833])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][449] ([Intel XE#958]) -> ([PASS][450], [FAIL][451]) ([Intel XE#958])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][452] ([Intel XE#2919]) -> ([DMESG-WARN][453], [DMESG-WARN][454]) ([Intel XE#1727] / [Intel XE#2919])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_wedged@basic-wedged.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_wedged@basic-wedged.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3289]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3289
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559
  [Intel XE#3580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3580
  [Intel XE#3633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3633
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * IGT: IGT_8132 -> IGTPW_12224

  IGTPW_12224: 12224
  IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2295-108f610005f88de624c1a8c4f85d5cab9f530ddb: 108f610005f88de624c1a8c4f85d5cab9f530ddb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/index.html

--===============8576002963639176920==
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
<tr><td><b>Series:</b></td><td>lib/pciids: add missing PTL pciid (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141940/">https://patchwork.freedesktop.org/series/141940/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8132_full -&gt; XEIGTPW_12224_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12224_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12224_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12224_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2.html">PASS</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb@bd-dp2-hdmi-a3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">FAIL</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html">DMESG-WARN</a>) +3 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_exec_threads@threads-hang-basic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_exec_threads@threads-hang-basic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exec_threads@threads-hang-basic.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-1x1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-1x1.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-system-1x1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-1/igt@xe_module_load@reload.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-3/igt@xe_module_load@reload.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-1/igt@xe_module_load@reload.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-8/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@xe_module_load@reload-no-display.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-7/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_properties@crtc-properties-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_properties@crtc-properties-legacy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_properties@crtc-properties-legacy.html">DMESG-WARN</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_compute_preempt@compute-preempt-many.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8132_full and XEIGTPW_12224_full:</p>
<h3>New IGT tests (62)</h3>
<ul>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-ctm:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.31, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-degamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.27, 5.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-gamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-b-dp-2-ctm:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.31, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-b-dp-2-degamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-b-dp-2-gamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-c-dp-2-ctm:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.32, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-c-dp-2-degamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-c-dp-2-gamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.30, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-dp-2-ctm:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-dp-2-degamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-d-dp-2-gamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.31, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.65, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.79, 4.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.08, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.09, 4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.59, 4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.39, 4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.56, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-dp-2-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-dp-2-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-dp-2-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-dp-2-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12224_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426">Intel XE#3426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests ( 2 dmesg-fail )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-4-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-4-rc-ccs.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-4-rc-ccs.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +15 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests ( 1 dmesg-fail, 1 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_crc@cursor-size-change.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests ( 2 dmesg-fail )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +19 other tests ( 2 dmesg-fail )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test ( 2 dmesg-fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip@absolute-wf_vblank.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@absolute-wf_vblank.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests ( 1 dmesg-fail, 1 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests ( 1 fail, 1 pass )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +75 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +28 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_lease@setcrtc-implicit-plane.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_lease@setcrtc-implicit-plane.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_lease@setcrtc-implicit-plane.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests ( 2 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_rpm@universal-planes@plane-32.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_pm_rpm@universal-planes@plane-32.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3633">Intel XE#3633</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_exec_basic@many-basic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exec_basic@many-basic.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_exec_basic@many-basic.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +46 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exercise_blt@fast-copy-inc-dimension.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exercise_blt@fast-copy-inc-dimension.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3580">Intel XE#3580</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_live_ktest@xe_migrate.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_module_load@reload.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_module_load@reload.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_module_load@reload.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_module_load@unload.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_module_load@unload.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_oa@buffer-fill@rcs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_peer2peer@read.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_pm@s2idle-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@xe_query@query-invalid-extension.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_query@query-invalid-extension.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_query@query-invalid-extension.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-random@render-tile64-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_render_copy@render-random@render-tile64-256x256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_render_copy@render-random@render-tile64-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a>) +17 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled.html">DMESG-FAIL</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">ABORT</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_plane@pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_plane_cursor@viewport.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_cursor@viewport.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_plane_cursor@viewport.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128 (NEW):</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64 (NEW):</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_pm_rpm@legacy-planes@plane-50.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pm_rpm@legacy-planes@plane-50.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559">Intel XE#3559</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html">PASS</a>) +104 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426">Intel XE#3426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-rpm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_vblank@ts-continuation-modeset-rpm.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset-rpm.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html">SKIP</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-vram01-vram01-multicopy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-vram01-vram01-multicopy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-vram01-vram01-multicopy.html">PASS</a> +42 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_exec_balancer@twice-parallel-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_exec_balancer@twice-parallel-userptr.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_exec_balancer@twice-parallel-userptr.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_pm@d3hot-mmap-system.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_pm@d3hot-mmap-system.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x128.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) +3 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests ( 2 dmesg-fail )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +11 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_lease@invalid-create-leases.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_lease@invalid-create-leases.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_lease@invalid-create-leases.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3289">Intel XE#3289</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3289">Intel XE#3289</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_evict@evict-threads-large.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12224/shard-bmg-4/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8132 -&gt; IGTPW_12224</li>
</ul>
<p>IGTPW_12224: 12224<br />
  IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2295-108f610005f88de624c1a8c4f85d5cab9f530ddb: 108f610005f88de624c1a8c4f85d5cab9f530ddb</p>

</body>
</html>

--===============8576002963639176920==--
