Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Apr 2020 08:32:11 -0000
Message-ID: <158581633141.24296.16489585685246435988@emeril.freedesktop.org>
References: <20200401103606.138917-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200401103606.138917-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHMv?=
 =?utf-8?q?i915-perf-recorder=3A_fix_topology_alignment_issue?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tools/i915-perf-recorder: fix topology alignment issue
URL   : https://patchwork.freedesktop.org/series/75360/
State : success

== Summary ==

CI Bug Log - changes from IGT_5551_full -> IGTPW_4389_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/index.html

New tests
---------

  New tests have been introduced between IGT_5551_full and IGTPW_4389_full:

### New IGT tests (5) ###

  * igt@gem_exec_capture@capture:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@basic-spin:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_store@dword:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_wait@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_wait@write-busy:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4389_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [i915#677])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +13 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([i915#155])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#1527])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-glk6/igt@i915_pm_rc6_residency@rc6-idle.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1531])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-tglb3/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-tglb3/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +9 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl7/igt@i915_suspend@sysfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#57])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#699] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +9 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([fdo#108145] / [i915#265] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#1559] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#1559] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#173])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb5/igt@kms_psr@no_drrs.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#1085])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-tglb8/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * {igt@gem_exec_async@concurrent-writes@vcs0}:
    - shard-tglb:         [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-tglb8/igt@gem_exec_async@concurrent-writes@vcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-tglb7/igt@gem_exec_async@concurrent-writes@vcs0.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][55] ([fdo#109276] / [i915#677]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-kbl:          [FAIL][59] ([i915#1593]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl3/igt@i915_pm_rc6_residency@rc6-idle.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [FAIL][61] ([i915#1119] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][63] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-apl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-kbl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][69] ([i915#72]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][71] ([fdo#109349]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][73] ([i915#52] / [i915#54]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][75] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][77] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-apl:          [DMESG-WARN][79] ([i915#165] / [i915#180]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl4/igt@kms_flip@dpms-vs-vblank-race.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl6/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][81] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][85] ([i915#31]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl2/igt@kms_setmode@basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl6/igt@kms_setmode@basic.html

  * igt@perf_pmu@init-sema-vcs1:
    - shard-iclb:         [SKIP][87] ([fdo#112080]) -> [PASS][88] +8 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb3/igt@perf_pmu@init-sema-vcs1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb4/igt@perf_pmu@init-sema-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][89] ([fdo#109276]) -> [PASS][90] +12 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gen3_mixed_blits:
    - shard-iclb:         [SKIP][91] -> [SKIP][92] ([fdo#109289])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-iclb5/igt@gen3_mixed_blits.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-iclb8/igt@gen3_mixed_blits.html
    - shard-tglb:         [SKIP][93] -> [SKIP][94] ([fdo#109289])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-tglb1/igt@gen3_mixed_blits.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-tglb1/igt@gen3_mixed_blits.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][95] ([i915#454]) -> [SKIP][96] ([i915#468])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-snb:          [INCOMPLETE][97] ([i915#82]) -> [SKIP][98] ([fdo#109271])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-snb4/igt@i915_pm_rpm@gem-execbuf.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-snb1/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-snb:          [SKIP][99] ([fdo#109271]) -> [INCOMPLETE][100] ([i915#82])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-snb5/igt@i915_pm_rpm@gem-pread.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-snb5/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [FAIL][101] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][102] ([fdo#108145] / [i915#265])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5551/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1527]: https://gitlab.freedesktop.org/drm/intel/issues/1527
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1593]: https://gitlab.freedesktop.org/drm/intel/issues/1593
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5551 -> IGTPW_4389

  CI-20190529: 20190529
  CI_DRM_8231: e262993871d01ae0ee71477ffc92752305cd2bb5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4389: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/index.html
  IGT_5551: fed920b4ae275d8644f1cc3d8adf37f3a22fc721 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4389/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
