Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 05 Jun 2020 16:28:46 -0000
Message-ID: <159137452678.18506.1035039871677989119@emeril.freedesktop.org>
References: <20200605143720.710220-1-michel@daenzer.net>
In-Reply-To: <20200605143720.710220-1-michel@daenzer.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX2N1?=
 =?utf-8?q?rsor=5Flegacy=3A_Keep_primary_plane_enabled_for_XRGB_overlay_fa?=
 =?utf-8?q?llback?=
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
To: =?utf-8?q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: kms_cursor_legacy: Keep primary plane enabled for XRGB overlay fallback
URL   : https://patchwork.freedesktop.org/series/78047/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8590_full -> IGTPW_4652_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4652_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4652_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4652_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-hsw:          [PASS][1] -> [TIMEOUT][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-hsw7/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-hsw5/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-snb:          [PASS][3] -> [TIMEOUT][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-snb4/igt@gem_exec_reloc@basic-cpu-read-noreloc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-snb5/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  
#### Warnings ####

  * igt@kms_ccs@pipe-d-missing-ccs-buffer:
    - shard-snb:          [SKIP][5] ([fdo#109271]) -> [TIMEOUT][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-snb4/igt@kms_ccs@pipe-d-missing-ccs-buffer.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-snb5/igt@kms_ccs@pipe-d-missing-ccs-buffer.html
    - shard-hsw:          [SKIP][7] ([fdo#109271]) -> [TIMEOUT][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-hsw4/igt@kms_ccs@pipe-d-missing-ccs-buffer.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-hsw5/igt@kms_ccs@pipe-d-missing-ccs-buffer.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_isolation@preservation-s3}:
    - shard-snb:          NOTRUN -> [TIMEOUT][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-snb5/igt@gem_ctx_isolation@preservation-s3.html
    - shard-hsw:          NOTRUN -> [TIMEOUT][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-hsw5/igt@gem_ctx_isolation@preservation-s3.html

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-snb:          [FAIL][11] ([i915#1930]) -> [TIMEOUT][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8590_full and IGTPW_4652_full:

### New IGT tests (14) ###

  * igt@gem_exec_balancer@bonded-cork:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.24] s

  * igt@gem_exec_balancer@bonded-imm:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.23] s

  * igt@gem_exec_balancer@busy:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.65] s

  * igt@gem_exec_balancer@full:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.48] s

  * igt@gem_exec_balancer@full-late:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.46] s

  * igt@gem_exec_balancer@full-late-pulse:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.48] s

  * igt@gem_exec_balancer@full-pulse:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.42] s

  * igt@gem_exec_balancer@indices:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.15] s

  * igt@gem_exec_balancer@individual:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.29] s

  * igt@gem_exec_balancer@invalid-balancer:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.25] s

  * igt@gem_exec_balancer@invalid-bonds:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_exec_balancer@nop:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 39.11] s

  * igt@gem_exec_balancer@semaphore:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.61] s

  * igt@gem_exec_balancer@smoke:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 23.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_4652_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#95]) +31 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl1/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl4/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#93] / [i915#95]) +34 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl4/igt@gem_mmap_wc@write-wc-read-gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl7/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl3/igt@gem_workarounds@suspend-resume-context.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#1899])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-tglb2/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][25] -> [DMESG-FAIL][26] ([i915#118] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#61])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-hsw4/igt@kms_color@pipe-b-ctm-0-25.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-hsw7/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-b-ctm-blue-to-red:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#62] / [i915#92]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl1/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl2/igt@kms_color@pipe-b-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#54] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-iclb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-glk4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#402])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-tglb8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [DMESG-WARN][47] ([i915#118] / [i915#95]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk1/igt@gem_exec_whisper@basic-normal.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-glk7/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [INCOMPLETE][49] ([i915#1602] / [i915#456]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-tglb3/igt@gem_workarounds@suspend-resume-fd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-tglb7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][51] ([i915#1436] / [i915#716]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][53] ([i915#1904]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][55] ([i915#1899]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-iclb5/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][57] ([i915#155]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl3/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1149] / [i915#402]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-tglb2/igt@kms_color@pipe-d-ctm-0-5.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-tglb7/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-hsw:          [TIMEOUT][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-hsw5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-hsw5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [DMESG-FAIL][65] ([i915#54] / [i915#95]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [DMESG-FAIL][67] ([i915#54] / [i915#95]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk6/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-apl:          [DMESG-WARN][73] ([i915#95]) -> [PASS][74] +33 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl7/igt@kms_flip_tiling@flip-x-tiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl4/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][79] ([fdo#109642] / [fdo#111068]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl6/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl1/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][85] ([i915#93] / [i915#95]) -> [PASS][86] +39 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@kms_vblank@pipe-b-wait-busy:
    - shard-kbl:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl4/igt@kms_vblank@pipe-b-wait-busy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl2/igt@kms_vblank@pipe-b-wait-busy.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][89] ([i915#1542]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb5/igt@perf@blocking-parameterized.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-iclb5/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][91] ([i915#1542]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-hsw6/igt@perf@polling-parameterized.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-hsw5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@kms_ccs@pipe-c-crc-primary-basic:
    - shard-hsw:          [TIMEOUT][93] -> [SKIP][94] ([fdo#109271]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-hsw5/igt@kms_ccs@pipe-c-crc-primary-basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-hsw4/igt@kms_ccs@pipe-c-crc-primary-basic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][95] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][96] ([i915#1319])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          [DMESG-FAIL][97] ([fdo#110321]) -> [TIMEOUT][98] ([i915#1319])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl3/igt@kms_content_protection@legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl1/igt@kms_content_protection@legacy.html
    - shard-apl:          [TIMEOUT][99] ([i915#1319] / [i915#1635]) -> [FAIL][100] ([fdo#110321] / [fdo#110336])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl3/igt@kms_content_protection@legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [DMESG-FAIL][101] ([fdo#110321] / [i915#95]) -> [TIMEOUT][102] ([i915#1319])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl2/igt@kms_content_protection@srm.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl6/igt@kms_content_protection@srm.html
    - shard-apl:          [DMESG-FAIL][103] ([fdo#110321] / [i915#95]) -> [TIMEOUT][104] ([i915#1319] / [i915#1635])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl8/igt@kms_content_protection@srm.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-apl:          [DMESG-WARN][105] ([i915#95]) -> [DMESG-WARN][106] ([i915#1982])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-hsw:          [INCOMPLETE][107] ([i915#61]) -> [SKIP][108] ([fdo#109271])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][109] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][110] ([i915#93] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [DMESG-WARN][111] ([i915#180] / [i915#95]) -> [DMESG-WARN][112] ([i915#95])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5695 -> IGTPW_4652
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8590: 91c6f0274b54c89679cd23f6fc65e9fe5922971f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4652: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/index.html
  IGT_5695: 53e8c878a6fb5708e63c99403691e8960b86ea9c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4652/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
