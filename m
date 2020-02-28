Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 Feb 2020 15:44:40 -0000
Message-ID: <158290468051.7474.4202236153301752285@emeril.freedesktop.org>
References: <1582810023-28424-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1582810023-28424-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_remove_redundant_work?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_rotation_crc: remove redundant work
URL   : https://patchwork.freedesktop.org/series/74020/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8018_full -> IGTPW_4235_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8018_full and IGTPW_4235_full:

### New IGT tests (4) ###

  * igt@drm_mm@all:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@mock:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@perf:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_selftest@all:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4235_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2] ([fdo#103665] / [i915#1291])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +22 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb8/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@implicit-read-write-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [i915#677]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#413])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb3/igt@i915_pm_rps@reset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb3/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#1149])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-tglb3/igt@kms_color@pipe-a-degamma.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-tglb6/igt@kms_color@pipe-a-degamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html

  * igt@kms_flip@nonexisting-fb-interruptible:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl1/igt@kms_flip@nonexisting-fb-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl1/igt@kms_flip@nonexisting-fb-interruptible.html
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1297])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl3/igt@kms_flip@nonexisting-fb-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl2/igt@kms_flip@nonexisting-fb-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([fdo#103665])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl2/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl8/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl2/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl3/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl6/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#405]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb1/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@polling:
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-glk4/igt@perf@polling.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-glk5/igt@perf@polling.html
    - shard-tglb:         [PASS][45] -> [SKIP][46] ([i915#405])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-tglb2/igt@perf@polling.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-tglb3/igt@perf@polling.html
    - shard-kbl:          [PASS][47] -> [SKIP][48] ([fdo#109271]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl1/igt@perf@polling.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl7/igt@perf@polling.html
    - shard-hsw:          [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw6/igt@perf@polling.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw6/igt@perf@polling.html

  * igt@perf@short-reads:
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([i915#51])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl1/igt@perf@short-reads.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl4/igt@perf@short-reads.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#112080]) +9 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb5/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@sync-bsd1:
    - shard-apl:          [PASS][55] -> [INCOMPLETE][56] ([fdo#103927] / [i915#409])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl1/igt@prime_vgem@sync-bsd1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl2/igt@prime_vgem@sync-bsd1.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +8 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb7/igt@gem_busy@extended-parallel-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb2/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_shared@q-independent-blt:
    - shard-tglb:         [FAIL][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-tglb7/igt@gem_ctx_shared@q-independent-blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-tglb1/igt@gem_ctx_shared@q-independent-blt.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][61] ([i915#1277]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-tglb1/igt@gem_exec_balancer@hang.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-tglb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [i915#677]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][65] ([i915#677]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +11 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb5/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][69] ([fdo#112146]) -> [PASS][70] +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][71] ([i915#644]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][75] ([i915#716]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-hsw:          [DMESG-WARN][77] ([i915#478]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw1/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw5/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][87] ([i915#1085]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [INCOMPLETE][89] ([fdo#103665]) -> [DMESG-WARN][90] ([i915#180])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][91] ([fdo#112080]) -> [FAIL][92] ([IGT#28])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97]) ([fdo#111870] / [i915#478]) -> ([FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104]) ([fdo#111870])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw1/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw1/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw4/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-hsw1/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw6/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw4/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw4/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw4/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-hsw5/igt@runner@aborted.html
    - shard-apl:          [FAIL][105] ([fdo#103927]) -> ([FAIL][106], [FAIL][107]) ([fdo#103927] / [i915#409])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/shard-apl7/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl3/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/shard-apl2/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5473 -> IGTPW_4235
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8018: d2d7fd43fafd159b7d9d957340e4ed9775ab20b0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4235: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/index.html
  IGT_5473: d22b3507ff2678a05d69d47c0ddf6f0e72ee7ffd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
