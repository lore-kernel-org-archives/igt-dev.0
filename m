Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 11 Apr 2020 10:30:44 -0000
Message-ID: <158660104464.321.16420606296876798150@emeril.freedesktop.org>
References: <20200408201925.31566-1-jose.souza@intel.com>
In-Reply-To: <20200408201925.31566-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Ffbcon=5Ffbt=3A_Mak?=
 =?utf-8?q?e_FBC_wait=5Funtil=5Fupdate=28=29_more_reliable_=28rev3=29?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_fbcon_fbt: Make FBC wait_until_update() more reliable (rev3)
URL   : https://patchwork.freedesktop.org/series/75701/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5588_full -> IGTPW_4445_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4445_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4445_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4445_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-hostile@rcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk7/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-glk8/igt@gem_ctx_persistence@engines-hostile@rcs0.html

  
New tests
---------

  New tests have been introduced between IGT_5588_full and IGTPW_4445_full:

### New IGT tests (1) ###

  * igt@gem_userptr_blits@process-exit-mmap:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4445_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#53] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#265] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-hsw6/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1085])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-tglb5/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][33] ([i915#478]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][35] ([i915#478]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [SKIP][37] ([i915#1316] / [i915#579]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb6/igt@i915_pm_rpm@pm-caching.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-tglb8/igt@i915_pm_rpm@pm-caching.html
    - shard-glk:          [SKIP][39] ([fdo#109271]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk7/igt@i915_pm_rpm@pm-caching.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-glk9/igt@i915_pm_rpm@pm-caching.html
    - shard-iclb:         [SKIP][41] ([i915#1316] / [i915#579]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-iclb3/igt@i915_pm_rpm@pm-caching.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-iclb1/igt@i915_pm_rpm@pm-caching.html
    - shard-hsw:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@i915_pm_rpm@pm-caching.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-hsw4/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_pm_rps@reset:
    - shard-glk:          [FAIL][45] ([i915#39]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk4/igt@i915_pm_rps@reset.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-glk6/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][47] ([i915#1531] / [i915#1658]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb1/igt@i915_selftest@live@requests.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-tglb1/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][49] ([i915#155]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl2/igt@i915_suspend@sysfs-reader.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][53] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][55] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][57] ([i915#52] / [i915#54]) -> [PASS][58] +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][59] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][61] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][63] ([i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-hsw6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [INCOMPLETE][65] ([i915#456] / [i915#460]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][67] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][69] ([i915#1559] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-iclb3/igt@kms_psr@psr2_basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-iclb2/igt@kms_psr@psr2_basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][73] ([i915#1542]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-iclb7/igt@perf@blocking-parameterized.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-iclb8/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][75] ([i915#468]) -> [FAIL][76] ([i915#454])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-snb:          [SKIP][77] ([fdo#109271]) -> [INCOMPLETE][78] ([i915#82])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-snb4/igt@i915_pm_rpm@pm-caching.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-snb5/igt@i915_pm_rpm@pm-caching.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [FAIL][79] ([fdo#108145] / [i915#265]) -> [FAIL][80] ([fdo#108145] / [i915#265] / [i915#95])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][81] ([i915#31] / [i915#95]) -> [FAIL][82] ([i915#31])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl7/igt@kms_setmode@basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-apl3/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][83] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][84] ([i915#31])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl1/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/shard-kbl2/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1658]: https://gitlab.freedesktop.org/drm/intel/issues/1658
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5588 -> IGTPW_4445

  CI-20190529: 20190529
  CI_DRM_8291: ef6b9e8bc3134d7261f080ceb5158b16447a4793 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4445: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/index.html
  IGT_5588: 83182c9b2dee30f9e49b980606802de2bbf8d218 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
