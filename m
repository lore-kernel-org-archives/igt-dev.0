Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 10:20:06 -0000
Message-ID: <158694600663.21015.13650887416714446791@emeril.freedesktop.org>
References: <20200414141746.11706-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200414141746.11706-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_Add_a_test_for_device_hot_unplug_=28rev3=29?=
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

Series: tests: Add a test for device hot unplug (rev3)
URL   : https://patchwork.freedesktop.org/series/75692/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8295_full -> IGTPW_4459_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4459_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4459_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4459_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotunplug-lateclose} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-tglb5/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl6/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb8/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl7/igt@core_hotunplug@hotunplug-lateclose.html

  * igt@gem_pipe_control_store_loop@fresh-buffer:
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk4/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-glk9/igt@gem_pipe_control_store_loop@fresh-buffer.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-tglb5/igt@i915_module_load@reload-no-display.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-tglb6/igt@i915_module_load@reload-no-display.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-tglb5/igt@runner@aborted.html
    - shard-snb:          NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-snb4/igt@runner@aborted.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][11], [FAIL][12]) ([i915#1423] / [i915#716]) -> ([FAIL][13], [FAIL][14]) ([i915#1423])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl4/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl6/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8295_full and IGTPW_4459_full:

### New IGT tests (4) ###

  * igt@core_hotunplug@hotunbind-lateclose:
    - Statuses : 6 pass(s)
    - Exec time: [0.30, 1.80] s

  * igt@core_hotunplug@hotunplug-lateclose:
    - Statuses : 6 incomplete(s)
    - Exec time: [0.0] s

  * igt@core_hotunplug@unbind-rebind:
    - Statuses : 6 pass(s)
    - Exec time: [0.38, 1.95] s

  * igt@core_hotunplug@unplug-rescan:
    - Statuses : 1 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.90] s

  

Known issues
------------

  Here are the changes found in IGTPW_4459_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl2/igt@gem_eio@in-flight-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109349])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#52] / [i915#54] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][31] -> [TIMEOUT][32] ([i915#1284])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-kbl:          [PASS][33] -> [TIMEOUT][34] ([i915#1284])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-iclb:         [PASS][35] -> [INCOMPLETE][36] ([i915#1185] / [i915#221])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#53] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#53] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#1559] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#1559] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109642] / [fdo#111068])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#31])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk8/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-glk1/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl3/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][53] ([i915#716]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][55] ([i915#454]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [SKIP][57] ([i915#1316] / [i915#579]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb8/igt@i915_pm_rpm@dpms-lpsp.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb6/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [SKIP][59] ([i915#1316] / [i915#579]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-tglb1/igt@i915_pm_rpm@dpms-lpsp.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-tglb6/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-glk:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk8/igt@i915_pm_rpm@sysfs-read.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-glk9/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][63] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][65] ([i915#52] / [i915#54]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb3/igt@kms_psr@psr2_no_drrs.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][75] ([fdo#112015]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][77] ([fdo#109278]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][79] ([i915#1515]) -> [FAIL][80] ([i915#1515])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][81] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][82] ([fdo#108145] / [i915#265]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][83] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][84] ([fdo#108145] / [i915#265]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1284]: https://gitlab.freedesktop.org/drm/intel/issues/1284
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#221]: https://gitlab.freedesktop.org/drm/intel/issues/221
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4459
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8295: 4cb6dbe0a641129fd07ad1fbfcd6e7b4f03ec5c1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4459: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4459/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
