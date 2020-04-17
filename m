Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 09:52:52 -0000
Message-ID: <158711717278.10466.5455461403818731432@emeril.freedesktop.org>
References: <20200416093918.3061840-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200416093918.3061840-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_More_task_debug!?=
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

Series: runner: More task debug!
URL   : https://patchwork.freedesktop.org/series/76021/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8309_full -> IGTPW_4475_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/index.html

Known issues
------------

  Here are the changes found in IGTPW_4475_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#1318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb5/igt@gem_exec_whisper@basic-contexts-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-tglb3/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl3/igt@i915_suspend@sysfs-reader.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][9] -> [DMESG-FAIL][10] ([i915#180] / [i915#54])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#1566] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl7/igt@kms_draw_crc@fill-fb.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl8/igt@kms_draw_crc@fill-fb.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#49] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#668]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([fdo#108145] / [i915#265] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-iclb1/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([i915#155])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-tglb:         [INCOMPLETE][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb3/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-tglb6/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [SKIP][37] ([fdo#109271]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-glk7/igt@i915_pm_rpm@basic-pci-d3-state.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-glk1/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-iclb:         [SKIP][39] ([i915#1316] / [i915#579]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-iclb5/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-hsw:          [SKIP][41] ([fdo#109271]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-hsw4/igt@i915_pm_rpm@basic-pci-d3-state.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-hsw6/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-tglb:         [SKIP][43] ([i915#1316] / [i915#579]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb6/igt@i915_pm_rpm@basic-pci-d3-state.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-tglb8/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][45] ([i915#1531] / [i915#1658]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb1/igt@i915_selftest@live@requests.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-tglb8/igt@i915_selftest@live@requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][51] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-iclb:         [INCOMPLETE][53] ([i915#1185]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-kbl:          [DMESG-WARN][55] ([i915#128]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl7/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][57] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][59] ([i915#52] / [i915#54]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [DMESG-WARN][63] ([i915#180] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_prime@basic-crc:
    - shard-kbl:          [FAIL][71] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl1/igt@kms_prime@basic-crc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl7/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][75] ([i915#31] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-apl1/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-apl6/igt@kms_setmode@basic.html
    - shard-hsw:          [FAIL][77] ([i915#31]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-hsw7/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-hsw6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][81] ([i915#456] / [i915#460]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][83] ([i915#468]) -> [FAIL][84] ([i915#454])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [DMESG-FAIL][86] ([i915#180] / [i915#54] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][87] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][88] ([i915#31])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8309/shard-kbl3/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/shard-kbl2/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1658]: https://gitlab.freedesktop.org/drm/intel/issues/1658
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5593 -> IGTPW_4475
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8309: 7532b3183c849056c824828bafb4ab0b525e586e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4475: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/index.html
  IGT_5593: 1c658f5e46598ae93345177d4981ef54704daec6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4475/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
