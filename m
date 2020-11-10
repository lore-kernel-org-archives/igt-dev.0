Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Nov 2020 15:24:30 -0000
Message-ID: <160502187068.11375.1672866629493298087@emeril.freedesktop.org>
References: <20201110070747.22703-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201110070747.22703-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IElH?=
 =?utf-8?q?T_Warnings_due_to_dynamic_subtest_inclusion_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0069477152=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0069477152==
Content-Type: multipart/alternative;
 boundary="===============6129233354852190100=="

--===============6129233354852190100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix IGT Warnings due to dynamic subtest inclusion (rev2)
URL   : https://patchwork.freedesktop.org/series/83669/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9299_full -> IGTPW_5151_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5151_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5151_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5151_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_blits@basic:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb7/igt@gem_tiled_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb7/igt@gem_tiled_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5151_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed@vecs0:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#1635] / [i915#1982]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl2/igt@gem_ctx_persistence@engines-mixed@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl3/igt@gem_ctx_persistence@engines-mixed@vecs0.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk7/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#1888] / [i915#2548])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] ([i915#1037])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb7/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#1119])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk9/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14] ([i915#2055] / [i915#2637])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([i915#155])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([i915#1635] / [i915#2635])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#2635])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-iclb:         [PASS][21] -> [INCOMPLETE][22] ([i915#1185])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +9 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk2/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#2122])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-snb:          [PASS][31] -> [FAIL][32] ([i915#2546])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-a-wait-busy:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb3/igt@kms_vblank@pipe-a-wait-busy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb6/igt@kms_vblank@pipe-a-wait-busy.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_eio@kms:
    - shard-hsw:          [DMESG-WARN][39] ([i915#1982]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw4/igt@gem_eio@kms.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw7/igt@gem_eio@kms.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][41] ([i915#2389]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][43] ([i915#2190]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_linear_blits@normal:
    - shard-hsw:          [FAIL][45] ([i915#1263] / [i915#1888]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw2/igt@gem_linear_blits@normal.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw5/igt@gem_linear_blits@normal.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-snb:          [INCOMPLETE][47] ([i915#1037]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb2/igt@gem_partial_pwrite_pread@reads-display.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb4/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [SKIP][49] ([fdo#109271]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk4/igt@i915_pm_rpm@system-suspend-modeset.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk6/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [SKIP][51] ([i915#579]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb8/igt@i915_pm_rpm@system-suspend-modeset.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb1/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-apl:          [SKIP][53] ([fdo#109271] / [i915#1635]) -> [PASS][54] +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl2/igt@i915_pm_rpm@system-suspend-modeset.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-iclb:         [FAIL][55] ([i915#2521]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-snb:          [FAIL][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [INCOMPLETE][59] ([i915#1635] / [i915#2635]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [INCOMPLETE][61] ([i915#1185]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [INCOMPLETE][63] ([i915#2635]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [INCOMPLETE][65] ([i915#2637]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [INCOMPLETE][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][71] ([i915#1635] / [i915#1982]) -> [PASS][72] +9 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          [FAIL][73] ([i915#2546]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +5 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-kbl:          [DMESG-WARN][79] ([i915#165] / [i915#78]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl4/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-glk:          [INCOMPLETE][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-hsw:          [INCOMPLETE][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][87] ([fdo#109271]) -> [PASS][88] +6 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-kbl:          [SKIP][89] ([fdo#109271]) -> [PASS][90] +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][91] ([fdo#109278]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][93] ([i915#1982]) -> [PASS][94] +6 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl4/igt@kms_vblank@pipe-c-wait-idle.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl1/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [SKIP][95] ([fdo#109271] / [i915#1354]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk8/igt@perf@disabled-read-error.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk9/igt@perf@disabled-read-error.html
    - shard-apl:          [SKIP][97] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl6/igt@perf@disabled-read-error.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl6/igt@perf@disabled-read-error.html
    - shard-kbl:          [SKIP][99] ([fdo#109271] / [i915#1354]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl6/igt@perf@disabled-read-error.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl2/igt@perf@disabled-read-error.html
    - shard-tglb:         [SKIP][101] ([i915#1354]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb2/igt@perf@disabled-read-error.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb8/igt@perf@disabled-read-error.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [SKIP][103] ([i915#1354]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb7/igt@perf@invalid-remove-userspace-config.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb6/igt@perf@invalid-remove-userspace-config.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][105] ([i915#658]) -> [SKIP][106] ([i915#588])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-tglb:         [SKIP][107] ([i915#579]) -> [DMESG-WARN][108] ([i915#2411]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb2/igt@i915_pm_rpm@gem-pread.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb1/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][109] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][110] ([i915#2411])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes:
    - shard-tglb:         [DMESG-WARN][111] ([i915#2411]) -> [INCOMPLETE][112] ([i915#1436] / [i915#1982] / [i915#456])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][113] ([i915#2648]) -> [DMESG-WARN][114] ([i915#2411]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [DMESG-WARN][115] ([i915#1436]) -> [DMESG-WARN][116] ([i915#2411])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-tglb:         ([FAIL][117], [FAIL][118]) ([i915#1602]) -> [FAIL][119] ([i915#1814])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb3/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb8/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1263]: https://gitlab.freedesktop.org/drm/intel/issues/1263
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2548]: https://gitlab.freedesktop.org/drm/intel/issues/2548
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-snb-2600 pig-glk-j5005 pig-skl-6260u pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5839 -> IGTPW_5151
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9299: f9348e617d0391f02138013347a5b93e53955e81 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5151: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/index.html
  IGT_5839: 2dbd64a6301e36eb432bc50ad7021fabaeebd1f4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/index.html

--===============6129233354852190100==
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
<tr><td><b>Series:</b></td><td>Fix IGT Warnings due to dynamic subtest inclusion (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83669/">https://patchwork.freedesktop.org/series/83669/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9299_full -&gt; IGTPW_5151_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5151_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5151_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5151_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_tiled_blits@basic:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb7/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb7/igt@gem_tiled_blits@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5151_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl2/igt@gem_ctx_persistence@engines-mixed@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl3/igt@gem_ctx_persistence@engines-mixed@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk7/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2548">i915#2548</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb7/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb7/igt@gem_partial_pwrite_pread@writes-after-reads.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk9/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk2/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb7/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-wait-busy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb3/igt@kms_vblank@pipe-a-wait-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb6/igt@kms_vblank@pipe-a-wait-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw4/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw7/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb7/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@normal:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw2/igt@gem_linear_blits@normal.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1263">i915#1263</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw5/igt@gem_linear_blits@normal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb2/igt@gem_partial_pwrite_pread@reads-display.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb4/igt@gem_partial_pwrite_pread@reads-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk4/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb8/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb1/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl2/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb2/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb3/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl4/igt@kms_plane_lowres@pipe-b-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl4/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl1/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-glk8/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-glk9/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-apl6/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-apl6/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-kbl6/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-kbl2/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb2/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb8/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-remove-userspace-config:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb7/igt@perf@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb6/igt@perf@invalid-remove-userspace-config.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb2/igt@i915_pm_rpm@gem-pread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb1/igt@i915_pm_rpm@gem-pread.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2648">i915#2648</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9299/shard-tglb8/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/shard-tglb1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-snb-2600 pig-glk-j5005 pig-skl-6260u pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5839 -&gt; IGTPW_5151</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9299: f9348e617d0391f02138013347a5b93e53955e81 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5151: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5151/index.html<br />
  IGT_5839: 2dbd64a6301e36eb432bc50ad7021fabaeebd1f4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6129233354852190100==--

--===============0069477152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0069477152==--
