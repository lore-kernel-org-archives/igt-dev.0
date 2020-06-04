Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Jun 2020 14:56:45 -0000
Message-ID: <159128260512.14553.6592022823219001623@emeril.freedesktop.org>
References: <20200604100353.24552-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200604100353.24552-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_from_media=5Fspin?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Remove libdrm from media_spin
URL   : https://patchwork.freedesktop.org/series/77993/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5695_full -> IGTPW_4650_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4650_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4650_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4650_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb5/igt@gem_tiled_partial_pwrite_pread@reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb2/igt@gem_tiled_partial_pwrite_pread@reads.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf_pmu@idle-no-semaphores@vecs0}:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk9/igt@perf_pmu@idle-no-semaphores@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk7/igt@perf_pmu@idle-no-semaphores@vecs0.html

  
New tests
---------

  New tests have been introduced between IGT_5695_full and IGTPW_4650_full:

### New IGT tests (11) ###

  * igt@gem_ctx_engines@execute-allforone:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_ctx_engines@execute-one:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.20, 1.39] s

  * igt@gem_ctx_engines@execute-oneforall:
    - Statuses : 7 pass(s)
    - Exec time: [0.05, 0.38] s

  * igt@gem_ctx_engines@idempotent:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@gem_ctx_engines@independent:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@gem_ctx_engines@invalid-engines:
    - Statuses : 1 dmesg-warn(s) 6 pass(s)
    - Exec time: [0.00] s

  * igt@gem_ctx_shared@create-shared-gtt:
    - Statuses : 6 pass(s)
    - Exec time: [2.15, 2.17] s

  * igt@gem_ctx_shared@detached-shared-gtt:
    - Statuses : 7 pass(s)
    - Exec time: [2.15, 2.16] s

  * igt@gem_ctx_shared@disjoint-timelines:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_ctx_shared@q-smoketest-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 32.29] s

  * igt@gem_ctx_shared@single-timeline:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4650_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#1602] / [i915#456])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb1/igt@gem_exec_suspend@basic-s0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb3/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk2/igt@gem_exec_whisper@basic-fds-forked-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk4/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_mmap_wc@bad-object:
    - shard-hsw:          [PASS][9] -> [DMESG-WARN][10] ([i915#1927])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-hsw4/igt@gem_mmap_wc@bad-object.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-hsw4/igt@gem_mmap_wc@bad-object.html

  * igt@gem_pread@display:
    - shard-glk:          [PASS][11] -> [INCOMPLETE][12] ([i915#58] / [k.org#198133])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk8/igt@gem_pread@display.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk7/igt@gem_pread@display.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#93] / [i915#95]) +46 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-kbl2/igt@kms_atomic@plane-invalid-params-fence.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-kbl1/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#95]) +32 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl6/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl6/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][21] -> [DMESG-FAIL][22] ([i915#118] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk5/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][23] -> [TIMEOUT][24] ([i915#1958]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk9/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][27] -> [DMESG-FAIL][28] ([i915#1925] / [i915#1926])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#402])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#95]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#1911])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][37] -> [FAIL][38] ([i915#173])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-iclb7/igt@kms_psr@no_drrs.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * {igt@gem_ctx_isolation@preservation-s3@vecs0}:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * {igt@gem_exec_reloc@basic-concurrent0}:
    - shard-apl:          [FAIL][45] ([i915#1930]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl1/igt@gem_exec_reloc@basic-concurrent0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl2/igt@gem_exec_reloc@basic-concurrent0.html

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][47] ([i915#82]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-snb5/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-snb5/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][49] ([i915#118] / [i915#95]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [DMESG-WARN][51] ([i915#1602]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb5/igt@gem_workarounds@suspend-resume-fd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][53] ([i915#1904]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][55] ([i915#1899]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-iclb7/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][57] ([i915#155]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-kbl3/igt@i915_suspend@debugfs-reader.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-kbl1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1149] / [i915#402]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb3/igt@kms_color@pipe-d-ctm-0-5.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb7/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [DMESG-FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-offscreen:
    - shard-apl:          [DMESG-WARN][65] ([i915#95]) -> [PASS][66] +37 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-offscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-apl:          [TIMEOUT][67] ([i915#1635]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
    - shard-glk:          [INCOMPLETE][69] ([i915#58] / [k.org#198133]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [DMESG-FAIL][71] ([i915#54] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * {igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [INCOMPLETE][73] ([i915#1927] / [i915#58] / [k.org#198133]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk6/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a1-hdmi-a2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
    - shard-glk:          [TIMEOUT][75] ([i915#1958]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk5/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk9/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][77] ([fdo#109642] / [fdo#111068]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_sequence@queue-idle:
    - shard-hsw:          [INCOMPLETE][81] ([i915#1927] / [i915#61]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-hsw7/igt@kms_sequence@queue-idle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-hsw7/igt@kms_sequence@queue-idle.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-kbl4/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][85] ([i915#93] / [i915#95]) -> [PASS][86] +42 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * {igt@perf@blocking-parameterized}:
    - shard-tglb:         [FAIL][87] ([i915#1542]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb1/igt@perf@blocking-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb6/igt@perf@blocking-parameterized.html

  * igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted:
    - shard-tglb:         [DMESG-WARN][89] ([i915#402]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb3/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb1/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [SKIP][91] ([fdo#109271]) -> [INCOMPLETE][92] ([i915#82])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-snb4/igt@i915_pm_dc@dc6-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-snb5/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         [FAIL][93] ([i915#454]) -> [SKIP][94] ([i915#468])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_ccs@pipe-c-crc-primary-basic:
    - shard-glk:          [TIMEOUT][95] ([i915#1958]) -> [SKIP][96] ([fdo#109271])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk5/igt@kms_ccs@pipe-c-crc-primary-basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk1/igt@kms_ccs@pipe-c-crc-primary-basic.html

  * igt@kms_color@pipe-c-ctm-0-25:
    - shard-iclb:         [DMESG-FAIL][97] ([i915#1149] / [i915#1982]) -> [FAIL][98] ([i915#1149] / [i915#315])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-iclb2/igt@kms_color@pipe-c-ctm-0-25.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-iclb4/igt@kms_color@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-apl:          [TIMEOUT][99] ([i915#1366] / [i915#1635]) -> [SKIP][100] ([fdo#109271] / [fdo#111827])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl8/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl4/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][101] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][102] ([i915#1319])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl2/igt@kms_content_protection@atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][103] ([i915#1319]) -> [TIMEOUT][104] ([i915#1319] / [i915#1635])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [DMESG-FAIL][105] ([fdo#110321] / [i915#95]) -> [TIMEOUT][106] ([i915#1319] / [i915#1635])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl1/igt@kms_content_protection@lic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-WARN][107] ([i915#1926]) -> [DMESG-WARN][108] ([i915#1927])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-apl:          [TIMEOUT][109] ([i915#1635]) -> [SKIP][110] ([fdo#109271]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][111] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][112] ([fdo#108145] / [i915#95]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][113] -> [FAIL][114] ([i915#1927])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5695/shard-hsw7/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/shard-hsw4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
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
  [i915#1366]: https://gitlab.freedesktop.org/drm/intel/issues/1366
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5695 -> IGTPW_4650

  CI-20190529: 20190529
  CI_DRM_8581: a3ae560b4c2a6dfb0d550cc40471a7b0c7043500 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4650: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/index.html
  IGT_5695: 53e8c878a6fb5708e63c99403691e8960b86ea9c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4650/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
