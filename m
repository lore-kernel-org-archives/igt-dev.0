Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 12 Apr 2020 13:29:29 -0000
Message-ID: <158669816985.22942.9386934489036719017@emeril.freedesktop.org>
References: <20200412112131.2752212-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200412112131.2752212-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Restore_premerge_testing_of_heavy_reloc_testing?=
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

Series: intel-ci: Restore premerge testing of heavy reloc testing
URL   : https://patchwork.freedesktop.org/series/75843/
State : success

== Summary ==

CI Bug Log - changes from IGT_5588_full -> IGTPW_4450_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/index.html

Known issues
------------

  Here are the changes found in IGTPW_4450_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [PASS][1] -> [SKIP][2] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk3/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-glk6/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#1316] / [i915#579])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-iclb1/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-iclb7/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-hsw:          [PASS][5] -> [SKIP][6] ([fdo#109271]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-hsw1/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#1316] / [i915#579])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb6/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-tglb2/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1566] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#433])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1559] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-hsw4/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1085])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-tglb5/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * {igt@gem_exec_alignment@pi-shared}:
    - shard-glk:          [TIMEOUT][33] ([i915#1631]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk9/igt@gem_exec_alignment@pi-shared.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-glk4/igt@gem_exec_alignment@pi-shared.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][35] ([i915#478]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][37] ([i915#478]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [SKIP][39] ([i915#1316] / [i915#579]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb6/igt@i915_pm_rpm@pm-caching.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-tglb8/igt@i915_pm_rpm@pm-caching.html
    - shard-glk:          [SKIP][41] ([fdo#109271]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk7/igt@i915_pm_rpm@pm-caching.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-glk7/igt@i915_pm_rpm@pm-caching.html
    - shard-iclb:         [SKIP][43] ([i915#1316] / [i915#579]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-iclb3/igt@i915_pm_rpm@pm-caching.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-iclb8/igt@i915_pm_rpm@pm-caching.html
    - shard-hsw:          [SKIP][45] ([fdo#109271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@i915_pm_rpm@pm-caching.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-hsw1/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_pm_rps@reset:
    - shard-glk:          [FAIL][47] ([i915#39]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk4/igt@i915_pm_rps@reset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-glk2/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][49] ([i915#1531] / [i915#1658]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb1/igt@i915_selftest@live@requests.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-tglb5/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][51] ([i915#155]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl2/igt@i915_suspend@sysfs-reader.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][55] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][57] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][59] ([i915#52] / [i915#54]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][61] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][63] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][65] ([i915#61]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-hsw1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [INCOMPLETE][67] ([i915#456] / [i915#460]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][69] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][71] ([i915#1559] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][75] ([i915#31] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl7/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-apl6/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][77] ([i915#31] / [i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl1/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl7/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][79] ([i915#1525]) -> [FAIL][80] ([i915#95])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][81] ([i915#64]) -> [FAIL][82] ([i915#93] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1631]: https://gitlab.freedesktop.org/drm/intel/issues/1631
  [i915#1658]: https://gitlab.freedesktop.org/drm/intel/issues/1658
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5588 -> IGTPW_4450

  CI-20190529: 20190529
  CI_DRM_8291: ef6b9e8bc3134d7261f080ceb5158b16447a4793 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4450: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/index.html
  IGT_5588: 83182c9b2dee30f9e49b980606802de2bbf8d218 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4450/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
