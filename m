Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Nov 2020 18:42:13 -0000
Message-ID: <160563853392.25707.5386887500498933313@emeril.freedesktop.org>
References: <20201117144356.1253838-1-imre.deak@intel.com>
In-Reply-To: <20201117144356.1253838-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?fbdev=3A_Add_mmap_readback_subtest?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1816570299=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1816570299==
Content-Type: multipart/alternative;
 boundary="===============5506529674661256938=="

--===============5506529674661256938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/fbdev: Add mmap readback subtest
URL   : https://patchwork.freedesktop.org/series/83964/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9345_full -> IGTPW_5179_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5179_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5179_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5179_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-snb4/igt@gem_tiled_partial_pwrite_pread@writes.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-snb6/igt@gem_tiled_partial_pwrite_pread@writes.html
    - shard-hsw:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@writes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw8/igt@gem_tiled_partial_pwrite_pread@writes.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [SKIP][5] ([fdo#109271]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-snb2/igt@i915_pm_dc@dc5-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-snb2/igt@i915_pm_dc@dc5-psr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_hotunplug@hotrebind}:
    - shard-hsw:          [WARN][7] ([i915#2633]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw1/igt@core_hotunplug@hotrebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw8/igt@core_hotunplug@hotrebind.html
    - shard-iclb:         [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb6/igt@core_hotunplug@hotrebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb8/igt@core_hotunplug@hotrebind.html
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk4/igt@core_hotunplug@hotrebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt@core_hotunplug@hotrebind.html
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-kbl2/igt@core_hotunplug@hotrebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl3/igt@core_hotunplug@hotrebind.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9345_full and IGTPW_5179_full:

### New IGT tests (1) ###

  * igt@fbdev@mmap-readback:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_5179_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - shard-hsw:          [PASS][15] -> [INCOMPLETE][16] ([i915#1888] / [i915#2637])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw6/igt@gem_exec_suspend@basic-s0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw4/igt@gem_exec_suspend@basic-s0.html
    - shard-iclb:         [PASS][17] -> [INCOMPLETE][18] ([i915#1090] / [i915#1185])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb2/igt@gem_exec_suspend@basic-s0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb8/igt@gem_exec_suspend@basic-s0.html
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#2635])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk6/igt@gem_exec_suspend@basic-s0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt@gem_exec_suspend@basic-s0.html
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([i915#1635] / [i915#2635])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-apl7/igt@gem_exec_suspend@basic-s0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl3/igt@gem_exec_suspend@basic-s0.html
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([i915#155])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-kbl6/igt@gem_exec_suspend@basic-s0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl3/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:
    - shard-snb:          [PASS][25] -> [INCOMPLETE][26] ([i915#2651])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc.html

  * igt@i915_pm_rpm@gem-mmap-type@uc:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +7 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk9/igt@i915_pm_rpm@gem-mmap-type@uc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk2/igt@i915_pm_rpm@gem-mmap-type@uc.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#2346])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-vga1-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-vga1-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-snb:          [PASS][39] -> [FAIL][40] ([i915#2546])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-snb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-snb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1635] / [i915#1982]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw7/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw6/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#1982]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@blocking:
    - shard-hsw:          [PASS][51] -> [SKIP][52] ([fdo#109271]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw7/igt@perf@blocking.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw8/igt@perf@blocking.html
    - shard-glk:          [PASS][53] -> [SKIP][54] ([fdo#109271] / [i915#1354]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk4/igt@perf@blocking.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt@perf@blocking.html
    - shard-tglb:         [PASS][55] -> [SKIP][56] ([i915#1354]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb6/igt@perf@blocking.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb7/igt@perf@blocking.html

  * igt@perf@invalid-create-userspace-config:
    - shard-kbl:          [PASS][57] -> [SKIP][58] ([fdo#109271] / [i915#1354]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-kbl2/igt@perf@invalid-create-userspace-config.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl3/igt@perf@invalid-create-userspace-config.html
    - shard-apl:          [PASS][59] -> [SKIP][60] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-apl3/igt@perf@invalid-create-userspace-config.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl3/igt@perf@invalid-create-userspace-config.html
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([i915#1354]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb8/igt@perf@invalid-create-userspace-config.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb8/igt@perf@invalid-create-userspace-config.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-softpin:
    - shard-hsw:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw6/igt@gem_exec_reloc@basic-softpin.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw8/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-glk:          [INCOMPLETE][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk7/igt@gem_exec_whisper@basic-fds.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk8/igt@gem_exec_whisper@basic-fds.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][67] ([i915#2190]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][69] ([i915#1373] / [i915#2405]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb8/igt@gem_softpin@noreloc-s3.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb6/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][71] ([i915#1635] / [i915#2405] / [i915#2635]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl6/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][73] ([i915#2199] / [i915#2405] / [i915#2635]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk4/igt@gem_softpin@noreloc-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk4/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][75] ([i915#2405] / [i915#2637]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw6/igt@gem_softpin@noreloc-s3.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw6/igt@gem_softpin@noreloc-s3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][77] ([i915#2598]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-snb:          [FAIL][79] ([i915#2546]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-kbl:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][85] ([i915#433]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:
    - shard-kbl:          [FAIL][87] ([i915#2472]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-kbl1/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl6/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
    - shard-apl:          [FAIL][89] ([i915#1635] / [i915#2472]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-apl7/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [DMESG-WARN][91] ([i915#1635] / [i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-glk:          [DMESG-WARN][93] ([i915#1982]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk5/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [SKIP][97] ([i915#1354]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb7/igt@perf@oa-exponents.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb3/igt@perf@oa-exponents.html
    - shard-apl:          [SKIP][99] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-apl7/igt@perf@oa-exponents.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl2/igt@perf@oa-exponents.html
    - shard-kbl:          [SKIP][101] ([fdo#109271] / [i915#1354]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-kbl1/igt@perf@oa-exponents.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl1/igt@perf@oa-exponents.html
    - shard-iclb:         [SKIP][103] ([i915#1354]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-iclb3/igt@perf@oa-exponents.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb2/igt@perf@oa-exponents.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [FAIL][105] ([i915#1542]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw8/igt@perf@polling-parameterized.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [FAIL][107] ([i915#2644]) -> [WARN][108] ([i915#2283])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw8/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [DMESG-WARN][109] ([i915#2411]) -> [INCOMPLETE][110] ([i915#1436] / [i915#456])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb3/igt@gem_exec_suspend@basic-s0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [INCOMPLETE][111] ([i915#1373] / [i915#1436] / [i915#456]) -> [DMESG-WARN][112] ([i915#2411])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb3/igt@gem_softpin@noreloc-s3.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb1/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][113] ([i915#2405]) -> [DMESG-WARN][114] ([i915#180])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][115] ([i915#1319] / [i915#1635]) -> [FAIL][116] ([fdo#110321] / [i915#1635])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-apl4/igt@kms_content_protection@srm.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [DMESG-WARN][117] ([i915#2411]) -> [DMESG-WARN][118] ([i915#1982] / [i915#2411]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@runner@aborted:
    - shard-glk:          ([FAIL][119], [FAIL][120], [FAIL][121]) ([i915#1611] / [i915#2263] / [i915#2295] / [i915#2439] / [i915#86] / [k.org#202321]) -> ([FAIL][122], [FAIL][123], [FAIL][124]) ([i915#1611] / [i915#2295] / [i915#2439] / [k.org#202321])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk7/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk5/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][125], [FAIL][126]) ([i915#2295] / [i915#2439]) -> ([FAIL][127], [FAIL][128], [FAIL][129]) ([i915#1602] / [i915#2295] / [i915#2439])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb3/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb7/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb3/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb1/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1090]: https://gitlab.freedesktop.org/drm/intel/issues/1090
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2263]: https://gitlab.freedesktop.org/drm/intel/issues/2263
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2633]: https://gitlab.freedesktop.org/drm/intel/issues/2633
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2644]: https://gitlab.freedesktop.org/drm/intel/issues/2644
  [i915#2651]: https://gitlab.freedesktop.org/drm/intel/issues/2651
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5855 -> IGTPW_5179
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9345: 8b69b30f1a2a0937e0f2bf06dae524205e77218a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5179: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/index.html
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/index.html

--===============5506529674661256938==
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
<tr><td><b>Series:</b></td><td>tests/fbdev: Add mmap readback subtest</td><=
/tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83964/">https://patchwork.freedesktop.org/series/83964/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5179/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5179/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9345_full -&gt; IGTPW_5179_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5179_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5179_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5179=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-snb4/igt@gem_tiled_partial_pwrite_pread@writes.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/s=
hard-snb6/igt@gem_tiled_partial_pwrite_pread@writes.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@writes.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/s=
hard-hsw8/igt@gem_tiled_partial_pwrite_pread@writes.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_dc@dc5-psr:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-snb2/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-snb2/=
igt@i915_pm_dc@dc5-psr.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind}:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-hsw1/igt@core_hotunplug@hotrebind.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2633">i915#2633</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hs=
w8/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-iclb6/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb8/i=
gt@core_hotunplug@hotrebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-glk4/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt=
@core_hotunplug@hotrebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-kbl2/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl3/igt=
@core_hotunplug@hotrebind.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9345_full and IGTPW_5179_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@fbdev@mmap-readback:<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5179_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-hsw6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw4/ig=
t@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-iclb2/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb8/=
igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1090">i915#1090</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-glk6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/ig=
t@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-apl7/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-apl3/ig=
t@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-kbl6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-kbl3/ig=
t@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-=
busy@uc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5179/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-over=
lap-busy@uc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2651">i915#2651</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@uc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-glk9/igt@i915_pm_rpm@gem-mmap-type@uc.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk=
2/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +7 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
79/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-vga1-hdmi-a=
1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-hsw6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-m=
odeset@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5179/shard-hsw1/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-iclb5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_517=
9/shard-iclb7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1=
982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-i=
ndfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5179/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-spr-indfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-=
msflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5179/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-indfb-msflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-snb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
179/shard-snb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#254=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/s=
hard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1=
982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb1/igt=
@kms_psr2_su@page_flip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-=
iclb5/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-hsw7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw6/igt@kms_=
setmode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-featur=
es-pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5179/shard-kbl3/igt@kms_universal_plane@universal-plane-gen9-=
features-pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-hsw7/igt@perf@blocking.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-hsw8/igt@perf@block=
ing.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-glk4/igt@perf@blocking.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt@perf@block=
ing.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-tglb6/igt@perf@blocking.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb7/igt@perf@blo=
cking.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1354">i915#1354</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-create-userspace-config:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-kbl2/igt@perf@invalid-create-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/sh=
ard-kbl3/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-apl3/igt@perf@invalid-create-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/sh=
ard-apl3/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-iclb8/igt@perf@invalid-create-userspace-config.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/s=
hard-iclb8/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1=
 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-hsw6/igt@gem_exec_reloc@basic-softpin.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1=
982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
79/shard-hsw8/igt@gem_exec_reloc@basic-softpin.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-glk7/igt@gem_exec_whisper@basic-fds.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard=
-glk8/igt@gem_exec_whisper@basic-fds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tg=
lb3/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-iclb8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2=
405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
79/shard-iclb6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-apl3/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5179/shard-apl6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-glk4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5179/shard-glk4/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-hsw6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#26=
37</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_517=
9/shard-hsw6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2598">i915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5179/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-inter=
ruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mma=
p-gtt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5179/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-=
draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimar=
y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5179/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-shrfb-sc=
aledprimary.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-bl=
t.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5179/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb1010=
10-draw-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shar=
d-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-kbl1/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5179/shard-kbl6/igt@kms_plane@plane-position-hole-dpms-pipe-b-pl=
anes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-apl7/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5179/shard-apl4/igt@kms_plane@plane-position-hole-dpms-pip=
e-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-overlay-size-64:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
35">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5179/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-glk3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5179/shard-glk5/igt@kms_plane_cursor@pipe-a-overlay-size-64.html">P=
ASS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179=
/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-tglb7/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb3/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-apl7/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/s=
hard-apl2/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-kbl1/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-k=
bl1/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-iclb3/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-iclb2/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-hsw8/igt@perf@polling-parameterized.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard=
-hsw2/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2644">i915#2=
644</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
79/shard-hsw8/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb3/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179=
/shard-tglb1/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-tglb3/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1=
436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i=
915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5179/shard-tglb1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9345/shard-kbl2/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shar=
d-kbl7/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-apl4/igt@kms_content_protection@srm.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#=
1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
179/shard-apl7/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D110321">fdo#110321</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/241=
1">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5179/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982=
">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2411">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-glk5/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9345/shard-glk4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2263">i915#2263</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/86">i915#86=
</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.o=
rg#202321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5179/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-glk1/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
79/shard-glk1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=
=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)=
</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9345/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9345/shard-tglb7/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5179/shard-tglb3/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/shard-tglb1/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5179/shard-tglb6/igt@runner@aborted.html">FAIL</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i9=
15#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5855 -&gt; IGTPW_5179</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9345: 8b69b30f1a2a0937e0f2bf06dae524205e77218a @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5179: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5179/index.htm=
l<br />
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5506529674661256938==--

--===============1816570299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1816570299==--
