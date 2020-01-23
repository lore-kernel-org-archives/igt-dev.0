Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 20:22:25 -0000
Message-ID: <157981094566.1145.1616379306006410708@emeril.freedesktop.org>
References: <20200122162651.1111-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200122162651.1111-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Enhance_invalid_mapping_exercise?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Enhance invalid mapping exercise
URL   : https://patchwork.freedesktop.org/series/72411/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7794_full -> IGTPW_3969_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/index.html

New tests
---------

  New tests have been introduced between CI_DRM_7794_full and IGTPW_3969_full:

### New IGT tests (3) ###

  * igt@gem_userptr_blits@invalid-uc-mapping:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_userptr_blits@invalid-wb-mapping:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_userptr_blits@invalid-wc-mapping:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_3969_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2] ([fdo#109100] / [i915#140])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb5/igt@gem_ctx_isolation@bcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb2/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-snb:          [PASS][5] -> [DMESG-WARN][6] ([i915#478])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-snb6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-snb1/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +14 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +6 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-iclb:         [PASS][11] -> [INCOMPLETE][12] ([i915#140])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-glk:          [PASS][13] -> [INCOMPLETE][14] ([i915#58] / [i915#970] / [k.org#198133])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-glk3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-glk3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-snb:          [PASS][15] -> [INCOMPLETE][16] ([i915#82])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#110789] / [i915#478])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-snb6/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-snb1/igt@gem_persistent_relocs@forked-thrash-inactive.html
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#61]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-hsw8/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-hsw6/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#110789] / [fdo#111870] / [i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#447])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#472]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-tglb1/igt@i915_selftest@mock_requests.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-tglb7/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([fdo#103665]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#34])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-glk6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-glk2/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#49]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#112080]) +9 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb7/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [fdo#112080]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb5/igt@gem_ctx_isolation@vcs1-none.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [INCOMPLETE][47] ([i915#58] / [k.org#198133]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-glk9/igt@gem_exec_create@forked.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-glk4/igt@gem_exec_create@forked.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][49] ([fdo#112080]) -> [PASS][50] +11 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][51] ([i915#677]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-snb:          [DMESG-WARN][55] ([i915#478]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-snb2/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-snb4/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [INCOMPLETE][57] ([fdo#103927] / [i915#970]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-kbl:          [INCOMPLETE][59] ([fdo#103665] / [i915#970]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [INCOMPLETE][61] ([i915#530] / [i915#61]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [INCOMPLETE][63] ([fdo#103927]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-tglb:         [INCOMPLETE][65] ([i915#472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-tglb1/igt@gem_persistent_relocs@forked-thrashing.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-tglb6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][67] ([i915#644]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870] / [i915#478]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][71] ([i915#413]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb8/igt@i915_pm_rps@reset.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-kbl:          [INCOMPLETE][73] ([fdo#103665]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-kbl1/igt@i915_selftest@mock_requests.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-kbl2/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-tglb:         [FAIL][77] ([i915#49]) -> [PASS][78] +7 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][83] ([fdo#109276]) -> [PASS][84] +22 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][85] ([IGT#28]) -> [SKIP][86] ([fdo#109276] / [fdo#112080])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][87] ([i915#818]) -> [FAIL][88] ([i915#694])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-hsw1/igt@gem_tiled_blits@normal.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][89] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][90] ([fdo#110789] / [fdo#111870] / [i915#478])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7794/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#970]: https://gitlab.freedesktop.org/drm/intel/issues/970
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3969
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7794: 00c5afbc7dc1d8e5cecea7a4369320d6ba99a5b8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3969/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
