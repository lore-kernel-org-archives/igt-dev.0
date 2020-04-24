Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Apr 2020 13:00:20 -0000
Message-ID: <158773322083.10801.18394696687359060015@emeril.freedesktop.org>
References: <20200424101941.4109878-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200424101941.4109878-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcGVyZjog?=
 =?utf-8?q?Verify_rc6_works_first?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: perf: Verify rc6 works first
URL   : https://patchwork.freedesktop.org/series/76424/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8358_full -> IGTPW_4506_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4506_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4506_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4506_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-iclb7/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_selftest@perf@request}:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-iclb7/igt@i915_selftest@perf@request.html

  
Known issues
------------

  Here are the changes found in IGTPW_4506_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4] ([i915#82])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-snb2/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-snb6/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109349])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#699] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#93] / [i915#95]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#53] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1031] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl3/igt@kms_prime@basic-crc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl1/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#1031] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl2/igt@kms_prime@basic-crc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl3/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl3/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl8/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_exec_parallel@contexts@bcs0}:
    - shard-iclb:         [INCOMPLETE][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-iclb7/igt@gem_exec_parallel@contexts@bcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-iclb5/igt@gem_exec_parallel@contexts@bcs0.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-hsw:          [INCOMPLETE][37] ([i915#61]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-hsw2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-hsw6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][39] ([i915#454]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][41] ([i915#155]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][45] ([i915#1119] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][47] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-kbl:          [FAIL][49] ([i915#168] / [i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl3/igt@kms_color@pipe-a-ctm-max.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl7/igt@kms_color@pipe-a-ctm-max.html
    - shard-apl:          [FAIL][51] ([i915#168] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl3/igt@kms_color@pipe-a-ctm-max.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl7/igt@kms_color@pipe-a-ctm-max.html
    - shard-glk:          [FAIL][53] ([i915#168]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-glk5/igt@kms_color@pipe-a-ctm-max.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-glk1/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][55] ([i915#54] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][57] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-kbl:          [DMESG-WARN][59] ([i915#128]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl2/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl6/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][61] ([i915#52] / [i915#54]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * {igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][63] ([i915#34]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2}:
    - shard-glk:          [FAIL][65] ([i915#79]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend@b-vga1}:
    - shard-snb:          [INCOMPLETE][67] ([i915#82]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-snb1/igt@kms_flip@flip-vs-suspend@b-vga1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-snb4/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [FAIL][69] ([i915#53] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][73] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][75] ([i915#1559] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][77] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][81] ([i915#31]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-hsw4/igt@kms_setmode@basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-hsw1/igt@kms_setmode@basic.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][83] ([i915#1542]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-hsw1/igt@perf@polling-parameterized.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-hsw4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][85] ([i915#454]) -> [SKIP][86] ([i915#468])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][87] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][88] ([i915#357])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl1/igt@kms_content_protection@uevent.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][89] ([i915#357] / [i915#95]) -> [FAIL][90] ([i915#357])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl7/igt@kms_content_protection@uevent.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][91] ([i915#53] / [i915#93] / [i915#95]) -> [DMESG-WARN][92] ([i915#180])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][93] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][94] ([fdo#108145] / [i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8358/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5609 -> IGTPW_4506
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8358: 03d069b768bdd8a6382b296152a676422a4859a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4506: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/index.html
  IGT_5609: c100fe19f7b144538549415e8503093053883ec6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4506/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
