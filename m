Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 13 May 2020 21:47:23 -0000
Message-ID: <158940644390.25407.5098318905207844042@emeril.freedesktop.org>
References: <20200513170224.848726-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200513170224.848726-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915=3A_Report_scheduler_c?=
 =?utf-8?q?aps_for_timeslicing?=
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

Series: series starting with [i-g-t,1/2] lib/i915: Report scheduler caps for timeslicing
URL   : https://patchwork.freedesktop.org/series/77236/
State : success

== Summary ==

CI Bug Log - changes from IGT_5652_full -> IGTPW_4567_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4567_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_fence@syncobj-future} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-iclb8/igt@gem_exec_fence@syncobj-future.html

  * {igt@gem_exec_fence@syncobj-future-group} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-tglb1/igt@gem_exec_fence@syncobj-future-group.html

  
New tests
---------

  New tests have been introduced between IGT_5652_full and IGTPW_4567_full:

### New IGT tests (13) ###

  * igt@gem_exec_fence@syncobj-future:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-cycle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-deadlock:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-group:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-pair:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-past:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-self:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-self-submit:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit-cycle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit-deadlock:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-future-submit-past:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-incomplete-wait-submit:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4567_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#1436] / [i915#716])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6] ([i915#155])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl1/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([CI#80] / [i915#155])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-snb2/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-snb6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#31])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl7/igt@kms_setmode@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl6/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][29] ([i915#1436] / [i915#716]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][31] ([i915#1119] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][33] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [FAIL][35] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-iclb:         [FAIL][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][41] ([i915#433]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [FAIL][43] ([i915#53] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [FAIL][45] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][47] ([i915#1559] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][49] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-iclb2/igt@kms_psr@psr2_suspend.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][53] ([i915#1319]) -> [FAIL][54] ([fdo#110321] / [fdo#110336])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl2/igt@kms_content_protection@atomic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][55] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][56] ([i915#357])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl3/igt@kms_content_protection@uevent.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][57] ([i915#357] / [i915#95]) -> [FAIL][58] ([i915#357])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl2/igt@kms_content_protection@uevent.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl4/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][59] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][60] ([i915#64])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][61] ([i915#1121] / [i915#95]) -> [FAIL][62] ([i915#1525])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl1/igt@kms_fbcon_fbt@fbc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][63] ([fdo#108145] / [i915#265]) -> [FAIL][64] ([fdo#108145] / [i915#265] / [i915#95]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          [FAIL][65] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][66] ([fdo#108145] / [i915#265])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-apl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][68] ([fdo#108145] / [i915#265])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265]) -> [FAIL][70] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][71] ([fdo#109642] / [fdo#111068]) -> [FAIL][72] ([i915#608])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5652/shard-iclb8/igt@kms_psr2_su@page_flip.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5652 -> IGTPW_4567

  CI-20190529: 20190529
  CI_DRM_8475: fdb67b76a2d3b315585813539269dac22e2305f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4567: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/index.html
  IGT_5652: 60e8be7ccc72086a88d2eff3bcd02495fad5fa46 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4567/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
