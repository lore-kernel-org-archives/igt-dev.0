Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Dec 2019 11:48:16 -0000
Message-ID: <157597849677.18783.5148802714789027195@emeril.freedesktop.org>
References: <20191210065519.17847-1-stylon.wang@amd.com>
In-Reply-To: <20191210065519.17847-1-stylon.wang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Test_plane_level_CTM?=
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
To: Stylon Wang <Stylon.Wang@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/amdgpu: Test plane level CTM
URL   : https://patchwork.freedesktop.org/series/70667/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7524_full -> IGTPW_3836_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3836_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_render_copy@y-tiled-to-vebox-linear}:
    - shard-iclb:         NOTRUN -> [SKIP][1] +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  
Known issues
------------

  Here are the changes found in IGTPW_3836_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112080]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@independent-bsd1:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb1/igt@gem_exec_schedule@independent-bsd1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb6/igt@gem_exec_schedule@independent-bsd1.html

  * igt@gem_exec_schedule@out-order-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb3/igt@gem_exec_schedule@out-order-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb1/igt@gem_exec_schedule@out-order-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([fdo#111736] / [i915#460])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb6/igt@gem_exec_suspend@basic-s3.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@normal:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([i915#435])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb7/igt@gem_exec_whisper@normal.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb6/igt@gem_exec_whisper@normal.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][16] -> [DMESG-WARN][17] ([fdo#111870]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_selftest@live_requests:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([fdo#112057])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb2/igt@i915_selftest@live_requests.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb7/igt@i915_selftest@live_requests.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#747])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-kbl1/igt@i915_selftest@mock_sanitycheck.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-kbl2/igt@i915_selftest@mock_sanitycheck.html
    - shard-snb:          [PASS][22] -> [DMESG-WARN][23] ([i915#747])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-snb4/igt@i915_selftest@mock_sanitycheck.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-snb4/igt@i915_selftest@mock_sanitycheck.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-apl2/igt@kms_flip@flip-vs-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-apl4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][26] -> [INCOMPLETE][27] ([i915#61])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#49])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#49])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][32] -> [FAIL][33] ([i915#49])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [PASS][34] -> [INCOMPLETE][35] ([i915#456] / [i915#460] / [i915#474])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [PASS][36] -> [INCOMPLETE][37] ([fdo#112393] / [i915#667])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#331])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-glk1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-glk1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#331])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-apl8/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#331])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [PASS][44] -> [INCOMPLETE][45] ([i915#456] / [i915#460]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-apl4/igt@gem_ctx_isolation@rcs0-s3.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-apl:          [FAIL][48] ([i915#679]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-apl2/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-apl3/igt@gem_ctx_persistence@vecs0-mixed-process.html
    - shard-glk:          [FAIL][50] ([i915#679]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-glk9/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-glk1/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [INCOMPLETE][52] ([i915#435]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb8/igt@gem_exec_nop@basic-parallel.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb1/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_schedule@preempt-queue-render:
    - shard-tglb:         [INCOMPLETE][54] ([fdo#111606] / [fdo#111677]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb6/igt@gem_exec_schedule@preempt-queue-render.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb9/igt@gem_exec_schedule@preempt-queue-render.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][56] ([fdo#112146]) -> [PASS][57] +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@smoketest-vebox:
    - shard-tglb:         [INCOMPLETE][58] ([i915#707]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb6/igt@gem_exec_schedule@smoketest-vebox.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb2/igt@gem_exec_schedule@smoketest-vebox.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [SKIP][60] ([fdo#112080]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb3/igt@gem_exec_store@cachelines-vcs1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb1/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][62] ([i915#644]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][64] ([fdo#111870]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-snb7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-snb7/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-hsw:          [DMESG-WARN][66] ([IGT#6]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [FAIL][68] ([i915#54]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [FAIL][70] ([i915#54]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][72] ([i915#49]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-tglb:         [INCOMPLETE][76] ([i915#456] / [i915#460]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][78] ([fdo#109642] / [fdo#111068]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb6/igt@kms_psr2_su@page_flip.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][80] ([fdo#109441]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [SKIP][82] ([fdo#109276]) -> [PASS][83] +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-iclb6/igt@prime_busy@after-bsd2.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-iclb2/igt@prime_busy@after-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs2-dirty-switch:
    - shard-tglb:         [SKIP][84] ([fdo#111912] / [fdo#112080]) -> [SKIP][85] ([fdo#112080])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7524/shard-tglb5/igt@gem_ctx_isolation@vcs2-dirty-switch.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/shard-tglb9/igt@gem_ctx_isolation@vcs2-dirty-switch.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112057]: https://bugs.freedesktop.org/show_bug.cgi?id=112057
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112393]: https://bugs.freedesktop.org/show_bug.cgi?id=112393
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5341 -> IGTPW_3836
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7524: 28ecf94a6f1072fc4744c06f5b3d267297125b37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3836: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/index.html
  IGT_5341: 5fe683cdebde2d77d16ffc42c9fdf29a9f95bb82 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3836/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
