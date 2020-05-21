Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 21 May 2020 11:50:50 -0000
Message-ID: <159006185021.4442.2799945689950726508@emeril.freedesktop.org>
References: <20200520162946.2602017-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200520162946.2602017-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Verify_timeslicing_between_submit-fence?=
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

Series: i915/gem_exec_schedule: Verify timeslicing between submit-fence
URL   : https://patchwork.freedesktop.org/series/77485/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8514_full -> IGTPW_4602_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8514_full and IGTPW_4602_full:

### New IGT tests (18) ###

  * igt@gem_exec_schedule@submit-early-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-early-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@submit-early-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@submit-early-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@submit-early-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@submit-early-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@submit-golden-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-golden-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@submit-golden-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@submit-golden-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@submit-golden-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@submit-golden-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@submit-late-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-late-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@submit-late-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@submit-late-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@submit-late-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@submit-late-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_4602_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#52] / [i915#54] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][9] -> [FAIL][10] ([fdo#108145] / [i915#265] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109441]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-iclb5/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#31])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl8/igt@kms_setmode@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl1/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-apl:          [FAIL][15] ([i915#1528]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl3/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl6/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][17] ([i915#1436] / [i915#716]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][19] ([i915#1899]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-iclb7/igt@i915_pm_dc@dc5-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-iclb1/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][21] ([i915#1899]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-tglb1/igt@i915_pm_dc@dc5-psr.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-tglb6/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][23] ([i915#1119] / [i915#95]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][25] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][27] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][29] ([fdo#109349]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [FAIL][31] ([i915#1121]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-tglb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][33] ([i915#180] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-tglb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][37] ([fdo#109441]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][41] ([i915#1542]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-tglb8/igt@perf@polling-parameterized.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-tglb5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [INCOMPLETE][43] ([i915#155]) -> [DMESG-WARN][44] ([i915#180])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][45] ([i915#1319]) -> [FAIL][46] ([fdo#110321] / [fdo#110336])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl8/igt@kms_content_protection@atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][47] ([fdo#110321] / [fdo#110336] / [i915#95]) -> [FAIL][48] ([fdo#110321] / [fdo#110336])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][49] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][50] ([i915#1319])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl3/igt@kms_content_protection@legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][51] ([fdo#110321]) -> [TIMEOUT][52] ([i915#1319])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl4/igt@kms_content_protection@lic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][53] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][54] ([i915#64])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][55] ([i915#1121] / [i915#95]) -> [FAIL][56] ([i915#1525])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl4/igt@kms_fbcon_fbt@fbc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][57] ([i915#1525]) -> [FAIL][58] ([i915#1121] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][59] ([i915#64]) -> [FAIL][60] ([i915#1121] / [i915#93] / [i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][61] ([fdo#108145] / [i915#265]) -> [FAIL][62] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5664 -> IGTPW_4602
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8514: c98b2ef26a5a946fd22839fce7dc4cc868f565fb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4602: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/index.html
  IGT_5664: 404e2fa06b9c5986dec3fa210234fe8b034b157e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
