Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 13:34:36 -0000
Message-ID: <159110487672.21430.11544344581427705899@emeril.freedesktop.org>
References: <20200602085454.22812-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200602085454.22812-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fspin=5Fbatch=3A_Remove_unncessary_non-preemptible_workload?=
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_spin_batch: Remove unncessary non-preemptible workload
URL   : https://patchwork.freedesktop.org/series/77903/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8568_full -> IGTPW_4637_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/index.html

Known issues
------------

  Here are the changes found in IGTPW_4637_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2] ([i915#1958])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk6/igt@gem_eio@unwedge-stress.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-glk7/igt@gem_eio@unwedge-stress.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#1119] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1119] / [i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([fdo#103375]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#53] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#53] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][23] ([i915#180]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-glk:          [TIMEOUT][25] ([i915#1958]) -> [PASS][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk6/igt@gem_exec_reloc@basic-cpu-read.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-glk6/igt@gem_exec_reloc@basic-cpu-read.html

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][27] ([i915#82]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-snb6/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-snb6/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl6/igt@gem_workarounds@suspend-resume.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl7/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [INCOMPLETE][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl8/igt@gem_workarounds@suspend-resume-fd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][33] ([i915#1436] / [i915#716]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][35] ([i915#1899]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-hsw:          [INCOMPLETE][37] ([i915#151] / [i915#61]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw8/igt@i915_pm_rpm@system-suspend-devices.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-hsw2/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [FAIL][39] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-apl:          [FAIL][41] ([i915#70] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl2/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
    - shard-kbl:          [FAIL][43] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [DMESG-WARN][45] ([i915#1926]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-glk5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][47] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][49] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][51] ([i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl4/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][53] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][55] ([i915#1525] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_fbcon_fbt@fbc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl2/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][59] ([i915#83]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-tglb6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][63] ([i915#31]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk6/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-glk6/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][65] ([i915#468]) -> [FAIL][66] ([i915#454])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color@pipe-d-legacy-gamma:
    - shard-glk:          [SKIP][67] ([fdo#109271]) -> [FAIL][68] ([i915#1927])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk7/igt@kms_color@pipe-d-legacy-gamma.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-glk5/igt@kms_color@pipe-d-legacy-gamma.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][69] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][70] ([i915#1319] / [i915#1635])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl6/igt@kms_content_protection@atomic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][71] ([i915#1319] / [i915#1635]) -> [FAIL][72] ([fdo#110321] / [fdo#110336])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][73] ([fdo#110321]) -> [TIMEOUT][74] ([i915#1319] / [i915#1635])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl4/igt@kms_content_protection@srm.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [FAIL][76] ([i915#1927])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-hsw8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-hsw2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-glk:          [SKIP][77] ([fdo#109271]) -> [TIMEOUT][78] ([i915#1958]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-glk5/igt@kms_psr@psr2_cursor_blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-glk7/igt@kms_psr@psr2_cursor_blt.html
    - shard-apl:          [SKIP][79] ([fdo#109271]) -> [TIMEOUT][80] ([i915#1635]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-apl7/igt@kms_psr@psr2_cursor_blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-apl2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][81] ([i915#180]) -> [FAIL][82] ([fdo#103375])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8568/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5690 -> IGTPW_4637
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8568: 124bafc80c3ce62fc61b8eabb2657c87424b999b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4637: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4637/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
