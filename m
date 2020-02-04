Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 11:31:39 -0000
Message-ID: <158081589970.25087.2623367670193473672@emeril.freedesktop.org>
References: <20200131171150.8333-1-antonio.argenziano@intel.com>
In-Reply-To: <20200131171150.8333-1-antonio.argenziano@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fsseu=3A_Skip_gtt_tests_if_mappable_aperture_un?=
 =?utf-8?q?available_=28rev3=29?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_sseu: Skip gtt tests if mappable aperture unavailable (rev3)
URL   : https://patchwork.freedesktop.org/series/72801/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7853_full -> IGTPW_4064_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4064_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4064_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4064_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-hsw1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4064_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@idempotent:
    - shard-tglb:         [PASS][2] -> [SKIP][3] ([fdo#112179] / [i915#1099]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@gem_ctx_persistence@idempotent.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-tglb8/igt@gem_ctx_persistence@idempotent.html
    - shard-kbl:          [PASS][4] -> [SKIP][5] ([fdo#109271] / [i915#1099]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-kbl7/igt@gem_ctx_persistence@idempotent.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-kbl3/igt@gem_ctx_persistence@idempotent.html
    - shard-apl:          [PASS][6] -> [SKIP][7] ([fdo#109271] / [i915#1099]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl1/igt@gem_ctx_persistence@idempotent.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-apl6/igt@gem_ctx_persistence@idempotent.html
    - shard-glk:          [PASS][8] -> [SKIP][9] ([fdo#109271] / [i915#1099]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk9/igt@gem_ctx_persistence@idempotent.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-glk2/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_persistence@process:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112179] / [i915#1099]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb8/igt@gem_ctx_persistence@process.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb6/igt@gem_ctx_persistence@process.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([i915#677]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#109276]) +10 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +9 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#644])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][20] -> [DMESG-WARN][21] ([fdo#111870] / [i915#478])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][22] -> [TIMEOUT][23] ([i915#716])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@debugfs-reader:
    - shard-iclb:         [PASS][24] -> [TIMEOUT][25] ([i915#1096])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@i915_suspend@debugfs-reader.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_color@pipe-b-ctm-0-5:
    - shard-hsw:          [PASS][26] -> [INCOMPLETE][27] ([i915#61])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-hsw6/igt@kms_color@pipe-b-ctm-0-5.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-hsw7/igt@kms_color@pipe-b-ctm-0-5.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#54])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#54])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#72])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][36] -> [SKIP][37] ([i915#668])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#173])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@kms_psr@no_drrs.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#112080]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][48] -> [TIMEOUT][49] ([fdo#111546])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-hsw2/igt@perf_pmu@cpu-hotplug.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-hsw1/igt@perf_pmu@cpu-hotplug.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51] +8 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-apl3/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@gem_ctx_persistence@hostile}:
    - shard-apl:          [SKIP][54] ([fdo#109271] / [i915#1099]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl3/igt@gem_ctx_persistence@hostile.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-apl1/igt@gem_ctx_persistence@hostile.html
    - shard-kbl:          [SKIP][56] ([fdo#109271] / [i915#1099]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-kbl2/igt@gem_ctx_persistence@hostile.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-kbl1/igt@gem_ctx_persistence@hostile.html
    - shard-iclb:         [SKIP][58] ([i915#1099]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb1/igt@gem_ctx_persistence@hostile.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb4/igt@gem_ctx_persistence@hostile.html
    - shard-tglb:         [SKIP][60] ([i915#1099]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb8/igt@gem_ctx_persistence@hostile.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-tglb1/igt@gem_ctx_persistence@hostile.html
    - shard-glk:          [SKIP][62] ([fdo#109271] / [i915#1099]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk8/igt@gem_ctx_persistence@hostile.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-glk7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][64] ([fdo#110841]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][66] ([fdo#110854]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][68] ([fdo#112080]) -> [PASS][69] +12 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][70] ([i915#677]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][72] ([fdo#112146]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][74] ([i915#694]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@kms_busy@basic-flip-pipe-a:
    - shard-tglb:         [DMESG-WARN][76] ([i915#402]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@kms_busy@basic-flip-pipe-a.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-tglb7/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-b:
    - shard-glk:          [INCOMPLETE][78] ([CI#80] / [i915#58] / [k.org#198133]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk5/igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-b.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-glk5/igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-b.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][80] ([fdo#103665]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:
    - shard-glk:          [FAIL][82] ([i915#52] / [i915#54]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-glk6/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-snb:          [DMESG-WARN][84] ([i915#478]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [SKIP][86] ([i915#668]) -> [PASS][87] +14 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][88] ([fdo#109642] / [fdo#111068]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][90] ([fdo#109441]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb3/igt@kms_psr@psr2_dpms.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][92] ([fdo#109276]) -> [PASS][93] +25 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][94] ([fdo#112080]) -> [FAIL][95] ([IGT#28])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][96] ([IGT#28]) -> [SKIP][97] ([fdo#112080])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][98] ([i915#818]) -> [FAIL][99] ([i915#694])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-hsw5/igt@gem_tiled_blits@normal.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][100] ([i915#454]) -> [SKIP][101] ([i915#468])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115]) ([fdo#111870] / [i915#1077])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb5/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb6/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb2/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb2/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb5/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb2/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-snb2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-snb5/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-snb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-snb1/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-snb5/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111546]: https://bugs.freedesktop.org/show_bug.cgi?id=111546
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112179]: https://bugs.freedesktop.org/show_bug.cgi?id=112179
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1096]: https://gitlab.freedesktop.org/drm/intel/issues/1096
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5409 -> IGTPW_4064
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7853: 1df04205c16923e525efe9c26d6e98612d38c9b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4064: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/index.html
  IGT_5409: 93aefe6baa3fabf8c0cabe83e185f7b8f8d8753d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4064/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
