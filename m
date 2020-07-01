Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Jul 2020 12:30:27 -0000
Message-ID: <159360662784.16667.14320514760332499226@emeril.freedesktop.org>
References: <20200701075512.32265-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200701075512.32265-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Freg=5Fread=3A_Added_description_for_test_case_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_reg_read: Added description for test case (rev3)
URL   : https://patchwork.freedesktop.org/series/78901/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8682_full -> IGTPW_4722_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4722_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4722_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4722_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-edp1:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb3/igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-tglb3/igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-edp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4722_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [PASS][3] -> [TIMEOUT][4] ([i915#1340] / [i915#1958] / [i915#2119])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-glk5/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-glk4/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180] / [i915#93] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl1/igt@gem_eio@in-flight-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#2079])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl6/igt@gem_exec_balancer@bonded-early.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl4/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1635] / [i915#95]) +33 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl4/igt@gem_exec_reloc@basic-wc-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl7/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-hsw:          [PASS][11] -> [TIMEOUT][12] ([i915#1958] / [i915#2119]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-hsw8/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-hsw1/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#93] / [i915#95]) +39 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl1/igt@gem_madvise@dontneed-before-exec.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl6/igt@gem_madvise@dontneed-before-exec.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([i915#155])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#1635] / [i915#95]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl8/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#1185] / [i915#123])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_scaling@pipe-b-plane-scaling:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#402]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb6/igt@kms_plane_scaling@pipe-b-plane-scaling.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-tglb2/igt@kms_plane_scaling@pipe-b-plane-scaling.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@syncobj_wait@wait-all-complex:
    - shard-snb:          [PASS][41] -> [TIMEOUT][42] ([i915#1958] / [i915#2119]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-snb1/igt@syncobj_wait@wait-all-complex.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-snb6/igt@syncobj_wait@wait-all-complex.html

  
#### Possible fixes ####

  * igt@gem_exec_nop@basic-parallel:
    - shard-apl:          [DMESG-WARN][43] ([i915#1635] / [i915#95]) -> [PASS][44] +28 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl8/igt@gem_exec_nop@basic-parallel.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl7/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-glk1/igt@gem_exec_whisper@basic-fds-priority-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-snb:          [TIMEOUT][47] ([i915#1958] / [i915#2119]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-snb5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][49] ([i915#1436] / [i915#716]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][51] ([i915#93] / [i915#95]) -> [PASS][52] +38 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl4/igt@i915_getparams_basic@basic-eu-total.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl1/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][53] ([i915#402]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb8/igt@i915_module_load@reload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-tglb2/igt@i915_module_load@reload.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][55] ([i915#118] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][61] ([i915#72]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-apl:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_lease@lessee_list:
    - shard-hsw:          [TIMEOUT][67] ([i915#1958] / [i915#2119]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-hsw7/igt@kms_lease@lessee_list.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-hsw8/igt@kms_lease@lessee_list.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][69] ([fdo#108145] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][71] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][73] ([fdo#108145] / [i915#1635] / [i915#1982] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][75] ([i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][77] ([i915#1635] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][81] ([i915#1820]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl2/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_balancer@hog:
    - shard-hsw:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-hsw6/igt@gem_exec_balancer@hog.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-hsw1/igt@gem_exec_balancer@hog.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-apl:          [SKIP][85] ([fdo#109271]) -> [SKIP][86] ([fdo#109271] / [i915#1635]) +11 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl3/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl1/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1958] / [i915#2119]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-snb4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-snb6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-apl:          [SKIP][89] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][90] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl2/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-apl:          [SKIP][91] ([fdo#109271] / [fdo#111827]) -> [SKIP][92] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl3/igt@kms_color_chamelium@pipe-b-ctm-max.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl8/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][93] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][94] ([i915#1319] / [i915#2119])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl7/igt@kms_content_protection@atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][95] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][96] ([fdo#110321] / [i915#1635] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-bottom-edge:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [i915#1635]) -> [SKIP][98] ([fdo#109271]) +9 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl4/igt@kms_cursor_edge_walk@pipe-d-128x128-bottom-edge.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl1/igt@kms_cursor_edge_walk@pipe-d-128x128-bottom-edge.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][99] ([i915#1226]) -> [SKIP][100] ([fdo#109349])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          [TIMEOUT][101] ([i915#1958] / [i915#2119]) -> [SKIP][102] ([fdo#109271]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
    - shard-hsw:          [TIMEOUT][103] ([i915#1958] / [i915#2119]) -> [SKIP][104] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-hsw7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-hsw1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][105] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][106] ([fdo#108145] / [i915#265])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][107] ([fdo#108145] / [i915#95]) -> [FAIL][108] ([fdo#108145] / [i915#265])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#716]) -> [FAIL][114] ([i915#1635])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl1/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl3/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-apl7/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-apl7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118]) ([i915#1764] / [i915#2110]) -> [FAIL][119] ([i915#2110])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8682/shard-tglb3/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/shard-tglb7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4722
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8682: 15184d5254dbcb01e336f9d2cfecdf3fea883513 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4722: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4722/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
