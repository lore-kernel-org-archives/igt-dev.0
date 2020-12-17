Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 17 Dec 2020 15:26:24 -0000
Message-ID: <160821878411.2008.9308719461251886915@emeril.freedesktop.org>
References: <20201217015000.2213437-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20201217015000.2213437-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Added_test_description_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0595169716=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0595169716==
Content-Type: multipart/alternative;
 boundary="===============2533203080602696505=="

--===============2533203080602696505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Added test description (rev2)
URL   : https://patchwork.freedesktop.org/series/84776/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5906_full -> IGTPW_5306_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5306_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5306_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5306_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-vga1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-hsw6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-vga1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-hsw7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-vga1.html

  
New tests
---------

  New tests have been introduced between IGT_5906_full and IGTPW_5306_full:

### New IGT tests (4) ###

  * igt@kms_atomic_transition@modeset-transition:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5306_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][3] -> [FAIL][4] ([i915#1567])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-tglb1/igt@i915_suspend@debugfs-reader.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb3/igt@i915_suspend@debugfs-reader.html
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#1602] / [i915#2635]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-glk5/igt@i915_suspend@debugfs-reader.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk2/igt@i915_suspend@debugfs-reader.html
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1602] / [i915#2635]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-apl8/igt@i915_suspend@debugfs-reader.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl4/igt@i915_suspend@debugfs-reader.html
    - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#1602])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb7/igt@i915_suspend@debugfs-reader.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk8/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][14] ([fdo#109284] / [fdo#111827])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#109284] / [fdo#111827])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb2/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-kbl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl3/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][18] -> [FAIL][19] ([i915#2598])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271]) +6 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#109280]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#111825]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][23] ([fdo#109271]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271]) +23 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1185] / [i915#1602] / [i915#250])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#155]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#2637]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-glk6/igt@perf_pmu@rc6-runtime-pm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk2/igt@perf_pmu@rc6-runtime-pm.html
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-apl2/igt@perf_pmu@rc6-runtime-pm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl4/igt@perf_pmu@rc6-runtime-pm.html
    - shard-kbl:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl6/igt@perf_pmu@rc6-runtime-pm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl4/igt@perf_pmu@rc6-runtime-pm.html
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([fdo#111719])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-tglb7/igt@perf_pmu@rc6-runtime-pm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb3/igt@perf_pmu@rc6-runtime-pm.html
    - shard-hsw:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-hsw4/igt@perf_pmu@rc6-runtime-pm.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-hsw2/igt@perf_pmu@rc6-runtime-pm.html
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([i915#293])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb3/igt@perf_pmu@rc6-runtime-pm.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/igt@perf_pmu@rc6-runtime-pm.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][49], [FAIL][50]) ([i915#2295])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-hsw6/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-hsw2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][51] ([i915#658]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb6/igt@feature_discovery@psr2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb2/igt@feature_discovery@psr2.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [TIMEOUT][53] ([i915#2795]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-tglb1/igt@gem_vm_create@destroy-race.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb8/igt@gem_vm_create@destroy-race.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [INCOMPLETE][55] ([CI#80] / [i915#2295]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-glk2/igt@gem_workarounds@suspend-resume-context.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][57] ([i915#454]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-glk:          [FAIL][61] ([i915#49]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][63] ([i915#433]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-kbl:          [DMESG-WARN][65] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl7/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][69] ([i915#588]) -> [SKIP][70] ([i915#658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][71] ([i915#2681] / [i915#2684]) -> [FAIL][72] ([i915#2680])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][73] ([fdo#109349]) -> [DMESG-WARN][74] ([i915#1226])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][75], [FAIL][76], [FAIL][77]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][78], [FAIL][79], [FAIL][80]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2722] / [i915#483] / [i915#602])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl7/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl6/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl4/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl7/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl4/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         [FAIL][81] ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -> ([FAIL][82], [FAIL][83], [FAIL][84]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-iclb5/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          [FAIL][85] ([i915#2295] / [i915#2722]) -> ([FAIL][86], [FAIL][87], [FAIL][88]) ([i915#1814] / [i915#2295] / [i915#2722])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-apl7/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl4/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl6/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl6/igt@runner@aborted.html
    - shard-glk:          [FAIL][89] ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][90], [FAIL][91], [FAIL][92]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-glk2/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk2/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk3/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk1/igt@runner@aborted.html
    - shard-tglb:         [FAIL][93] ([i915#2295] / [i915#2722]) -> ([FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2722])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-tglb7/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb7/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb1/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb5/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1567]: https://gitlab.freedesktop.org/drm/intel/issues/1567
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2680]: https://gitlab.freedesktop.org/drm/intel/issues/2680
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2795]: https://gitlab.freedesktop.org/drm/intel/issues/2795
  [i915#2802]: https://gitlab.freedesktop.org/drm/intel/issues/2802
  [i915#293]: https://gitlab.freedesktop.org/drm/intel/issues/293
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5906 -> IGTPW_5306

  CI-20190529: 20190529
  CI_DRM_9496: c1bf99ceda83bcdd33f05515deb9efc3649d449e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5306: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/index.html
  IGT_5906: f5b022a2e5054ee7e335d7856344807308db6d6f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/index.html

--===============2533203080602696505==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_plane: Added test description (rev=
2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84776/">https://patchwork.freedesktop.org/series/84776/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5306/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5306/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5906_full -&gt; IGTPW_5306_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5306_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5306_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5306=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-vga1:<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-hsw6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-vg=
a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5306/shard-hsw7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
vga1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5906_full and IGTPW_5306_full=
:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5306_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tg=
lb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1567">i915#1567</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-tglb1/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb3/i=
gt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)=
 +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-glk5/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk2/igt=
@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) +1 similar is=
sue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-apl8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl4/igt=
@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) +1 similar is=
sue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-iclb7/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/i=
gt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5306/shard-glk8/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5306/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5306/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5306/shard-tglb2/igt@kms_color_chamelium@pipe-a-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5306/shard-kbl3/igt@kms_color_chamelium@pipe-d-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-e=
dp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5306/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5306/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5306/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +3 similar issues</=
p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5306/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +3 similar issues</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5306/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-rgb=
565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5306/shard-kbl4/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-=
c-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5306/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-susp=
end-pipe-c-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/250">i915#250</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c=
-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5306/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspen=
d-pipe-c-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/155">i915#155</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c=
-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5306/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspen=
d-pipe-c-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2637">i915#2637</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-=
c-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5306/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-susp=
end-pipe-c-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-icl=
b8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306=
/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-glk6/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk2/igt@per=
f_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-apl2/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl4/igt@per=
f_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-kbl6/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl4/igt@per=
f_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-tglb7/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb3/igt@p=
erf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111719">fdo#111719</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-hsw4/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-hsw2/igt@per=
f_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-iclb3/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/igt@p=
erf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/293">i915#293</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5306/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-hsw2/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb2/i=
gt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-tglb1/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2795">i915#2795</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shar=
d-tglb8/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-glk2/igt@gem_workarounds@suspend-resume-context.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/gfx-ci/i915-infra/issu=
es/80">CI#80</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2295">i915#2295</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5306/shard-glk2/igt@gem_workarounds@suspend-resume-context.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-iclb7/igt@i=
915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5306/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msf=
lip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5306/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
shrfb-msflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-t=
glb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-y.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i915#1=
65</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/78"=
>i915#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5306/shard-kbl7/igt@kms_plane_lowres@pipe-b-tiling-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/sh=
ard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shar=
d-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2=
684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
06/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2680">i915#2680</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/=
shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5906/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/shard-kbl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5906/s=
hard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5306/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-kbl2/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/602">i915#602</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-iclb5/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/sha=
rd-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5306/shard-iclb5/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-ic=
lb4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-apl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl4/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5306/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-apl6/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-glk2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=
=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shar=
d-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5306/shard-glk3/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-glk1/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https:=
//bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5906/shard-tglb7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5306/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/shard-tglb5/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5306/shard-tglb3/igt@runner@aborted.html">FAIL</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i9=
15#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5906 -&gt; IGTPW_5306</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9496: c1bf99ceda83bcdd33f05515deb9efc3649d449e @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5306: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5306/index.htm=
l<br />
  IGT_5906: f5b022a2e5054ee7e335d7856344807308db6d6f @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2533203080602696505==--

--===============0595169716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0595169716==--
