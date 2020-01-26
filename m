Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 26 Jan 2020 21:13:22 -0000
Message-ID: <158007320289.5256.14972933374109466251@emeril.freedesktop.org>
References: <20200124164131.39591-1-matthew.auld@intel.com>
In-Reply-To: <20200124164131.39591-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS90?=
 =?utf-8?q?ests/gem=5Fexec=5Fbig=3A_prefer_PROT=5FWRITE?=
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
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/tests/gem_exec_big: prefer PROT_WRITE
URL   : https://patchwork.freedesktop.org/series/72543/
State : success

== Summary ==

CI Bug Log - changes from IGT_5383_full -> IGTPW_3992_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/index.html

Known issues
------------

  Here are the changes found in IGTPW_3992_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-switch:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-switch.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-switch.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl8/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-apl3/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +18 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([fdo#111870] / [i915#478])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#694])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-hsw7/igt@gen7_exec_parse@basic-offset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-hsw5/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#472])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-tglb4/igt@i915_selftest@mock_requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-tglb5/igt@i915_selftest@mock_requests.html
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103665])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl7/igt@i915_selftest@mock_requests.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-kbl1/igt@i915_selftest@mock_requests.html
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#61])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-hsw2/igt@i915_selftest@mock_requests.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-hsw7/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#978])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#49]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#112080]) +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][33] ([fdo#112080]) -> [PASS][34] +12 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-iclb:         [FAIL][35] ([i915#679]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb3/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb6/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [fdo#112080]) -> [PASS][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb3/igt@gem_ctx_persistence@vcs1-queued.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@in-order-bsd2:
    - shard-iclb:         [SKIP][39] ([fdo#109276]) -> [PASS][40] +15 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb3/igt@gem_exec_schedule@in-order-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb4/igt@gem_exec_schedule@in-order-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][41] ([i915#677]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@gem_exec_schedule@preempt-other-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb7/igt@gem_exec_schedule@preempt-other-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][49] ([i915#818]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-hsw5/igt@gem_tiled_blits@normal.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][51] ([fdo#111870] / [i915#478]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-apl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-kbl:          [FAIL][55] ([i915#168]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl7/igt@kms_color@pipe-a-ctm-max.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-kbl6/igt@kms_color@pipe-a-ctm-max.html
    - shard-apl:          [FAIL][57] ([i915#168]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl4/igt@kms_color@pipe-a-ctm-max.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-apl2/igt@kms_color@pipe-a-ctm-max.html
    - shard-glk:          [FAIL][59] ([i915#168]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk4/igt@kms_color@pipe-a-ctm-max.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-glk9/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][61] ([i915#71]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-tglb4/igt@kms_color@pipe-a-gamma.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-tglb4/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-glk:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-apl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
    - shard-kbl:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [FAIL][75] ([i915#49]) -> [PASS][76] +7 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][79] ([i915#31]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl1/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-apl3/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][81] ([IGT#28]) -> [SKIP][82] ([fdo#109276] / [fdo#112080])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][83] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][84] ([fdo#111870] / [i915#478])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][85] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][86] ([fdo#110789] / [fdo#111870] / [i915#478]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [INCOMPLETE][87] ([fdo#103665]) -> [DMESG-WARN][88] ([i915#180])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#978]: https://gitlab.freedesktop.org/drm/intel/issues/978


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5383 -> IGTPW_3992

  CI-20190529: 20190529
  CI_DRM_7809: 861f608ce6e3c1a1ad320a5d18055601cff36e45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3992: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/index.html
  IGT_5383: 81948d9e088db962c1fd413c93920cbc826f3d25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3992/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
