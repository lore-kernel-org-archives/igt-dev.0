Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Dec 2019 08:35:08 -0000
Message-ID: <157622610839.23800.2831806474927999989@emeril.freedesktop.org>
References: <20191212142415.26517-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212142415.26517-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_i915_pipe_stress_test_=28rev2=29?=
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
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce i915 pipe stress test (rev2)
URL   : https://patchwork.freedesktop.org/series/70815/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7551_full -> IGTPW_3858_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3858_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pipe_stress@stress-xrgb8888-untiled} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-snb5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-hsw:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-hsw7/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-kbl3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-apl1/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-glk:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-glk4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7551_full and IGTPW_3858_full:

### New IGT tests (1) ###

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - Statuses : 6 fail(s)
    - Exec time: [0.0, 2.22] s

  

Known issues
------------

  Here are the changes found in IGTPW_3858_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_eio@in-flight-1us:
    - shard-snb:          [PASS][9] -> [FAIL][10] ([i915#490])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb1/igt@gem_eio@in-flight-1us.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-snb4/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#435])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb5/igt@gem_exec_nop@basic-parallel.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb3/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_parallel@vcs1:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([fdo#111593])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb8/igt@gem_exec_parallel@vcs1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb1/igt@gem_exec_parallel@vcs1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([i915#530])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-hsw1/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [PASS][19] -> [TIMEOUT][20] ([i915#530])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb2/igt@gem_persistent_relocs@forked-thrashing.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb2/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#644])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([fdo#111870]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([fdo#103665] / [i915#151])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-kbl3/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_suspend@sysfs-reader:
    - shard-snb:          [PASS][29] -> [DMESG-WARN][30] ([i915#42])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb1/igt@i915_suspend@sysfs-reader.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-snb1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([IGT#6])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#456] / [i915#460])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#54]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
    - shard-iclb:         [PASS][43] -> [INCOMPLETE][44] ([i915#140]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#79])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [PASS][47] -> [INCOMPLETE][48] ([i915#474] / [i915#667])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][49] -> [FAIL][50] ([i915#49])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-iclb:         [PASS][51] -> [INCOMPLETE][52] ([i915#123] / [i915#140])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-kbl:          [PASS][53] -> [INCOMPLETE][54] ([fdo#103665] / [i915#435] / [i915#648] / [i915#667])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-kbl7/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109441]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][57] -> [FAIL][58] ([i915#31])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-glk2/igt@kms_setmode@basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-glk8/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#112080]) +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb8/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109276]) +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb4/igt@prime_busy@after-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb3/igt@prime_busy@after-bsd2.html

  * igt@prime_busy@wait-hang-default:
    - shard-glk:          [PASS][63] -> [INCOMPLETE][64] ([i915#58] / [k.org#198133])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-glk9/igt@prime_busy@wait-hang-default.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-glk5/igt@prime_busy@wait-hang-default.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-tglb:         [INCOMPLETE][65] ([i915#456]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb4/igt@gem_ctx_isolation@vcs1-s3.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb2/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][67] ([fdo#109276] / [fdo#112080]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_capture@capture-bsd:
    - shard-iclb:         [SKIP][69] ([fdo#112146]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb1/igt@gem_exec_capture@capture-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb3/igt@gem_exec_capture@capture-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][71] ([fdo#112080]) -> [PASS][72] +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2:
    - shard-tglb:         [INCOMPLETE][73] ([fdo#111677]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-render:
    - shard-tglb:         [INCOMPLETE][75] ([fdo#111606] / [fdo#111677]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-render.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-snb:          [TIMEOUT][77] ([i915#530]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-snb7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-tglb:         [FAIL][79] ([i915#520]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-iclb:         [FAIL][81] ([i915#644]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-hsw5/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][85] ([fdo#111870]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [INCOMPLETE][87] ([i915#456] / [i915#460]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb7/igt@i915_pm_backlight@fade_with_suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb8/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][89] ([i915#454]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-tglb:         [DMESG-WARN][91] ([i915#766]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb8/igt@i915_pm_rpm@drm-resources-equal.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb2/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-snb:          [DMESG-WARN][93] ([i915#747]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-snb2/igt@i915_selftest@mock_sanitycheck.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-snb7/igt@i915_selftest@mock_sanitycheck.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +4 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [FAIL][97] ([i915#49]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [DMESG-WARN][99] ([i915#180]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][101] ([fdo#103665] / [i915#648] / [i915#667]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][105] ([i915#31]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-apl6/igt@kms_setmode@basic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-apl2/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][107] ([fdo#109276]) -> [PASS][108] +6 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][109] ([fdo#109276] / [fdo#112080]) -> [FAIL][110] ([IGT#28])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][111] ([IGT#28]) -> [SKIP][112] ([fdo#109276] / [fdo#112080])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][113] ([fdo#107724]) -> [SKIP][114] ([fdo#109349])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7551/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#766]: https://gitlab.freedesktop.org/drm/intel/issues/766
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5346 -> IGTPW_3858
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7551: e60aa4ffc106f910452d28f2ea49ae2ff44d85d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3858: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/index.html
  IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3858/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
