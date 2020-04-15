Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 09:03:18 -0000
Message-ID: <158694139843.21015.787830982490973602@emeril.freedesktop.org>
References: <20200413182525.1581-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200413182525.1581-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaWd0L2dl?=
 =?utf-8?q?m=5Fshrink=3A_Fix_reversed_logic_when_mmap_fails_=28rev2=29?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/gem_shrink: Fix reversed logic when mmap fails (rev2)
URL   : https://patchwork.freedesktop.org/series/75853/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8294_full -> IGTPW_4454_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/index.html

Known issues
------------

  Here are the changes found in IGTPW_4454_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][1] -> [FAIL][2] ([i915#1119] / [i915#93] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#1119] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#70] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#177] / [i915#52] / [i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#34])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk1/igt@kms_flip@plain-flip-ts-check.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-glk6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][21] ([i915#1277]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-tglb1/igt@gem_exec_balancer@hang.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-tglb2/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][23] ([fdo#109276]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][25] ([i915#180]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][29] ([i915#716]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][31] ([i915#1423]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl6/igt@i915_module_load@reload-with-fault-injection.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [SKIP][33] ([i915#1316] / [i915#579]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb3/igt@i915_pm_rpm@dpms-lpsp.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-iclb5/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [SKIP][35] ([i915#1316] / [i915#579]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-tglb1/igt@i915_pm_rpm@dpms-lpsp.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-tglb6/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-glk:          [SKIP][37] ([fdo#109271]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk7/igt@i915_pm_rpm@sysfs-read.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-glk1/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][39] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][41] ([i915#52] / [i915#54]) -> [PASS][42] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [FAIL][43] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][45] ([i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl7/igt@kms_mmap_write_crc@main.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl6/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [FAIL][47] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][49] ([i915#173]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb1/igt@kms_psr@no_drrs.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-iclb5/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][53] ([i915#31]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl2/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][55] ([fdo#112015]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][59] ([fdo#109278]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][61] ([i915#1542]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-iclb8/igt@perf@blocking-parameterized.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-iclb5/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rpm@gem-idle:
    - shard-snb:          [SKIP][63] ([fdo#109271]) -> [INCOMPLETE][64] ([i915#82])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-snb4/igt@i915_pm_rpm@gem-idle.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-snb6/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][65] ([i915#95]) -> [FAIL][66] ([i915#1525])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [INCOMPLETE][68] ([i915#155] / [i915#600])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][70] ([fdo#108145] / [i915#265]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][72] ([fdo#108145] / [i915#265]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][73], [FAIL][74]) ([i915#1423] / [i915#716]) -> [FAIL][75] ([i915#1423])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl4/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/shard-apl4/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4454
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8294: b1631d3c1d7ff53437d9e67f740e2c6057de4fea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4454: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4454/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
