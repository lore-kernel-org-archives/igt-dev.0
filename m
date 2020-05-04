Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 May 2020 21:33:52 -0000
Message-ID: <158862803206.5817.10052975495255112826@emeril.freedesktop.org>
References: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/igt=5Fcore=3A_Make_assert_?=
 =?utf-8?q?on_invalid_magic_blocks_nesting_more_verbose?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/igt_core: Make assert on invalid magic blocks nesting more verbose
URL   : https://patchwork.freedesktop.org/series/76900/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8417_full -> IGTPW_4529_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4529_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4529_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4529_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-hostile@bcs0:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl7/igt@gem_ctx_persistence@engines-hostile@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl6/igt@gem_ctx_persistence@engines-hostile@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4529_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile@bcs0:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#1622])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-iclb5/igt@gem_ctx_persistence@engines-hostile@bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-iclb6/igt@gem_ctx_persistence@engines-hostile@bcs0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-apl8/igt@gem_eio@in-flight-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-apl6/igt@gem_eio@in-flight-suspend.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#72])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl7/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#53] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][25] -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-tglb8/igt@gem_exec_suspend@basic-s0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-tglb2/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][27] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-iclb:         [DMESG-WARN][29] ([i915#128]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-iclb4/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-iclb7/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][31] ([i915#52] / [i915#54]) -> [PASS][32] +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][33] ([i915#180]) -> [PASS][34] +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][35] ([i915#61]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][41] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][43] ([i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][45] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][47] ([fdo#109441]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][49] ([i915#1542]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-iclb7/igt@perf@blocking-parameterized.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-iclb1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][51] ([i915#588]) -> [SKIP][52] ([i915#658])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-snb:          [INCOMPLETE][53] ([i915#82]) -> [SKIP][54] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-snb1/igt@i915_pm_rpm@pm-tiling.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-snb6/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][55] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][56] ([i915#357])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl7/igt@kms_content_protection@uevent.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][57] ([i915#357] / [i915#95]) -> [FAIL][58] ([i915#357])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-apl2/igt@kms_content_protection@uevent.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][59] ([i915#93] / [i915#95]) -> [DMESG-FAIL][60] ([i915#180] / [i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [INCOMPLETE][62] ([i915#155])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5628 -> IGTPW_4529
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8417: 7f9142d29c789842bd79245dd6623df9f15ba746 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4529: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/index.html
  IGT_5628: 652a3fd8966345fa5498904ce80a2027a6782783 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
