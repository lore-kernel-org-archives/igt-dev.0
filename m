Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 13:18:23 -0000
Message-ID: <158591990390.13349.7818657906098921008@emeril.freedesktop.org>
References: <20200402110729.18305-1-mika.kahola@intel.com>
In-Reply-To: <20200402110729.18305-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_Wait_for_an_extra_vblank?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_legacy: Wait for an extra vblank
URL   : https://patchwork.freedesktop.org/series/75413/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5559_full -> IGTPW_4397_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4397_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4397_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4397_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-snb6/igt@gem_tiled_swapping@non-threaded.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-snb1/igt@gem_tiled_swapping@non-threaded.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb2/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between IGT_5559_full and IGTPW_4397_full:

### New IGT tests (1) ###

  * igt@gem_cs_tlb@engines:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4397_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5] ([i915#402] / [i915#460])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb1/igt@gem_exec_suspend@basic-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [PASS][6] -> [SKIP][7] ([i915#1316] / [i915#579])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb6/igt@i915_pm_rpm@modeset-lpsp.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#1316])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#54] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#54] / [i915#93] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-hsw:          [PASS][14] -> [INCOMPLETE][15] ([i915#61])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#52] / [i915#54]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#52] / [i915#54] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#53] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#53] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#1031] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl1/igt@kms_prime@basic-crc.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl7/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#1031] / [i915#93] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl3/igt@kms_prime@basic-crc.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl7/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109441]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109276]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-apl:          [FAIL][36] ([i915#1528]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl8/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][38] ([i915#180]) -> [PASS][39] +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-tglb:         [FAIL][40] -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb1/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][42] ([i915#716]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][44] ([i915#1316]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-tglb:         [SKIP][46] ([i915#1316] / [i915#579]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-apl:          [FAIL][48] ([i915#54] / [i915#95]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][50] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:
    - shard-apl:          [FAIL][54] ([i915#54]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
    - shard-kbl:          [FAIL][56] ([i915#54]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][58] ([i915#93] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
    - shard-glk:          [FAIL][60] ([i915#52] / [i915#54]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][62] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][64] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][66] ([i915#1525]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_fbcon_fbt@fbc.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][68] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-hsw:          [INCOMPLETE][70] ([i915#61]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-hsw2/igt@kms_flip@2x-flip-vs-fences.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-hsw1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-glk:          [FAIL][72] ([i915#34]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk2/igt@kms_flip@plain-flip-ts-check.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-glk3/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [FAIL][74] ([i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [FAIL][76] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-apl:          [FAIL][78] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][80] ([i915#899]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][82] ([fdo#109441]) -> [PASS][83] +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-tglb:         [SKIP][84] ([i915#405]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb1/igt@perf@low-oa-exponent-permissions.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb8/igt@perf@low-oa-exponent-permissions.html
    - shard-iclb:         [SKIP][86] ([i915#405]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb4/igt@perf@low-oa-exponent-permissions.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb4/igt@perf@low-oa-exponent-permissions.html
    - shard-hsw:          [SKIP][88] ([fdo#109271]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-hsw8/igt@perf@low-oa-exponent-permissions.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-hsw4/igt@perf@low-oa-exponent-permissions.html
    - shard-glk:          [SKIP][90] ([fdo#109271]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-glk2/igt@perf@low-oa-exponent-permissions.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-glk2/igt@perf@low-oa-exponent-permissions.html

  * igt@prime_vgem@busy-bsd2:
    - shard-iclb:         [SKIP][92] ([fdo#109276]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb7/igt@prime_vgem@busy-bsd2.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb4/igt@prime_vgem@busy-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][94] ([i915#454]) -> [FAIL][95] ([i915#454] / [i915#93] / [i915#95])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         [FAIL][96] ([i915#454]) -> [SKIP][97] ([i915#468])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][98] ([i915#468]) -> [FAIL][99] ([i915#454])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-mmap-type:
    - shard-snb:          [INCOMPLETE][100] ([i915#82]) -> [SKIP][101] ([fdo#109271])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-snb6/igt@i915_pm_rpm@gem-mmap-type.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-snb5/igt@i915_pm_rpm@gem-mmap-type.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][102] ([fdo#109293] / [fdo#109506]) -> [SKIP][103] ([i915#1316])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][104] ([fdo#109506]) -> [SKIP][105] ([i915#1316] / [i915#579])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-tglb2/igt@i915_pm_rpm@pc8-residency.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][106] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][107] ([fdo#108145] / [i915#265])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          [FAIL][108] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][109] ([fdo#108145] / [i915#265])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][110] ([fdo#109642] / [fdo#111068]) -> [FAIL][111] ([i915#608])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-iclb4/igt@kms_psr2_su@page_flip.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][112], [FAIL][113]) ([i915#1423] / [i915#716] / [i915#92]) -> [FAIL][114] ([i915#1423] / [i915#92])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl6/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5559/shard-kbl4/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5559 -> IGTPW_4397

  CI-20190529: 20190529
  CI_DRM_8238: 840f70602a47208a2f1e444ba276f412f10e38df @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4397: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/index.html
  IGT_5559: d213e0c268e4bf2b619197b6125730b1affbf8d4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4397/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
