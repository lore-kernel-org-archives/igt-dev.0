Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Mar 2020 21:53:48 -0000
Message-ID: <158387722888.5456.2699533412216475873@emeril.freedesktop.org>
References: <20200310162946.2335031-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200310162946.2335031-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/perf=3A_remove_genera?=
 =?utf-8?q?tion_code_for_mathml_render?=
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

Series: series starting with [i-g-t,1/2] lib/i915/perf: remove generation code for mathml render
URL   : https://patchwork.freedesktop.org/series/74528/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8106_full -> IGTPW_4286_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/index.html

Known issues
------------

  Here are the changes found in IGTPW_4286_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#1402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +11 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@gem_exec_schedule@wide-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#118] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk2/igt@gem_exec_whisper@basic-contexts-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-glk3/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-hsw1/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870] / [i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1316])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb4/igt@i915_pm_rpm@dpms-lpsp.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb1/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#1316])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb5/igt@i915_pm_rpm@dpms-lpsp.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-tglb3/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#413]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@i915_pm_rps@reset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109642] / [fdo#111068])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb4/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#173])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb6/igt@kms_psr@no_drrs.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-wait-idle-hang:
    - shard-hsw:          [PASS][45] -> [DMESG-WARN][46] ([i915#44])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@kms_vblank@pipe-a-wait-idle-hang.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-hsw5/igt@kms_vblank@pipe-a-wait-idle-hang.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][49] ([i915#1402]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [INCOMPLETE][51] ([fdo#103927] / [i915#1402]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@processes:
    - shard-kbl:          [FAIL][53] ([i915#570] / [i915#679]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@gem_ctx_persistence@processes.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl7/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-iclb:         [SKIP][55] ([fdo#109276]) -> [PASS][56] +17 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb3/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb4/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][57] ([i915#1277]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb1/igt@gem_exec_balancer@hang.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-tglb7/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276] / [i915#677]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [DMESG-WARN][65] ([i915#118] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [FAIL][69] ([i915#413]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb1/igt@i915_pm_rps@reset.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-tglb8/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@sysfs-reader:
    - shard-snb:          [DMESG-WARN][71] ([i915#42]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@i915_suspend@sysfs-reader.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-snb6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][73] ([i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][77] ([i915#899]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +10 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@basic-gtt:
    - shard-snb:          [DMESG-WARN][83] ([i915#478]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@prime_vgem@basic-gtt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-snb5/igt@prime_vgem@basic-gtt.html

  
#### Warnings ####

  * igt@gem_linear_blits@normal:
    - shard-apl:          [TIMEOUT][85] ([i915#1322]) -> [TIMEOUT][86] ([fdo#111732] / [i915#1322])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl4/igt@gem_linear_blits@normal.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl7/igt@gem_linear_blits@normal.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [FAIL][88] ([fdo#103375])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][89] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][90] ([fdo#111870] / [i915#478])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][91] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][92] ([fdo#111870])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw8/igt@gem_userptr_blits@dmabuf-sync.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-hsw1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@fences:
    - shard-snb:          [INCOMPLETE][93] ([i915#82]) -> [SKIP][94] ([fdo#109271])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@i915_pm_rpm@fences.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-snb2/igt@i915_pm_rpm@fences.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180] / [i915#56]) -> [DMESG-WARN][96] ([i915#180])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][97], [FAIL][98]) ([i915#1389] / [i915#1402] / [i915#92]) -> [FAIL][99] ([i915#92])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl7/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl4/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][100], [FAIL][101]) ([fdo#103927] / [i915#1402]) -> [FAIL][102] ([fdo#103927])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1322]: https://gitlab.freedesktop.org/drm/intel/issues/1322
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4286
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8106: 5b0076e8066ea8218e7857ee1aa28b0670acde94 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4286: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4286/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
