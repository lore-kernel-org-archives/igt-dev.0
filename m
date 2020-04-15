Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 12:30:22 -0000
Message-ID: <158695382275.21014.9149090184405917366@emeril.freedesktop.org>
References: <20191219235047.15224-1-robert.m.fosha@intel.com>
In-Reply-To: <20191219235047.15224-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test_=28rev5=29?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_huc_copy: Enable a HuC copy test (rev5)
URL   : https://patchwork.freedesktop.org/series/71194/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8298_full -> IGTPW_4463_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4463_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_huc_copy@huc-copy} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-iclb3/igt@gem_huc_copy@huc-copy.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8298_full and IGTPW_4463_full:

### New IGT tests (1) ###

  * igt@gem_huc_copy@huc-copy:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4463_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#1316] / [i915#579])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-tglb:         [PASS][6] -> [SKIP][7] ([i915#1316] / [i915#579])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-tglb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#1119] / [i915#93] / [i915#95])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#1119] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#54] / [i915#93] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#54] / [i915#95]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#54])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#54])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#1566] / [i915#93] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#52] / [i915#54]) +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#177] / [i915#52] / [i915#54])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
    - shard-tglb:         [PASS][28] -> [SKIP][29] ([i915#668]) +6 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#1559] / [i915#93] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#1559] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][34] -> [FAIL][35] ([i915#173])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb3/igt@kms_psr@no_drrs.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-iclb1/igt@kms_psr@no_drrs.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [SKIP][36] ([i915#1316] / [i915#579]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb2/igt@i915_pm_rpm@dpms-lpsp.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-iclb1/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [SKIP][38] ([i915#1316] / [i915#579]) -> [PASS][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-tglb5/igt@i915_pm_rpm@dpms-lpsp.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-tglb3/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-glk:          [SKIP][40] ([fdo#109271]) -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk2/igt@i915_pm_rpm@sysfs-read.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-glk8/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][42] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][44] ([i915#52] / [i915#54]) -> [PASS][45] +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][46] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][48] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][52] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][54] ([fdo#109441]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][56] ([fdo#112015]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-hsw:          [SKIP][58] ([fdo#109271]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][60] ([fdo#109278]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][62] ([i915#180]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][64] ([i915#180] / [i915#95]) -> [FAIL][65] ([i915#93] / [i915#95])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][66] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][67] ([fdo#108145] / [i915#265])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          [FAIL][68] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][69] ([fdo#108145] / [i915#265])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8298/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
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
  * IGT: IGT_5589 -> IGTPW_4463
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8298: 17f82f0c2857d0b442adbdb62eb44b61d0f5b775 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4463: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4463/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
