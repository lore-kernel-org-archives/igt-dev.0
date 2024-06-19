Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAF9C27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 02:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCFC10E823;
	Wed, 19 Jun 2024 02:24:18 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA9210E118;
 Wed, 19 Jun 2024 02:24:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7705020693564236867=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_Force_joiner_support_in_bigjo?=
 =?utf-8?q?iner_checks_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jun 2024 02:24:16 -0000
Message-ID: <171876385688.104453.13373625900770160970@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
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

--===============7705020693564236867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Force joiner support in bigjoiner checks (rev8)
URL   : https://patchwork.freedesktop.org/series/132557/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7891_full -> XEIGTPW_11270_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11270_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11270_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11270_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@xe_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-436/igt@xe_module_load@reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - {shard-lnl}:        [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - {shard-lnl}:        [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html

  
New tests
---------

  New tests have been introduced between XEIGT_7891_full and XEIGTPW_11270_full:

### New IGT tests (9) ###

  * igt@kms_cdclk@mode-transition@pipe-a-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cdclk@mode-transition@pipe-b-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_cdclk@plane-scaling@pipe-a-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_cdclk@plane-scaling@pipe-c-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@xe_waitfence@reltime:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11270_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [PASS][9] -> [DMESG-WARN][10] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#455])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#1201] / [Intel XE#417])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][17] -> [DMESG-WARN][18] ([Intel XE#1033]) +3 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1033] / [Intel XE#1214]) +12 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1195]) +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-6.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][23] -> [FAIL][24] ([Intel XE#361]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][25] -> [TIMEOUT][26] ([Intel XE#1473] / [Intel XE#392])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-rebind:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1214])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [PASS][31] -> [FAIL][32] ([Intel XE#1045] / [Intel XE#1204])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [PASS][33] -> [SKIP][34] ([Intel XE#1192] / [Intel XE#1201])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@xe_live_ktest@xe_dma_buf.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@xe_live_ktest@xe_dma_buf.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - {shard-lnl}:        [FAIL][35] ([Intel XE#1659]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][37] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][38] +3 other tests pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - {shard-lnl}:        [DMESG-WARN][39] -> [PASS][40] +2 other tests pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_pm_dc@dc5-dpms:
    - {shard-lnl}:        [FAIL][41] ([Intel XE#718]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][43] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][45] ([Intel XE#1600]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
    - {shard-lnl}:        [DMESG-WARN][47] ([Intel XE#1330]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-4/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [DMESG-WARN][49] ([Intel XE#1214]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_module_load@many-reload.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-436/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - {shard-lnl}:        [DMESG-WARN][51] ([Intel XE#1616]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][53] ([Intel XE#1214] / [Intel XE#569]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][55] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
    - {shard-lnl}:        [FAIL][57] ([Intel XE#1081]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-4/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-4/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#801]) -> [SKIP][60] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#316]) -> [SKIP][62] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][63] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][64] ([Intel XE#316]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][66] ([Intel XE#607]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#1124]) -> [SKIP][68] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][70] ([Intel XE#1124]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#346]) -> [SKIP][72] ([Intel XE#1201] / [Intel XE#346])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#367]) -> [SKIP][74] ([Intel XE#1201] / [Intel XE#367])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][76] ([Intel XE#367]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][78] ([Intel XE#787]) +62 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][80] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#1252]) -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1252])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#787]) -> [SKIP][84] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][86] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][88] ([Intel XE#306]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#373]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][92] ([Intel XE#373]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][94] ([Intel XE#307])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-dpms:
    - shard-dg2-set2:     [DMESG-WARN][95] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][96] ([Intel XE#282]) +6 other tests dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_cursor_crc@cursor-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#308]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#308])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][99] ([Intel XE#616]) -> [DMESG-FAIL][100] ([Intel XE#1551])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][101] ([Intel XE#1551]) -> [FAIL][102] ([Intel XE#616])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [DMESG-WARN][103] ([Intel XE#282]) -> [DMESG-WARN][104] ([Intel XE#1214] / [Intel XE#282]) +9 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][105] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#282])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][107] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][108] ([Intel XE#282] / [Intel XE#910])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#455]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#776]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#776])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][114] ([Intel XE#1138])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][115] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][116] ([Intel XE#1551]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#651]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][120] ([Intel XE#651]) +17 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#658]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#658])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][124] ([Intel XE#653]) +17 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1158]) -> [SKIP][126] ([Intel XE#1158] / [Intel XE#1201])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#653]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][130] ([Intel XE#356])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][132] ([Intel XE#1033] / [Intel XE#1162] / [Intel XE#1214])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][134] ([Intel XE#455]) +13 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][136] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][138] ([Intel XE#498]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][140] ([Intel XE#870])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][142] ([Intel XE#908])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][144] ([Intel XE#929]) +11 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#929]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][148] ([Intel XE#1149])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1127]) -> [SKIP][150] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][152] ([Intel XE#1127])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#327]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][155] ([Intel XE#1729]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#362])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#362])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#756]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][162] ([Intel XE#756])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1123]) -> [SKIP][164] ([Intel XE#1123] / [Intel XE#1201])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][166] ([Intel XE#1126])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#288]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][170] ([Intel XE#288]) +12 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#1195]) -> [TIMEOUT][172] ([Intel XE#2105])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][174] ([Intel XE#977])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#979]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#979])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#366]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][180] ([Intel XE#944])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1654]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1654
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
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
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
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


Build changes
-------------

  * IGT: IGT_7891 -> IGTPW_11270

  IGTPW_11270: 11270
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/index.html

--===============7705020693564236867==
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
<tr><td><b>Series:</b></td><td>Force joiner support in bigjoiner checks (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132557/">https://patchwork.freedesktop.org/series/132557/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7891_full -&gt; XEIGTPW_11270_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11270_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11270_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11270_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-436/igt@xe_module_load@reload.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7891_full and XEIGTPW_11270_full:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11270_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-4/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-436/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-6/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-lnl-4/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-lnl-4/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_cursor_crc@cursor-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7891/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11270/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7891 -&gt; IGTPW_11270</li>
</ul>
<p>IGTPW_11270: 11270<br />
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34</p>

</body>
</html>

--===============7705020693564236867==--
