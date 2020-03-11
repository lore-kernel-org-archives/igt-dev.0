Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Mar 2020 09:55:45 -0000
Message-ID: <158392054571.13950.17807642130946687693@emeril.freedesktop.org>
References: <20200310170928.109826-1-don.hiatt@intel.com>
In-Reply-To: <20200310170928.109826-1-don.hiatt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fpm=3A_Adjust_pm_status_check_timeout_and_log_timing_=28rev2?=
 =?utf-8?q?=29?=
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
To: "Hiatt, Don" <don.hiatt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_pm: Adjust pm status check timeout and log timing (rev2)
URL   : https://patchwork.freedesktop.org/series/74398/
State : success

== Summary ==

CI Bug Log - changes from IGT_5504_full -> IGTPW_4287_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4287_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4287_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4287_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][1] ([i915#180]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_4287_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4] ([fdo#103927] / [i915#1402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-apl8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([i915#155])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl7/igt@gem_eio@in-flight-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_schedule@implicit-write-read-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +12 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw1/igt@gem_userptr_blits@dmabuf-unsync.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw6/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870] / [i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870] / [i915#836])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#1316])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-tglb6/igt@i915_pm_rpm@modeset-lpsp-stress.html
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#1316])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb3/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#54]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#72])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#49])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#899])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-apl1/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-apl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +9 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][49] ([i915#1402]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +20 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [INCOMPLETE][57] ([i915#1120]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][59] ([i915#644]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-iclb:         [FAIL][61] ([i915#644]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][63] ([i915#413]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb1/igt@i915_pm_rps@waitboost.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][69] ([i915#155]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][71] ([i915#899]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-x:
    - shard-hsw:          [DMESG-WARN][73] ([i915#478]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw1/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw2/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][77] ([fdo#112080]) -> [PASS][78] +18 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb8/igt@perf_pmu@init-busy-vcs1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@basic-gtt:
    - shard-snb:          [DMESG-WARN][79] ([i915#478]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-snb5/igt@prime_vgem@basic-gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-snb5/igt@prime_vgem@basic-gtt.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][81] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][82] ([fdo#111870] / [i915#478])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][83] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][84] ([fdo#111870])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw8/igt@gem_userptr_blits@dmabuf-sync.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][85] ([i915#588]) -> [SKIP][86] ([i915#658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][87] ([i915#468]) -> [FAIL][88] ([i915#454])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][89] ([fdo#109293] / [fdo#109506]) -> [SKIP][90] ([i915#1316])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb1/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][91] ([fdo#109506]) -> [SKIP][92] ([i915#1316])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-tglb3/igt@i915_pm_rpm@pc8-residency.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][93] ([fdo#109349]) -> [DMESG-WARN][94] ([i915#1226])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103]) ([fdo#111870] / [i915#478]) -> ([FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111]) ([fdo#111870])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw8/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw1/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw7/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw8/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw2/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw7/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-hsw7/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw7/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw7/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw5/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw5/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw5/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-hsw4/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][112], [FAIL][113]) ([i915#1389] / [i915#1402] / [i915#92]) -> ([FAIL][114], [FAIL][115]) ([fdo#111870] / [i915#92])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl7/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-kbl7/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-kbl2/igt@runner@aborted.html
    - shard-apl:          [FAIL][116] ([fdo#103927]) -> ([FAIL][117], [FAIL][118]) ([fdo#103927] / [i915#1402])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5504/shard-apl4/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-apl8/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/shard-apl7/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#836]: https://gitlab.freedesktop.org/drm/intel/issues/836
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4287
  * Linux: CI_DRM_8103 -> CI_DRM_8108

  CI-20190529: 20190529
  CI_DRM_8103: b221cecd0c17a8862b175e1b31bd86396502f079 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_8108: 7616c3ce8d78b3c229e4dc27d795246a2677f0a9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4287: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4287/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
