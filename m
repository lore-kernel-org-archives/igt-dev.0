Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DC2F45A13
	for <igt-dev@archiver.kernel.org>; Sat, 11 Apr 2026 00:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170EB10E05E;
	Sat, 11 Apr 2026 00:12:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B3710E1D7;
 Sat, 11 Apr 2026 00:12:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7629349920018154442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/xe=3A_Add_purgeable_?=
 =?utf-8?q?memory_madvise_tests_for_system_allocator_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 11 Apr 2026 00:12:22 -0000
Message-ID: <177586634287.452684.7546991867752047824@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260410093525.2409612-1-arvind.yadav@intel.com>
In-Reply-To: <20260410093525.2409612-1-arvind.yadav@intel.com>
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

--===============7629349920018154442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add purgeable memory madvise tests for system allocator (rev9)
URL   : https://patchwork.freedesktop.org/series/160333/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8853_FULL -> XEIGTPW_14962_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14962_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14962_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14962_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-10/igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html

  * igt@xe_madvise@per-vma-protection (NEW):
    - shard-lnl:          NOTRUN -> [INCOMPLETE][3] +5 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@xe_madvise@per-vma-protection.html

  
New tests
---------

  New tests have been introduced between XEIGT_8853_FULL and XEIGTPW_14962_FULL:

### New IGT tests (7) ###

  * igt@xe_madvise@dontneed-after-exec:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 7.59] s

  * igt@xe_madvise@dontneed-after-mmap:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 7.75] s

  * igt@xe_madvise@dontneed-before-exec:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 8.61] s

  * igt@xe_madvise@dontneed-before-mmap:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_madvise@per-vma-protection:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 15.28] s

  * igt@xe_madvise@per-vma-tracking:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 7.46] s

  * igt@xe_madvise@purged-mmap-blocked:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 7.36] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14962_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#7445])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-9/igt@intel_hwmon@hwmon-write.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#373]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1424])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#309] / [Intel XE#7343])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#7178] / [Intel XE#7349])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#6312] / [Intel XE#651])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#656]) +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#7061] / [Intel XE#7356])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#7308])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7283])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#4608])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#4608] / [Intel XE#7304])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1406])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-7/igt@kms_psr@fbc-pr-primary-render.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7636]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][26] -> [INCOMPLETE][27] ([Intel XE#6321])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#6540] / [Intel XE#688])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#7482]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1392])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7136]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6874]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7138]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#4130] / [Intel XE#7366])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][36] ([Intel XE#7571]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][38] ([Intel XE#7340]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][40] ([Intel XE#6321]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@eu-fault-4k-range-device-host:
    - shard-bmg:          [FAIL][42] ([Intel XE#7592]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-4/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-1/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][44] ([Intel XE#5625]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
    - shard-bmg:          [FAIL][46] ([Intel XE#5937]) -> [PASS][47] +4 other tests pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-10/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][48] ([Intel XE#6569]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][50] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][51] ([Intel XE#4596])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][52] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][53] ([Intel XE#2426] / [Intel XE#5848])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][54] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][55] ([Intel XE#2509] / [Intel XE#7437])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7592
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636


Build changes
-------------

  * IGT: IGT_8853 -> IGTPW_14962

  IGTPW_14962: 305e3b6a854ed0f9f2473ff5dcf4ff247d1b7af4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8853: b52b42b0c987404a8cbf80c77a41e37705e32779 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4883-56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db: 56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/index.html

--===============7629349920018154442==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add purgeable memory madvise tests for system allocator (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160333/">https://patchwork.freedesktop.org/series/160333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8853_FULL -&gt; XEIGTPW_14962_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14962_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14962_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14962_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-10/igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@per-vma-protection (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@xe_madvise@per-vma-protection.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8853_FULL and XEIGTPW_14962_FULL:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@xe_madvise@dontneed-after-exec:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 7.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@dontneed-after-mmap:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 7.75] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@dontneed-before-exec:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 8.61] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@dontneed-before-mmap:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@per-vma-protection:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 15.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@per-vma-tracking:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 7.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@purged-mmap-blocked:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 7.36] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14962_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-9/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-7/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-3/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-4k-range-device-host:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-4/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7592">Intel XE#7592</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-1/igt@xe_exec_system_allocator@eu-fault-4k-range-device-host.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-10/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8853/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14962/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8853 -&gt; IGTPW_14962</li>
</ul>
<p>IGTPW_14962: 305e3b6a854ed0f9f2473ff5dcf4ff247d1b7af4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8853: b52b42b0c987404a8cbf80c77a41e37705e32779 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4883-56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db: 56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db</p>

</body>
</html>

--===============7629349920018154442==--
