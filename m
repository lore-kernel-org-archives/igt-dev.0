Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 22 May 2020 04:00:59 -0000
Message-ID: <159012005904.3048.12043421872423402186@emeril.freedesktop.org>
References: <20200521102248.3157266-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200521102248.3157266-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Exercise_stalls_of_bonded_pairs?=
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

Series: i915/gem_exec_balancer: Exercise stalls of bonded pairs
URL   : https://patchwork.freedesktop.org/series/77504/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8517_full -> IGTPW_4607_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4607_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4607_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4607_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_balancer@bonded-true-hang} (NEW):
    - shard-tglb:         NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-tglb2/igt@gem_exec_balancer@bonded-true-hang.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-kbl3/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@kms_vblank@pipe-a-wait-forked-hang:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl1/igt@kms_vblank@pipe-a-wait-forked-hang.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl4/igt@kms_vblank@pipe-a-wait-forked-hang.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2}:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-kbl:          [DMESG-WARN][7] ([i915#180]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@perf@global-sseu-config}:
    - shard-iclb:         [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb5/igt@perf@global-sseu-config.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-iclb4/igt@perf@global-sseu-config.html
    - shard-tglb:         [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-tglb1/igt@perf@global-sseu-config.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-tglb8/igt@perf@global-sseu-config.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8517_full and IGTPW_4607_full:

### New IGT tests (2) ###

  * igt@gem_exec_balancer@bonded-false-hang:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.16] s

  * igt@gem_exec_balancer@bonded-true-hang:
    - Statuses : 3 pass(s) 1 skip(s) 2 timeout(s)
    - Exec time: [0.0, 120.31] s

  

Known issues
------------

  Here are the changes found in IGTPW_4607_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#1899])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb8/igt@i915_pm_dc@dc5-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#1899])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-tglb2/igt@i915_pm_dc@dc5-psr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-tglb6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#72])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109349])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#699] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109642] / [fdo#111068])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][39] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +10 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][43] ([i915#433]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +7 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][47] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][49] ([i915#173]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb1/igt@kms_psr@no_drrs.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-iclb3/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][53] ([i915#155]) -> [DMESG-WARN][54] ([i915#180])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-kbl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][55] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][56] ([i915#1319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][57] ([fdo#108145] / [i915#265]) -> [FAIL][58] ([fdo#108145] / [i915#265] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1883]: https://gitlab.freedesktop.org/drm/intel/issues/1883
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5666 -> IGTPW_4607
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8517: 7c5c05e694bf83e9d4ef64172ef6c9d55aa334a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4607: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/index.html
  IGT_5666: dfa3b1fdc9813a48314a43faaacb7dacc06112d6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4607/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
