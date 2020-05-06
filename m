Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 May 2020 11:59:45 -0000
Message-ID: <158876638586.11898.11113642662297505328@emeril.freedesktop.org>
References: <20200506045354.19122-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200506045354.19122-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdjusted_test_to_utilize_all_available_en?=
 =?utf-8?q?gines=2E_=28rev2=29?=
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
To: sai gowtham <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill:Adjusted test to utilize all available engines. (rev2)
URL   : https://patchwork.freedesktop.org/series/76772/
State : success

== Summary ==

CI Bug Log - changes from IGT_5635_full -> IGTPW_4537_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/index.html

New tests
---------

  New tests have been introduced between IGT_5635_full and IGTPW_4537_full:

### New IGT tests (29) ###

  * igt@gem_ringfill@basic-default@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@basic-default@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ringfill@basic-default@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_ringfill@basic-default@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@gem_ringfill@basic-default@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@basic-fd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-fd@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@gem_ringfill@basic-fd@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.09] s

  * igt@gem_ringfill@basic-fd@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@gem_ringfill@basic-fd@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.05] s

  * igt@gem_ringfill@basic-fd@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@gem_ringfill@basic-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-forked@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-forked@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@gem_ringfill@basic-forked@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_ringfill@basic-forked@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_ringfill@basic-forked@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-hang@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [10.75, 15.04] s

  * igt@gem_ringfill@basic-hang@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [10.75, 15.43] s

  * igt@gem_ringfill@basic-hang@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 15.03] s

  * igt@gem_ringfill@basic-hang@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [14.98, 15.04] s

  * igt@gem_ringfill@basic-hang@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [10.75, 15.04] s

  * igt@gem_ringfill@basic-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-interruptible@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.09, 1.10] s

  * igt@gem_ringfill@basic-interruptible@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.09, 1.15] s

  * igt@gem_ringfill@basic-interruptible@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.12] s

  * igt@gem_ringfill@basic-interruptible@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.09, 1.11] s

  * igt@gem_ringfill@basic-interruptible@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.09, 1.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_4537_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#1566] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#53] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1559] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][19] ([i915#180]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][21] ([i915#716]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][23] ([i915#1119] / [i915#95]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][25] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [FAIL][27] ([i915#71]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl6/igt@kms_color@pipe-b-legacy-gamma.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl1/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-glk:          [FAIL][29] ([i915#71]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-glk6/igt@kms_color@pipe-b-legacy-gamma.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-glk8/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [FAIL][31] ([i915#71]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl6/igt@kms_color@pipe-b-legacy-gamma.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl3/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][33] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][35] ([i915#72]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-c-single-bo:
    - shard-kbl:          [DMESG-WARN][37] ([i915#165] / [i915#62] / [i915#92]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@kms_cursor_legacy@pipe-c-single-bo.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl3/igt@kms_cursor_legacy@pipe-c-single-bo.html

  * {igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][39] ([i915#61]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-apl:          [FAIL][41] ([i915#49] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [FAIL][43] ([i915#49]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][45] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][47] ([i915#53] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][49] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][51] ([i915#1559] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][55] ([i915#454]) -> [SKIP][56] ([i915#468])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][57] ([i915#468]) -> [FAIL][58] ([i915#454])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][59] ([i915#1319]) -> [DMESG-FAIL][60] ([fdo#110321])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][61] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][62] ([i915#1319])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl8/igt@kms_content_protection@legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][63] ([fdo#110321]) -> [TIMEOUT][64] ([i915#1319])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl4/igt@kms_content_protection@srm.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][65] ([i915#357]) -> [FAIL][66] ([i915#357] / [i915#93] / [i915#95])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-kbl7/igt@kms_content_protection@uevent.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][67] ([i915#357]) -> [FAIL][68] ([i915#357] / [i915#95])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/shard-apl2/igt@kms_content_protection@uevent.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/shard-apl4/igt@kms_content_protection@uevent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5635 -> IGTPW_4537

  CI-20190529: 20190529
  CI_DRM_8433: db68fed086f2ddcdc30e0d9ca5faaba5e55d0d01 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4537: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/index.html
  IGT_5635: e83abfca61d407d12eee4d25bb0e8686337a7791 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
