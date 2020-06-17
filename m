Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Jun 2020 10:44:04 -0000
Message-ID: <159239064436.29979.9180847517146982186@emeril.freedesktop.org>
References: <20200616123758.3331-1-ramadevi.gandi@intel.com>
In-Reply-To: <20200616123758.3331-1-ramadevi.gandi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWw6?=
 =?utf-8?q?_sync_i915=5Fpciids=2Eh_with_kernel?=
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
To: ramadevi.gandi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: intel: sync i915_pciids.h with kernel
URL   : https://patchwork.freedesktop.org/series/78460/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8638_full -> IGTPW_4678_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4678_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4678_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4678_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@all-pipes-torture-bo:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-hsw5/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-hsw7/igt@kms_cursor_legacy@all-pipes-torture-bo.html

  
Known issues
------------

  Here are the changes found in IGTPW_4678_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#1930])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-glk7/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-glk5/igt@gem_exec_whisper@basic-fds-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#1899])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#1899])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-tglb2/igt@i915_pm_dc@dc5-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-tglb6/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#95]) +29 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-hsw:          [PASS][15] -> [TIMEOUT][16] ([i915#1958]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-hsw8/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-hsw2/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#93] / [i915#95]) +43 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl2/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl1/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#54] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#402])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-tglb5/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-tglb2/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([fdo#108145] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([fdo#108145] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@prime_self_import@basic-with_one_bo:
    - shard-snb:          [PASS][41] -> [TIMEOUT][42] ([i915#1958]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-snb1/igt@prime_self_import@basic-with_one_bo.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-snb6/igt@prime_self_import@basic-with_one_bo.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-tglb:         [FAIL][45] ([i915#1622]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-tglb1/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-tglb7/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_exec_schedule@implicit-read-write@rcs0:
    - shard-snb:          [INCOMPLETE][47] ([i915#82]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-snb4/igt@gem_exec_schedule@implicit-read-write@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-snb6/igt@gem_exec_schedule@implicit-read-write@rcs0.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-glk:          [DMESG-WARN][49] ([i915#118] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-glk6/igt@gem_exec_schedule@smoketest-all.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-glk9/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_mmap@basic:
    - shard-iclb:         [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-iclb3/igt@gem_mmap@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-iclb3/igt@gem_mmap@basic.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-apl:          [DMESG-WARN][53] ([i915#95]) -> [PASS][54] +37 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl1/igt@gem_mmap_wc@write-cpu-read-wc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl7/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_tiled_blits@basic:
    - shard-snb:          [TIMEOUT][55] ([i915#1958]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-snb2/igt@gem_tiled_blits@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-snb1/igt@gem_tiled_blits@basic.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-hsw5/igt@i915_pm_rpm@system-suspend-modeset.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-hsw4/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_query@query-topology-kernel-writes:
    - shard-apl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl4/igt@i915_query@query-topology-kernel-writes.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl3/igt@i915_query@query-topology-kernel-writes.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [INCOMPLETE][61] ([i915#155]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [DMESG-FAIL][63] ([i915#95]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][65] ([i915#54] / [i915#95]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-glk:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-tglb:         [DMESG-WARN][73] ([i915#402]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][75] ([i915#1525]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [DMESG-WARN][77] ([i915#93] / [i915#95]) -> [PASS][78] +54 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][81] ([i915#95]) -> [PASS][82] +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-iclb1/igt@kms_psr@psr2_basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-hsw:          [TIMEOUT][85] ([i915#1958]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-hsw5/igt@kms_vblank@pipe-c-query-forked-busy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-hsw7/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@perf@invalid-open-flags:
    - shard-tglb:         [SKIP][87] ([i915#405]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-tglb5/igt@perf@invalid-open-flags.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-tglb6/igt@perf@invalid-open-flags.html
    - shard-apl:          [SKIP][89] ([fdo#109271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-apl4/igt@perf@invalid-open-flags.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-apl7/igt@perf@invalid-open-flags.html
    - shard-iclb:         [SKIP][91] ([i915#405]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-iclb6/igt@perf@invalid-open-flags.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-iclb8/igt@perf@invalid-open-flags.html
    - shard-glk:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-glk7/igt@perf@invalid-open-flags.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-glk5/igt@perf@invalid-open-flags.html
    - shard-kbl:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl2/igt@perf@invalid-open-flags.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl6/igt@perf@invalid-open-flags.html

  
#### Warnings ####

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-hsw:          [SKIP][97] ([fdo#109271]) -> [TIMEOUT][98] ([i915#1958])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-hsw2/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-hsw2/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-snb:          [TIMEOUT][99] ([i915#1958]) -> [SKIP][100] ([fdo#109271]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-snb2/igt@gen7_exec_parse@chained-batch.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-snb1/igt@gen7_exec_parse@chained-batch.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][101] ([i915#658]) -> [SKIP][102] ([i915#588])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-hsw:          [TIMEOUT][103] ([i915#1958]) -> [SKIP][104] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-hsw5/igt@i915_pm_dc@dc6-psr.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-hsw6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         [SKIP][105] ([fdo#109289] / [fdo#111719]) -> [SKIP][106] ([fdo#111719])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-tglb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-snb:          [TIMEOUT][107] ([i915#1958]) -> [SKIP][108] ([fdo#109271] / [fdo#111827])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-max.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-max.html
    - shard-hsw:          [TIMEOUT][109] ([i915#1958]) -> [SKIP][110] ([fdo#109271] / [fdo#111827])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-hsw5/igt@kms_color_chamelium@pipe-b-ctm-max.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-hsw2/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][111] ([i915#1319]) -> [TIMEOUT][112] ([i915#1319] / [i915#1958])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl1/igt@kms_content_protection@lic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][113] ([fdo#109349]) -> [DMESG-WARN][114] ([i915#1226])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-snb6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-snb6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][117] ([i915#93] / [i915#95]) -> [DMESG-WARN][118] ([i915#165] / [i915#93] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][119] ([i915#180]) -> [DMESG-WARN][120] ([i915#180] / [i915#93] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#1982])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8638/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5711 -> IGTPW_4678
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8638: 83818e4910cac8b84d8f915c773ab3f55fa30365 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4678: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/index.html
  IGT_5711: 90611a0c90afa4a46496c78a4faf9638a1538ac3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4678/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
