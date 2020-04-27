Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Apr 2020 09:39:43 -0000
Message-ID: <158798038319.26357.6035242033774607283@emeril.freedesktop.org>
References: <20200427080601.19785-1-mika.kahola@intel.com>
In-Reply-To: <20200427080601.19785-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_CCS_Clear_Color_test?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_ccs: CCS Clear Color test
URL   : https://patchwork.freedesktop.org/series/76536/
State : success

== Summary ==

CI Bug Log - changes from IGT_5612_full -> IGTPW_4507_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/index.html

New tests
---------

  New tests have been introduced between IGT_5612_full and IGTPW_4507_full:

### New IGT tests (4) ###

  * igt@kms_ccs@pipe-a-clear-color:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.20] s

  * igt@kms_ccs@pipe-b-clear-color:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.99] s

  * igt@kms_ccs@pipe-c-clear-color:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.02] s

  * igt@kms_ccs@pipe-d-clear-color:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.62] s

  

Known issues
------------

  Here are the changes found in IGTPW_4507_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109349])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#668]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#155])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#1559] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#173])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-iclb7/igt@kms_psr@no_drrs.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-hsw1/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-hsw2/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1085])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-tglb8/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-apl:          [FAIL][31] ([i915#1528]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-apl1/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-kbl:          [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl4/igt@gem_exec_whisper@basic-fds-forked.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl4/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-apl:          [FAIL][35] ([i915#54] / [i915#95]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][43] ([i915#52] / [i915#54]) -> [PASS][44] +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [FAIL][45] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [FAIL][47] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * {igt@kms_flip@flip-vs-suspend@b-dp1}:
    - shard-kbl:          [DMESG-WARN][49] ([i915#165] / [i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl6/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl1/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * {igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1}:
    - shard-glk:          [FAIL][51] ([i915#34]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-glk1/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-glk7/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][53] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [FAIL][55] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][57] ([fdo#109642] / [fdo#111068]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_pwrite_crc:
    - shard-snb:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-snb4/igt@kms_pwrite_crc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-snb2/igt@kms_pwrite_crc.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][63] ([i915#1542]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-iclb7/igt@perf@blocking-parameterized.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-iclb3/igt@perf@blocking-parameterized.html

  * {igt@perf@gen12-oa-tlb-invalidate}:
    - shard-tglb:         [SKIP][65] ([i915#405]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-tglb6/igt@perf@gen12-oa-tlb-invalidate.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-tglb7/igt@perf@gen12-oa-tlb-invalidate.html

  * {igt@prime_vgem@sync@bcs0}:
    - shard-tglb:         [INCOMPLETE][67] ([i915#409]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-tglb8/igt@prime_vgem@sync@bcs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-tglb3/igt@prime_vgem@sync@bcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][69] ([i915#468]) -> [FAIL][70] ([i915#454])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@fences:
    - shard-snb:          [INCOMPLETE][71] ([i915#82]) -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/shard-snb2/igt@i915_pm_rpm@fences.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/shard-snb6/igt@i915_pm_rpm@fences.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5612 -> IGTPW_4507

  CI-20190529: 20190529
  CI_DRM_8370: 1f3ffd7683d5457e14a1f879a8714a74b7b7faeb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4507: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/index.html
  IGT_5612: c8dc1fd926a550308b971ca7d83fe0a927a38152 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
