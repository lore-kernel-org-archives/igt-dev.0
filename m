Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5F7C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 14:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2CB10E106;
	Wed,  3 Jul 2024 14:40:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF1010E021;
 Wed,  3 Jul 2024 14:40:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2887631076280039400=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_lib=3A_igt=5Ffb/rendercopy_fi?=
 =?utf-8?q?xes/cleanups_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Jul 2024 14:40:57 -0000
Message-ID: <172001765777.24496.3345867261315560684@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
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

--===============2887631076280039400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: igt_fb/rendercopy fixes/cleanups (rev6)
URL   : https://patchwork.freedesktop.org/series/135374/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7911_full -> XEIGTPW_11351_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11351_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unplug-rescan:
    - {shard-lnl}:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-5/igt@core_hotunplug@unplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-8/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - {shard-lnl}:        [SKIP][3] ([Intel XE#656]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - {shard-lnl}:        [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11351_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124] / [Intel XE#1201])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214]) +3 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1195] / [Intel XE#2049])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#658])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_psr@pr-basic.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#1600])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][24] -> [TIMEOUT][25] ([Intel XE#1473] / [Intel XE#392])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][27] ([Intel XE#1999]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#979])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#569])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#1760])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - {shard-lnl}:        [FAIL][32] ([Intel XE#1659]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_color@gamma:
    - shard-dg2-set2:     [INCOMPLETE][34] ([Intel XE#1150] / [Intel XE#1195]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-434/igt@kms_color@gamma.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-433/igt@kms_color@gamma.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][36] ([Intel XE#1214] / [Intel XE#1551]) -> [PASS][37] +2 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3}:
    - {shard-lnl}:        [DMESG-WARN][38] ([Intel XE#324]) -> [PASS][39] +6 other tests pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_pm_dc@dc6-dpms:
    - {shard-lnl}:        [FAIL][40] ([Intel XE#1430]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - {shard-lnl}:        [FAIL][42] ([Intel XE#1522]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][44] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][46] ([Intel XE#1473]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-null:
    - shard-dg2-set2:     [INCOMPLETE][48] ([Intel XE#1195]) -> [PASS][49] +2 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@xe_exec_basic@many-execqueues-many-vm-null.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-434/igt@xe_exec_basic@many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:
    - {shard-lnl}:        [INCOMPLETE][50] -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-6/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-6/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-dg2-set2:     [FAIL][52] ([Intel XE#1069]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@xe_exec_compute_mode@twice-basic.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-433/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - {shard-lnl}:        [ABORT][54] ([Intel XE#2097]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-rebind:
    - {shard-lnl}:        [INCOMPLETE][56] ([Intel XE#1169]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-7/igt@xe_exec_threads@threads-rebind.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-3/igt@xe_exec_threads@threads-rebind.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][58] ([Intel XE#1204]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@xe_module_load@reload-no-display.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - {shard-lnl}:        [INCOMPLETE][60] ([Intel XE#1616]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-4/igt@xe_pm@s2idle-vm-bind-userptr.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][62] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm_residency@idle-residency:
    - {shard-lnl}:        [FAIL][64] ([Intel XE#1442]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-2/igt@xe_pm_residency@idle-residency.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-6/igt@xe_pm_residency@idle-residency.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-hammer:
    - {shard-lnl}:        [FAIL][66] ([Intel XE#1081]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-1/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-2/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html

  * igt@xe_vm@mmap-style-bind-front:
    - shard-dg2-set2:     [DMESG-WARN][68] ([Intel XE#1214]) -> [PASS][69] +6 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@xe_vm@mmap-style-bind-front.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@xe_vm@mmap-style-bind-front.html

  
#### Warnings ####

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2-set2:     [SKIP][70] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][71] ([Intel XE#1201] / [Intel XE#373])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][72] ([Intel XE#1551]) -> [FAIL][73] ([Intel XE#616]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][74] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][75] ([Intel XE#1214] / [Intel XE#1551])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#1551]) -> [INCOMPLETE][77] ([Intel XE#1195] / [Intel XE#2049])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][78] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][79] ([Intel XE#1201] / [Intel XE#653])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][80] ([Intel XE#616]) -> [INCOMPLETE][81] ([Intel XE#1195]) +1 other test incomplete
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][82] ([Intel XE#1729]) -> [SKIP][83] ([Intel XE#1201] / [Intel XE#362])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1192] / [Intel XE#1201]) -> [FAIL][85] ([Intel XE#1999])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][86] ([Intel XE#1214] / [Intel XE#1760]) -> [SKIP][87] ([Intel XE#1130] / [Intel XE#1201])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-463/igt@xe_wedged@basic-wedged.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-436/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
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
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7911 -> IGTPW_11351

  IGTPW_11351: 21859257fd2d22fa258a1e3f8bee5eba22842480 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7911: d0d71f374c95a89a3bdcd104c7d8c2043f79e37a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1548-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/index.html

--===============2887631076280039400==
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
<tr><td><b>Series:</b></td><td>lib: igt_fb/rendercopy fixes/cleanups (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135374/">https://patchwork.freedesktop.org/series/135374/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7911_full -&gt; XEIGTPW_11351_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11351_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-5/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-8/igt@core_hotunplug@unplug-rescan.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11351_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-434/igt@kms_color@gamma.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-433/igt@kms_color@gamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@xe_exec_basic@many-execqueues-many-vm-null.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-434/igt@xe_exec_basic@many-execqueues-many-vm-null.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-6/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-6/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@xe_exec_compute_mode@twice-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-433/igt@xe_exec_compute_mode@twice-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097">Intel XE#2097</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-7/igt@xe_exec_threads@threads-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-3/igt@xe_exec_threads@threads-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-4/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@xe_pm@s3-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-2/igt@xe_pm_residency@idle-residency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442">Intel XE#1442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-6/igt@xe_pm_residency@idle-residency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-lnl-1/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-lnl-2/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-front:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@xe_vm@mmap-style-bind-front.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-435/igt@xe_vm@mmap-style-bind-front.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7911/shard-dg2-463/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11351/shard-dg2-436/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7911 -&gt; IGTPW_11351</li>
</ul>
<p>IGTPW_11351: 21859257fd2d22fa258a1e3f8bee5eba22842480 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7911: d0d71f374c95a89a3bdcd104c7d8c2043f79e37a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1548-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299</p>

</body>
</html>

--===============2887631076280039400==--
