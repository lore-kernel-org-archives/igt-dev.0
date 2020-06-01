Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 01 Jun 2020 14:19:52 -0000
Message-ID: <159102119277.14891.11856503109484054813@emeril.freedesktop.org>
References: <20200601093121.27508-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200601093121.27508-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Feio=3A_Replace_legacy_engines_with_new_API?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_eio: Replace legacy engines with new API
URL   : https://patchwork.freedesktop.org/series/77864/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8561_full -> IGTPW_4630_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4630_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4630_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4630_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@kms:
    - shard-hsw:          [PASS][1] -> [CRASH][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-hsw8/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-hsw4/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][3] -> [CRASH][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-glk6/igt@gem_eio@unwedge-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-glk8/igt@gem_eio@unwedge-stress.html
    - shard-tglb:         [PASS][5] -> [CRASH][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-tglb8/igt@gem_eio@unwedge-stress.html
    - shard-apl:          [PASS][7] -> [CRASH][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl7/igt@gem_eio@unwedge-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl8/igt@gem_eio@unwedge-stress.html
    - shard-kbl:          [PASS][9] -> [CRASH][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl4/igt@gem_eio@unwedge-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl2/igt@gem_eio@unwedge-stress.html
    - shard-iclb:         [PASS][11] -> [CRASH][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-iclb1/igt@gem_eio@unwedge-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-iclb3/igt@gem_eio@unwedge-stress.html
    - shard-snb:          [PASS][13] -> [CRASH][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-snb6/igt@gem_eio@unwedge-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-snb5/igt@gem_eio@unwedge-stress.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_endless@dispatch@rcs0}:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-tglb3/igt@gem_exec_endless@dispatch@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-tglb3/igt@gem_exec_endless@dispatch@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4630_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@processes:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#1528])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-tglb5/igt@gem_ctx_persistence@processes.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-tglb5/igt@gem_ctx_persistence@processes.html

  * igt@gem_eio@kms:
    - shard-glk:          [PASS][19] -> [TIMEOUT][20] ([i915#1383] / [i915#1958])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-glk8/igt@gem_eio@kms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-glk7/igt@gem_eio@kms.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#1899])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-iclb1/igt@i915_pm_dc@dc5-psr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#1899])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-tglb2/igt@i915_pm_dc@dc5-psr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-tglb3/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#454])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#1119] / [i915#118] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#1926])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-glk6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@pipe-c-forked-bo:
    - shard-apl:          [PASS][35] -> [TIMEOUT][36] ([i915#1635]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl4/igt@kms_cursor_legacy@pipe-c-forked-bo.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl6/igt@kms_cursor_legacy@pipe-c-forked-bo.html
    - shard-glk:          [PASS][37] -> [TIMEOUT][38] ([i915#1958]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-glk1/igt@kms_cursor_legacy@pipe-c-forked-bo.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-glk7/igt@kms_cursor_legacy@pipe-c-forked-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][45] -> [FAIL][46] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][47] -> [INCOMPLETE][48] ([i915#155])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#83])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][53] -> [FAIL][54] ([i915#31])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-hsw6/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-hsw5/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [FAIL][57] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-hsw:          [DMESG-WARN][59] ([i915#128]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-hsw4/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-hsw4/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [DMESG-FAIL][61] ([i915#1925] / [i915#1926]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][63] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][65] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-kbl:          [FAIL][67] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][69] ([i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl6/igt@kms_mmap_write_crc@main.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl2/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][71] ([i915#173]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-iclb1/igt@kms_psr@no_drrs.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-iclb4/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][75] ([i915#1542]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-hsw6/igt@perf@blocking-parameterized.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-hsw8/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-apl:          [SKIP][77] ([fdo#109271]) -> [TIMEOUT][78] ([i915#1635]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl6/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl6/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing:
    - shard-glk:          [SKIP][79] ([fdo#109271]) -> [TIMEOUT][80] ([i915#1958]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-glk1/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-glk7/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][81] ([i915#1319] / [i915#1635]) -> [FAIL][82] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][83] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][84] ([i915#1319])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl6/igt@kms_content_protection@legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][85] ([fdo#110321]) -> [TIMEOUT][86] ([i915#1319] / [i915#1635]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-apl7/igt@kms_content_protection@lic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [INCOMPLETE][88] ([i915#155] / [i915#794])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8561/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1383]: https://gitlab.freedesktop.org/drm/intel/issues/1383
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5688 -> IGTPW_4630
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8561: 989e079eb7172d7423686cab0dd5d4e47a48f3e1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4630: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/index.html
  IGT_5688: 33c8411480b4945e44188f82cd6c3a0d53b40485 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4630/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
