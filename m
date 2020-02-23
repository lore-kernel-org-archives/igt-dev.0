Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 23 Feb 2020 02:09:34 -0000
Message-ID: <158242377443.14520.1075404678463333143@emeril.freedesktop.org>
References: <20200220165721.2056191-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200220165721.2056191-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc3dfc3lu?=
 =?utf-8?q?c=3A_Use_fixed_runtime_for_sync=5Fexpired=5Fmerge?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: sw_sync: Use fixed runtime for sync_expired_merge
URL   : https://patchwork.freedesktop.org/series/73724/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7975_full -> IGTPW_4201_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4201_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4201_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4201_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@close-race:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb4/igt@gem_busy@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb2/igt@gem_busy@close-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_4201_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@read-writes:
    - shard-hsw:          [PASS][3] -> [FAIL][4] ([i915#694])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-hsw2/igt@gem_caching@read-writes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-hsw5/igt@gem_caching@read-writes.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-apl3/igt@gem_ctx_isolation@vecs0-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-apl6/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +21 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([i915#478]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-snb1/igt@gem_mmap_gtt@medium-copy-xy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-snb6/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#818])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#447])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#413])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb6/igt@i915_pm_rps@reset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-hsw7/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-hsw7/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-tglb:         [PASS][25] -> [TIMEOUT][26] ([fdo#112271] / [i915#561])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-tglb8/igt@kms_flip@flip-vs-panning-vs-hang.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-tglb2/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb8/igt@kms_psr@psr2_dpms.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [TIMEOUT][30] ([fdo#112271] / [i915#1085])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-tglb5/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#112080]) +10 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][33] ([fdo#112080]) -> [PASS][34] +9 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][35] ([fdo#110854]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd2}:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [i915#677]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb5/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][39] ([i915#677]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][41] ([fdo#109276]) -> [PASS][42] +23 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * {igt@gem_exec_whisper@basic-queues-forked}:
    - shard-iclb:         [INCOMPLETE][47] ([i915#1120]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][53] ([i915#694]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-hsw7/igt@gem_tiled_blits@normal.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][55] ([fdo#111870] / [i915#478]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [INCOMPLETE][57] ([fdo#103665]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-kbl1/igt@gem_workarounds@suspend-resume-context.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][59] ([i915#454]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_buddy:
    - shard-apl:          [TIMEOUT][61] ([fdo#112271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-apl6/igt@i915_selftest@mock_buddy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-apl1/igt@i915_selftest@mock_buddy.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [FAIL][63] ([i915#129]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [FAIL][65] ([i915#129]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-apl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-apl8/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-apl:          [FAIL][67] ([i915#54]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][71] ([i915#54]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@flip-vs-panning:
    - shard-kbl:          [DMESG-WARN][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-kbl3/igt@kms_flip@flip-vs-panning.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-kbl6/igt@kms_flip@flip-vs-panning.html
    - shard-apl:          [DMESG-WARN][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-apl2/igt@kms_flip@flip-vs-panning.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-apl8/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-apl1/igt@kms_flip@flip-vs-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-apl7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][79] ([i915#49]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-tglb:         [SKIP][81] ([i915#668]) -> [PASS][82] +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][83] ([i915#899]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][87] ([fdo#112271] / [i915#727]) -> [TIMEOUT][88] ([fdo#112271]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/shard-kbl3/igt@kms_content_protection@atomic-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4201
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7975: f66891f7bdc3c60bb6f06fd6bc0718a0bd975896 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4201: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4201/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
