Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 08:45:22 -0000
Message-ID: <158694032272.21016.5570382448657282655@emeril.freedesktop.org>
References: <20200413102144.19302-1-karthik.b.s@intel.com>
In-Reply-To: <20200413102144.19302-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fmultipipe=5Fmodeset=3A_Add_test_to_validate_max_pipe_conf?=
 =?utf-8?q?iguration?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_multipipe_modeset: Add test to validate max pipe configuration
URL   : https://patchwork.freedesktop.org/series/75876/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8294_full -> IGTPW_4452_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4452_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_multipipe_modeset@multipipe-modeset} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-tglb5/igt@kms_multipipe_modeset@multipipe-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb2/igt@kms_multipipe_modeset@multipipe-modeset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8294_full and IGTPW_4452_full:

### New IGT tests (1) ###

  * igt@kms_multipipe_modeset@multipipe-modeset:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4452_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][3] -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk6/igt@i915_pm_rpm@system-suspend-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-glk1/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#1316] / [i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb8/igt@i915_pm_rpm@system-suspend-modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb6/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-hsw6/igt@i915_pm_rpm@system-suspend-modeset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-hsw6/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#1316] / [i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-tglb5/igt@i915_pm_rpm@system-suspend-modeset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-tglb6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#1119] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([i915#42])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-snb6/igt@kms_fbcon_fbt@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-snb6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#79]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#34])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-glk2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][31] ([i915#1277]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-tglb1/igt@gem_exec_balancer@hang.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][33] ([fdo#109276]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][39] ([i915#716]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [SKIP][41] ([i915#1316] / [i915#579]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb3/igt@i915_pm_rpm@dpms-lpsp.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb7/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [SKIP][43] ([i915#1316] / [i915#579]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-tglb1/igt@i915_pm_rpm@dpms-lpsp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-tglb2/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-glk:          [SKIP][45] ([fdo#109271]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk7/igt@i915_pm_rpm@sysfs-read.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-glk2/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][47] ([i915#52] / [i915#54]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [FAIL][49] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][51] ([i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl7/igt@kms_mmap_write_crc@main.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-kbl4/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [FAIL][53] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][55] ([i915#173]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb1/igt@kms_psr@no_drrs.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb2/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl2/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl3/igt@kms_setmode@basic.html
    - shard-hsw:          [FAIL][61] ([i915#31]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-hsw6/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-hsw1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][63] ([fdo#112015]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-hsw:          [SKIP][65] ([fdo#109271]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][67] ([fdo#109278]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][69] ([i915#1542]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb8/igt@perf@blocking-parameterized.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-iclb4/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][71] ([i915#1085]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][73] ([i915#1542]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-hsw6/igt@perf@polling-parameterized.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-hsw1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][75] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][76] ([fdo#108145] / [i915#265]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][77] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][78] ([fdo#108145] / [i915#265]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][79], [FAIL][80]) ([i915#1423] / [i915#716]) -> [FAIL][81] ([i915#1423])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl4/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl4/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4452
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8294: b1631d3c1d7ff53437d9e67f740e2c6057de4fea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4452: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4452/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
