Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Jul 2020 18:36:42 -0000
Message-ID: <159483820264.3436.15144943014425893814@emeril.freedesktop.org>
References: <20200715120339.11403-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200715120339.11403-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Use_igt=5Fassert_on_bufmgr?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1078661886=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1078661886==
Content-Type: multipart/alternative;
 boundary="===============7473010144398224680=="

--===============7473010144398224680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_fb: Use igt_assert on bufmgr
URL   : https://patchwork.freedesktop.org/series/79518/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8750_full -> IGTPW_4764_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4764_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4764_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4764_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html

  
Known issues
------------

  Here are the changes found in IGTPW_4764_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_fence@parallel@vcs0:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk1/igt@gem_exec_fence@parallel@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk8/igt@gem_exec_fence@parallel@vcs0.html

  * igt@gem_mmap_gtt@basic-short:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb5/igt@gem_mmap_gtt@basic-short.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb6/igt@gem_mmap_gtt@basic-short.html
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([i915#1958] / [i915#2119]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@gem_mmap_gtt@basic-short.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw1/igt@gem_mmap_gtt@basic-short.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#57])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb8/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#402])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#1911])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb8/igt@kms_psr2_su@frontbuffer.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109642] / [fdo#111068])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1542])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb7/igt@perf@polling-parameterized.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb3/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][31] ([i915#118] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_softpin@noreloc-interruptible:
    - shard-snb:          [INCOMPLETE][33] ([i915#82]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb6/igt@gem_softpin@noreloc-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb6/igt@gem_softpin@noreloc-interruptible.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-glk:          [DMESG-WARN][35] ([i915#1982]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][37] ([i915#79]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][39] ([i915#1982]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          [FAIL][41] ([i915#1635] / [i915#79]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-tglb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [FAIL][47] ([i915#247]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl7/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl2/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          [FAIL][49] ([i915#1635] / [i915#247]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-apl6/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-apl8/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-iclb5/igt@kms_psr@psr2_primary_mmap_gtt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-a-query-busy-hang:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958] / [i915#2119]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@kms_vblank@pipe-a-query-busy-hang.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw1/igt@kms_vblank@pipe-a-query-busy-hang.html
    - shard-snb:          [TIMEOUT][57] ([i915#1958] / [i915#2119]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb6/igt@kms_vblank@pipe-a-query-busy-hang.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb2/igt@kms_vblank@pipe-a-query-busy-hang.html

  * igt@testdisplay:
    - shard-kbl:          [TIMEOUT][59] ([i915#1692] / [i915#1958] / [i915#2119]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl2/igt@testdisplay.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl1/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][61] ([i915#2036]) -> [WARN][62] ([i915#2021])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb4/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-hsw:          [INCOMPLETE][63] ([i915#1958]) -> [SKIP][64] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@gen9_exec_parse@bb-start-far.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw2/igt@gen9_exec_parse@bb-start-far.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][65] ([i915#155]) -> [DMESG-WARN][66] ([i915#180])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_plane_cursor@pipe-d-overlay-size-128:
    - shard-hsw:          [TIMEOUT][67] ([i915#1958] / [i915#2119]) -> [SKIP][68] ([fdo#109271]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw7/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
    - shard-snb:          [TIMEOUT][69] ([i915#1958] / [i915#2119]) -> [SKIP][70] ([fdo#109271]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb6/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb2/igt@kms_plane_cursor@pipe-d-overlay-size-128.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5735 -> IGTPW_4764
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8750: 0714e0ca72205b9c38c4b2a09d8d5981637af2fb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4764: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/index.html
  IGT_5735: 21f8204e54c122e4a0f8ca4b59e4b2db8d1ba687 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/index.html

--===============7473010144398224680==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_fb: Use igt_assert on bufmgr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79518/">https://patchwork.freedesktop.org/series/79518/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8750_full -&gt; IGTPW_4764_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4764_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4764_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4764_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4764_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk1/igt@gem_exec_fence@parallel@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk8/igt@gem_exec_fence@parallel@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-short:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb5/igt@gem_mmap_gtt@basic-short.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb6/igt@gem_mmap_gtt@basic-short.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +3 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@gem_mmap_gtt@basic-short.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw1/igt@gem_mmap_gtt@basic-short.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/57">i915#57</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb8/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb8/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb1/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-iclb5/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb7/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb3/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb6/igt@gem_softpin@noreloc-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb6/igt@gem_softpin@noreloc-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl7/igt@kms_plane@plane-position-covered-pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/247">i915#247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl2/igt@kms_plane@plane-position-covered-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-apl6/igt@kms_plane@plane-position-covered-pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/247">i915#247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-apl8/igt@kms_plane@plane-position-covered-pipe-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-iclb5/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-busy-hang:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@kms_vblank@pipe-a-query-busy-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw1/igt@kms_vblank@pipe-a-query-busy-hang.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb6/igt@kms_vblank@pipe-a-query-busy-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb2/igt@kms_vblank@pipe-a-query-busy-hang.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl2/igt@testdisplay.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1692">i915#1692</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl1/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-spin-others@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb4/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2036">i915#2036</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2021">i915#2021</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@gen9_exec_parse@bb-start-far.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-overlay-size-128:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-hsw7/igt@kms_plane_cursor@pipe-d-overlay-size-128.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-hsw7/igt@kms_plane_cursor@pipe-d-overlay-size-128.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8750/shard-snb6/igt@kms_plane_cursor@pipe-d-overlay-size-128.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/shard-snb2/igt@kms_plane_cursor@pipe-d-overlay-size-128.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5735 -&gt; IGTPW_4764</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8750: 0714e0ca72205b9c38c4b2a09d8d5981637af2fb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4764: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4764/index.html<br />
  IGT_5735: 21f8204e54c122e4a0f8ca4b59e4b2db8d1ba687 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7473010144398224680==--

--===============1078661886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1078661886==--
