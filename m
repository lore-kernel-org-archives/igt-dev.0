Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Apr 2020 01:08:58 -0000
Message-ID: <158622173812.26328.3141383827210956233@emeril.freedesktop.org>
References: <20200406163237.28293-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200406163237.28293-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Refresh_still_MMAP=5FGTT_dependent_sub?=
 =?utf-8?q?tests?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Refresh still MMAP_GTT dependent subtests
URL   : https://patchwork.freedesktop.org/series/75557/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8261_full -> IGTPW_4417_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4417_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@process-exit-mmap-busy@gtt} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-iclb7/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@uc} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-tglb3/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8261_full and IGTPW_4417_full:

### New IGT tests (14) ###

  * igt@gem_userptr_blits@process-exit-mmap:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@process-exit-mmap-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wb:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@uc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@gtt:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.01] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@uc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4417_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-hsw8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#93] / [i915#95]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@kms_draw_crc@fill-fb.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#64])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1525])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl3/igt@kms_fbcon_fbt@fbc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#1297] / [i915#600])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-apl:          [PASS][29] -> [INCOMPLETE][30] ([i915#1297])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][33] -> [FAIL][34] ([fdo#108145] / [i915#265] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#899])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#165] / [i915#78])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl7/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][41] -> [SKIP][42] ([fdo#109271]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([fdo#112015])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109278])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][47] ([i915#180] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][49] ([i915#1316] / [i915#579]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb1/igt@i915_pm_rpm@cursor.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-tglb5/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][51] ([fdo#109271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@i915_pm_rpm@cursor.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-hsw7/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk4/igt@i915_pm_rpm@cursor.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-glk6/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][55] ([i915#1316] / [i915#579]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-iclb3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_busy@basic@flip:
    - shard-hsw:          [INCOMPLETE][59] ([i915#61]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw7/igt@kms_busy@basic@flip.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-hsw8/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [FAIL][61] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][63] ([i915#52] / [i915#54]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][65] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][67] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][71] ([i915#79]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][83] ([i915#1542]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-hsw1/igt@perf@polling-parameterized.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-hsw7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][86] ([i915#180])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][87] ([i915#454]) -> [SKIP][88] ([i915#468])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][89] ([i915#1515]) -> [WARN][90] ([i915#1515])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][91] ([fdo#111644] / [i915#1397]) -> [SKIP][92] ([i915#1316] / [i915#579])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-snb:          [INCOMPLETE][93] ([i915#82]) -> [SKIP][94] ([fdo#109271])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-snb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-snb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][95] ([fdo#110892]) -> [SKIP][96] ([i915#1316] / [i915#579])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][97] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][98] ([i915#357])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-kbl4/igt@kms_content_protection@uevent.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][99] ([i915#357] / [i915#95]) -> [FAIL][100] ([i915#357])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl3/igt@kms_content_protection@uevent.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][101] ([fdo#108145] / [i915#265]) -> [FAIL][102] ([fdo#108145] / [i915#265] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8261/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5572 -> IGTPW_4417
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8261: 80b64adc6f5ffeb1c69996737dbdc5ad275d8e6c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4417: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/index.html
  IGT_5572: 6c124b5c8501d900966c033ac86c3dc55c16a2da @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4417/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
