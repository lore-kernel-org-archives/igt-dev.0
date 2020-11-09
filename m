Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Nov 2020 15:49:17 -0000
Message-ID: <160493695726.18041.3335571519300960332@emeril.freedesktop.org>
References: <20201107111544.65260-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201107111544.65260-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr=3A_Check_for_available_modesetting_support_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1062751483=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1062751483==
Content-Type: multipart/alternative;
 boundary="===============2994334491158436985=="

--===============2994334491158436985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_psr: Check for available modesetting support (rev2)
URL   : https://patchwork.freedesktop.org/series/83602/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9296_full -> IGTPW_5147_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5147_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5147_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5147_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@bonded-dual:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl6/igt@gem_exec_balancer@bonded-dual.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl2/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_partial_pwrite_pread@reads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb4/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-snb:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_partial_pwrite_pread@write-display.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb2/igt@gem_partial_pwrite_pread@write-display.html

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-iclb:         [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb5/igt@perf_pmu@rc6-runtime-pm-long.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb3/igt@perf_pmu@rc6-runtime-pm-long.html

  
Known issues
------------

  Here are the changes found in IGTPW_5147_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#1635] / [i915#2389])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#1888] / [i915#2261])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@gem_partial_pwrite_pread@reads.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#1888])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb3/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb5/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@i915_pm_rpm@basic-pci-d3-state.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk6/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl4/igt@i915_pm_rpm@basic-rte.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@i915_pm_rpm@basic-rte.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1635] / [i915#579])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@i915_pm_rpm@basic-rte.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl1/igt@i915_pm_rpm@basic-rte.html
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#579])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@i915_pm_rpm@basic-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk1/igt@i915_pm_rpm@basic-rte.html
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#579])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb5/igt@i915_pm_rpm@basic-rte.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb6/igt@i915_pm_rpm@basic-rte.html
    - shard-hsw:          [PASS][29] -> [FAIL][30] ([i915#579])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@i915_pm_rpm@basic-rte.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [PASS][31] -> [SKIP][32] ([fdo#109271]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw7/igt@i915_pm_rpm@pm-tiling.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html
    - shard-kbl:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@i915_pm_rpm@pm-tiling.html
    - shard-apl:          [PASS][35] -> [SKIP][36] ([fdo#109271] / [i915#1635]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@i915_pm_rpm@pm-tiling.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl6/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#96])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1635] / [i915#1982]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl3/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@2x-flip-vs-modeset@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_flip@2x-flip-vs-modeset@ab-vga1-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@kms_flip@2x-flip-vs-modeset@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#2122])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][49] -> [FAIL][50] ([i915#2598]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#2122])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#49])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [PASS][55] -> [INCOMPLETE][56] ([i915#1185] / [i915#123])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb7/igt@kms_frontbuffer_tracking@psr-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109441]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][59] -> [FAIL][60] ([i915#31])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw6/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw7/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][61] -> [DMESG-WARN][62] ([i915#1982]) +7 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-glk:          [PASS][63] -> [FAIL][64] ([i915#43])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk1/igt@kms_vblank@pipe-b-accuracy-idle.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk5/igt@kms_vblank@pipe-b-accuracy-idle.html

  * igt@perf@buffer-fill:
    - shard-kbl:          [PASS][65] -> [SKIP][66] ([fdo#109271] / [i915#1354]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@perf@buffer-fill.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@perf@buffer-fill.html
    - shard-apl:          [PASS][67] -> [SKIP][68] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl7/igt@perf@buffer-fill.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl6/igt@perf@buffer-fill.html
    - shard-glk:          [PASS][69] -> [SKIP][70] ([fdo#109271] / [i915#1354]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@perf@buffer-fill.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk6/igt@perf@buffer-fill.html
    - shard-iclb:         [PASS][71] -> [SKIP][72] ([i915#1354])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb3/igt@perf@buffer-fill.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb3/igt@perf@buffer-fill.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [PASS][73] -> [SKIP][74] ([i915#1354]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb1/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb6/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
#### Possible fixes ####

  * {igt@core_hotunplug@hotrebind}:
    - shard-tglb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb6/igt@core_hotunplug@hotrebind.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@core_hotunplug@hotrebind.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-snb:          [INCOMPLETE][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_partial_pwrite_pread@reads-display.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb2/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_softpin@noreloc-interruptible:
    - shard-hsw:          [FAIL][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw8/igt@gem_softpin@noreloc-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw7/igt@gem_softpin@noreloc-interruptible.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [SKIP][81] ([fdo#109271]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@i915_pm_rpm@system-suspend-modeset.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk9/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [SKIP][83] ([i915#579]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb7/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-apl:          [SKIP][85] ([fdo#109271] / [i915#1635]) -> [PASS][86] +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [INCOMPLETE][87] ([i915#1635]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@i915_suspend@forcewake.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl2/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-snb:          [FAIL][89] -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [INCOMPLETE][91] ([i915#1635] / [i915#2635]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [INCOMPLETE][93] ([i915#1185]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [INCOMPLETE][95] ([i915#2635]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [INCOMPLETE][97] ([i915#2637]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [INCOMPLETE][99] ([i915#155]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [DMESG-WARN][101] ([i915#1982]) -> [PASS][102] +4 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-apl:          [DMESG-WARN][103] ([i915#1635] / [i915#1982]) -> [PASS][104] +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-hsw:          [INCOMPLETE][105] -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw8/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][107] ([i915#1982]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][109] ([i915#2122]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-iclb:         [DMESG-WARN][111] ([i915#1982]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-snb:          [FAIL][113] ([i915#2546]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb5/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][115] ([fdo#109642] / [fdo#111068]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][117] ([fdo#109441]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-glk:          [INCOMPLETE][119] -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-query-forked-busy-hang:
    - shard-hsw:          [DMESG-WARN][121] ([i915#44]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw8/igt@kms_vblank@pipe-b-query-forked-busy-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][123] ([fdo#109271]) -> [PASS][124] +6 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-kbl:          [SKIP][125] ([fdo#109271]) -> [PASS][126] +4 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][127] ([fdo#109278]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][129] ([i915#1982]) -> [PASS][130] +4 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl6/igt@kms_vblank@pipe-c-wait-idle.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [SKIP][131] ([fdo#109271] / [i915#1354]) -> [PASS][132] +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk9/igt@perf@disabled-read-error.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk3/igt@perf@disabled-read-error.html
    - shard-apl:          [SKIP][133] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][134] +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl3/igt@perf@disabled-read-error.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl4/igt@perf@disabled-read-error.html
    - shard-kbl:          [SKIP][135] ([fdo#109271] / [i915#1354]) -> [PASS][136] +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl2/igt@perf@disabled-read-error.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl7/igt@perf@disabled-read-error.html
    - shard-tglb:         [SKIP][137] ([i915#1354]) -> [PASS][138] +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb6/igt@perf@disabled-read-error.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb2/igt@perf@disabled-read-error.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [SKIP][139] ([i915#1354]) -> [PASS][140] +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb6/igt@perf@invalid-remove-userspace-config.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb2/igt@perf@invalid-remove-userspace-config.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [WARN][141] ([i915#2283]) -> [FAIL][142] ([i915#2644])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@core_hotunplug@hotrebind-lateclose.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][143] ([i915#1515]) -> [FAIL][144] ([i915#1515])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-tglb:         [DMESG-WARN][145] ([i915#2411]) -> [FAIL][146] ([i915#579])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@i915_pm_rpm@basic-rte.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-tglb:         [SKIP][147] ([i915#579]) -> [DMESG-WARN][148] ([i915#2411]) +2 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@i915_pm_rpm@gem-pread.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb7/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][149] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][150] ([i915#579])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][151] ([fdo#110892]) -> [SKIP][152] ([i915#579])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][153] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][154] ([i915#2411])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][155] ([i915#1226]) -> [SKIP][156] ([fdo#109349])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [DMESG-WARN][157] ([i915#2411]) -> [INCOMPLETE][158] ([i915#1436] / [i915#456])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_frontbuffer_tracking@psr-suspend.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][159] -> [DMESG-WARN][160] ([i915#2411]) +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][161] ([i915#1436] / [i915#456]) -> [DMESG-WARN][162] ([i915#2411])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][163] ([fdo#109271] / [i915#1635]) -> [SKIP][164] ([fdo#109271] / [i915#1354] / [i915#1635])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl6/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl7/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-glk:          [SKIP][165] ([fdo#109271]) -> [SKIP][166] ([fdo#109271] / [i915#1354])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk5/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-iclb:         [SKIP][167] ([fdo#109289]) -> [

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/index.html

--===============2994334491158436985==
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
<tr><td><b>Series:</b></td><td>tests/kms_psr: Check for available modesetting support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83602/">https://patchwork.freedesktop.org/series/83602/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9296_full -&gt; IGTPW_5147_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5147_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5147_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5147_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl6/igt@gem_exec_balancer@bonded-dual.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl2/igt@gem_exec_balancer@bonded-dual.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_partial_pwrite_pread@reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb4/igt@gem_partial_pwrite_pread@reads.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_partial_pwrite_pread@write-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb2/igt@gem_partial_pwrite_pread@write-display.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm-long:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb5/igt@perf_pmu@rc6-runtime-pm-long.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb3/igt@perf_pmu@rc6-runtime-pm-long.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5147_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#1635] / [i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@gem_partial_pwrite_pread@reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@gem_partial_pwrite_pread@reads.html">FAIL</a> ([i915#1888] / [i915#2261])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">FAIL</a> ([i915#1888])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb3/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb5/igt@i915_module_load@reload.html">DMESG-WARN</a> ([i915#1982]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk6/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> ([fdo#109271]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl4/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#579])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl1/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#1635] / [i915#579])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk1/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb5/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb6/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#579])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw7/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109271]) +5 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109271]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109271] / [i915#1635]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> ([i915#96])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl3/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">DMESG-WARN</a> ([i915#1982]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_flip@2x-flip-vs-modeset@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@kms_flip@2x-flip-vs-modeset@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb7/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb3/igt@kms_frontbuffer_tracking@psr-suspend.html">INCOMPLETE</a> ([i915#1185] / [i915#123])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw7/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> ([i915#1982]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk1/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk5/igt@kms_vblank@pipe-b-accuracy-idle.html">FAIL</a> ([i915#43])</li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@perf@buffer-fill.html">SKIP</a> ([fdo#109271] / [i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl7/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl6/igt@perf@buffer-fill.html">SKIP</a> ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk6/igt@perf@buffer-fill.html">SKIP</a> ([fdo#109271] / [i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb3/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb3/igt@perf@buffer-fill.html">SKIP</a> ([i915#1354])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb1/igt@perf@gen12-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb6/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#1354]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb6/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@core_hotunplug@hotrebind.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_partial_pwrite_pread@reads-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb2/igt@gem_partial_pwrite_pread@reads-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-interruptible:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw8/igt@gem_softpin@noreloc-interruptible.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw7/igt@gem_softpin@noreloc-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk9/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb7/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> ([fdo#109271] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl2/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#1635] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#1185]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw8/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@kms_frontbuffer_tracking@fbc-badstride.html">FAIL</a> ([i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-snb5/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy-hang:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">DMESG-WARN</a> ([i915#44]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw8/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> ([fdo#109278]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl6/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl6/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk9/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk3/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl3/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl4/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl2/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-kbl7/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb6/igt@perf@disabled-read-error.html">SKIP</a> ([i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb2/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-remove-userspace-config:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb6/igt@perf@invalid-remove-userspace-config.html">SKIP</a> ([i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb2/igt@perf@invalid-remove-userspace-config.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-hsw1/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a> ([i915#2644])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1515]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#1515])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@i915_pm_rpm@gem-pread.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb7/igt@i915_pm_rpm@gem-pread.html">DMESG-WARN</a> ([i915#2411]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> ([i915#1226]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> ([fdo#109349])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb8/igt@kms_frontbuffer_tracking@psr-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">DMESG-WARN</a> ([i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl6/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109271] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-apl7/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109271] / [i915#1354] / [i915#1635])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5147/shard-glk5/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-iclb:         [SKIP][167] ([fdo#109289]) -&gt; [</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2994334491158436985==--

--===============1062751483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1062751483==--
