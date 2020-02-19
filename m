Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 23:02:29 -0000
Message-ID: <158215334972.21061.9103428384232784439@emeril.freedesktop.org>
References: <7278cd464aa928fdefb9b4b89df73d3c52fefc42.1581053156.git.ashutosh.dixit@intel.com>
In-Reply-To: <7278cd464aa928fdefb9b4b89df73d3c52fefc42.1581053156.git.ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX2Zl?=
 =?utf-8?q?nce=5Fpin=5Fleak=3A_check_for_availabile_fences_=28rev2=29?=
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

Series: kms_fence_pin_leak: check for availabile fences (rev2)
URL   : https://patchwork.freedesktop.org/series/73127/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7959_full -> IGTPW_4171_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4171_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4171_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4171_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-iclb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb5/igt@kms_flip@flip-vs-panning-vs-hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb2/igt@kms_flip@flip-vs-panning-vs-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_4171_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@rcs0-contexts:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4] ([i915#61])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-hsw1/igt@gem_exec_parallel@rcs0-contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-hsw5/igt@gem_exec_parallel@rcs0-contexts.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +9 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +16 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#694])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#454])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#413])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb1/igt@i915_pm_rps@reset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb2/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#49]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#668]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([fdo#103375]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][39] -> [TIMEOUT][40] ([fdo#112271] / [i915#1085])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-iclb:         [FAIL][43] ([i915#1241]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb5/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#110841]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][47] ([i915#677]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][49] ([fdo#109276]) -> [PASS][50] +16 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * {igt@gem_exec_whisper@basic-queues-forked}:
    - shard-apl:          [INCOMPLETE][53] ([fdo#103927]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-apl4/igt@gem_exec_whisper@basic-queues-forked.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-apl1/igt@gem_exec_whisper@basic-queues-forked.html

  * {igt@gem_exec_whisper@basic-queues-priority}:
    - shard-glk:          [DMESG-WARN][55] ([i915#118] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][57] ([fdo#111870] / [i915#478]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][59] ([i915#716]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live_gt_heartbeat:
    - shard-glk:          [DMESG-FAIL][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-glk6/igt@i915_selftest@live_gt_heartbeat.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-glk9/igt@i915_selftest@live_gt_heartbeat.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [INCOMPLETE][63] ([i915#1233]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-tglb2/igt@i915_selftest@live_gt_lrc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-tglb5/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-apl1/igt@i915_suspend@fence-restore-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-apl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][67] ([i915#79]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-apl:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-tglb:         [SKIP][73] ([i915#668]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][77] ([i915#31]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-hsw1/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-hsw8/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][79] ([i915#31]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-kbl4/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-kbl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +8 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb8/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb2/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][83] ([IGT#28]) -> [SKIP][84] ([fdo#112080]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][85] ([i915#454]) -> [SKIP][86] ([i915#468])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][87] ([i915#1226]) -> [SKIP][88] ([fdo#109349])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7959/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1081]: https://gitlab.freedesktop.org/drm/intel/issues/1081
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5447 -> IGTPW_4171
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7959: c455da41f8201b44a704fa55999208d196544455 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4171: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/index.html
  IGT_5447: 8d6b2500e44d3dc78b5eac8798f0de42f2ff9014 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4171/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
