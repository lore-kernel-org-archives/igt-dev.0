Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 12:49:40 -0000
Message-ID: <158254858010.28360.16871436706973279886@emeril.freedesktop.org>
References: <20200221205054.19734-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200221205054.19734-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/igt=5Fdebugfs=3A_Add_igt?=
 =?utf-8?b?X2NyY19nZXRfZm9yX2ZyYW1lKCk=?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/igt_debugfs: Add igt_crc_get_for_frame()
URL   : https://patchwork.freedesktop.org/series/73793/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7983_full -> IGTPW_4215_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4215_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4215_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4215_full:

### IGT changes ###

#### Warnings ####

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][1] ([fdo#112271] / [i915#1085]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-tglb3/igt@perf@gen12-mi-rpc.html
    - shard-iclb:         [SKIP][3] ([fdo#109289]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb6/igt@perf@gen12-mi-rpc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb7/igt@perf@gen12-mi-rpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_4215_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([i915#478])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-snb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-snb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#413])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-tglb1/igt@i915_pm_rps@waitboost.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-tglb1/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103665])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-kbl3/igt@i915_suspend@debugfs-reader.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-kbl2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-snb5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-snb1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-glk7/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-glk3/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-kbl7/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@i915-ref-count:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([i915#276]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb3/igt@perf@i915-ref-count.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb6/igt@perf@i915-ref-count.html

  * igt@perf@short-reads:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([fdo#112172]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-tglb6/igt@perf@short-reads.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-tglb5/igt@perf@short-reads.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#112080]) +9 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109276]) +14 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb6/igt@prime_busy@hang-bsd2.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-snb:          [PASS][41] -> [TIMEOUT][42] ([fdo#112271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-snb5/igt@sw_sync@sync_multi_producer_single_consumer.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-snb6/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-apl2/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [INCOMPLETE][45] ([i915#1291]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [INCOMPLETE][47] ([i915#1291]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb5/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][49] ([fdo#112080]) -> [PASS][50] +12 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * {igt@gem_exec_schedule@implicit-both-bsd1}:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [i915#677]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][55] ([fdo#109276]) -> [PASS][56] +19 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb7/igt@gem_exec_schedule@wide-bsd.html

  * {igt@gem_exec_whisper@basic-queues-forked}:
    - shard-apl:          [INCOMPLETE][59] ([fdo#103927]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-apl6/igt@gem_exec_whisper@basic-queues-forked.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-apl4/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][61] ([fdo#111870] / [i915#478]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][63] ([i915#447]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][65] ([i915#79]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-apl:          [DMESG-WARN][67] ([i915#1297]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-apl3/igt@kms_flip@flip-vs-rmfb.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-apl6/igt@kms_flip@flip-vs-rmfb.html
    - shard-kbl:          [DMESG-WARN][69] ([i915#1297]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-kbl1/igt@kms_flip@flip-vs-rmfb.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-kbl3/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][73] ([i915#899]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-tglb8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-tglb7/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-open-flags:
    - shard-tglb:         [SKIP][79] ([fdo#112172]) -> [PASS][80] +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-tglb5/igt@perf@invalid-open-flags.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-tglb8/igt@perf@invalid-open-flags.html

  * igt@perf@missing-sample-flags:
    - shard-iclb:         [SKIP][81] ([i915#276]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb5/igt@perf@missing-sample-flags.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb7/igt@perf@missing-sample-flags.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][83] ([i915#454]) -> [SKIP][84] ([i915#468])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][85] ([fdo#109349]) -> [DMESG-WARN][86] ([i915#1226])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-iclb:         [SKIP][87] -> [SKIP][88] ([fdo#109289])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb4/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb1/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         [SKIP][89] ([fdo#109289]) -> [SKIP][90] ([i915#276])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-iclb8/igt@perf@unprivileged-single-ctx-counters.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-iclb7/igt@perf@unprivileged-single-ctx-counters.html
    - shard-tglb:         [SKIP][91] ([fdo#109289]) -> [SKIP][92] ([fdo#112172])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7983/shard-tglb2/igt@perf@unprivileged-single-ctx-counters.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/shard-tglb3/igt@perf@unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112172]: https://bugs.freedesktop.org/show_bug.cgi?id=112172
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#276]: https://gitlab.freedesktop.org/drm/intel/issues/276
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5458 -> IGTPW_4215
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7983: 85ccd7de7d75735a667c4133b0927481986a2a1c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4215: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/index.html
  IGT_5458: 5f7e4ae6a91ed2c104593b8abd5b71a6cc96fc10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4215/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
