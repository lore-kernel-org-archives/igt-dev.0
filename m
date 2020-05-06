Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 May 2020 15:53:59 -0000
Message-ID: <158878043940.11897.11272055372043564709@emeril.freedesktop.org>
References: <20200506142218.3098955-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200506142218.3098955-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Fschedule=3A_?=
 =?utf-8?q?Exercise_timeslicing_along_an_engine?=
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

Series: series starting with [i-g-t,1/2] i915/gem_exec_schedule: Exercise timeslicing along an engine
URL   : https://patchwork.freedesktop.org/series/76997/
State : success

== Summary ==

CI Bug Log - changes from IGT_5635_full -> IGTPW_4538_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4538_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_fence@submit@rcs0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-tglb2/igt@gem_exec_fence@submit@rcs0.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl7/igt@gem_exec_fence@submit@rcs0.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-iclb3/igt@gem_exec_fence@submit@rcs0.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl6/igt@gem_exec_fence@submit@rcs0.html

  
New tests
---------

  New tests have been introduced between IGT_5635_full and IGTPW_4538_full:

### New IGT tests (8) ###

  * igt@gem_exec_fence@submit:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@submit@rcs0:
    - Statuses : 5 incomplete(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@timeslicing:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@timeslicing@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_schedule@timeslicing@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_schedule@timeslicing@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_schedule@timeslicing@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_schedule@timeslicing@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4538_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#1566] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][19] ([i915#180]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][21] ([i915#716]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-glk:          [FAIL][23] ([i915#71]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-glk6/igt@kms_color@pipe-b-legacy-gamma.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-glk7/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][25] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][27] ([i915#72]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-c-single-bo:
    - shard-kbl:          [DMESG-WARN][29] ([i915#165] / [i915#62] / [i915#92]) -> [PASS][30] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@kms_cursor_legacy@pipe-c-single-bo.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl2/igt@kms_cursor_legacy@pipe-c-single-bo.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][31] ([fdo#109349]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * {igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][33] ([i915#61]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-hsw8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-apl:          [FAIL][35] ([i915#49] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [FAIL][37] ([i915#49]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][39] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][41] ([i915#53] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][43] ([fdo#109441]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][45] ([i915#1542]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-iclb1/igt@perf@polling-parameterized.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-iclb8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][47] ([i915#454]) -> [SKIP][48] ([i915#468])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][49] ([i915#1319]) -> [FAIL][50] ([fdo#110321] / [fdo#110336] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][51] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][52] ([i915#1319])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl8/igt@kms_content_protection@legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][53] ([fdo#110321]) -> [TIMEOUT][54] ([i915#1319])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl4/igt@kms_content_protection@srm.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [FAIL][55] ([IGT#2]) -> [FAIL][56] ([IGT#2] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl8/igt@kms_sysfs_edid_timing.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-apl6/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [FAIL][57] ([IGT#2]) -> [FAIL][58] ([IGT#2] / [i915#93] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl1/igt@kms_sysfs_edid_timing.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/shard-kbl7/igt@kms_sysfs_edid_timing.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5635 -> IGTPW_4538

  CI-20190529: 20190529
  CI_DRM_8433: db68fed086f2ddcdc30e0d9ca5faaba5e55d0d01 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4538: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/index.html
  IGT_5635: e83abfca61d407d12eee4d25bb0e8686337a7791 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4538/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
