Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 22:21:03 -0000
Message-ID: <158992686324.31239.6604398751386595985@emeril.freedesktop.org>
References: <20200519125956.13206-1-imre.deak@intel.com>
In-Reply-To: <20200519125956.13206-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Keep_signal_helpers_enabled_after_a_failed_interr?=
 =?utf-8?q?uptible_subtest?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_flip: Keep signal helpers enabled after a failed interruptible subtest
URL   : https://patchwork.freedesktop.org/series/77411/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8504_full -> IGTPW_4588_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4588_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4588_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4588_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb2/igt@kms_panel_fitting@atomic-fastset.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][3] ([i915#468]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_balancer@sliced}:
    - shard-kbl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl1/igt@gem_exec_balancer@sliced.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl2/igt@gem_exec_balancer@sliced.html

  * {igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1}:
    - shard-tglb:         [FAIL][7] ([i915#1883]) -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4588_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([i915#155]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-iclb:         [PASS][11] -> [INCOMPLETE][12] ([i915#1185])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-iclb1/igt@gem_workarounds@suspend-resume-fd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-iclb3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#1899])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#1757])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-iclb2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#668]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb6/igt@kms_psr@psr2_sprite_plane_move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#405])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb5/igt@perf@oa-exponents.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb6/igt@perf@oa-exponents.html
    - shard-glk:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-glk5/igt@perf@oa-exponents.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-glk7/igt@perf@oa-exponents.html
    - shard-apl:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl4/igt@perf@oa-exponents.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl1/igt@perf@oa-exponents.html
    - shard-kbl:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl1/igt@perf@oa-exponents.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl6/igt@perf@oa-exponents.html
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([i915#405])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-iclb2/igt@perf@oa-exponents.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-iclb7/igt@perf@oa-exponents.html

  
#### Possible fixes ####

  * {igt@gem_exec_balancer@sliced}:
    - shard-tglb:         [FAIL][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb1/igt@gem_exec_balancer@sliced.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb1/igt@gem_exec_balancer@sliced.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][37] ([i915#180] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl1/igt@gem_workarounds@suspend-resume.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl3/igt@gem_workarounds@suspend-resume.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][39] ([i915#1119] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][41] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][43] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [FAIL][51] ([i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [FAIL][53] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][55] ([i915#433]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl2/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][61] ([i915#1602]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][63] ([i915#658]) -> [SKIP][64] ([i915#588])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][65] ([i915#454] / [i915#93] / [i915#95]) -> [FAIL][66] ([i915#454])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][67] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][68] ([i915#1319])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl8/igt@kms_content_protection@atomic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl4/igt@kms_content_protection@atomic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][69] ([fdo#108145] / [i915#265]) -> [FAIL][70] ([fdo#108145] / [i915#265] / [i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][71] ([fdo#108145] / [i915#265]) -> [FAIL][72] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][73] -> [FAIL][74] ([i915#608])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8504/shard-tglb3/igt@kms_psr2_su@page_flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/shard-tglb7/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1757]: https://gitlab.freedesktop.org/drm/intel/issues/1757
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1883]: https://gitlab.freedesktop.org/drm/intel/issues/1883
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5660 -> IGTPW_4588
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8504: 7e42247620e80fa44a9416f0d8e32cc3ca9f922f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4588: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/index.html
  IGT_5660: bf43e3e45a17c16094fb3a47b363ccf1c95c28b9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4588/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
