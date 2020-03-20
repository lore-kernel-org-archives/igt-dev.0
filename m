Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 21:52:05 -0000
Message-ID: <158474112521.11038.10754129832038640603@emeril.freedesktop.org>
References: <20200320153623.4780-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200320153623.4780-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBG?=
 =?utf-8?q?ix_device_lists_not_cleaned_up_sufficiently_before_rescan?=
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

Series: lib: Fix device lists not cleaned up sufficiently before rescan
URL   : https://patchwork.freedesktop.org/series/74929/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8166_full -> IGTPW_4336_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4336_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4336_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4336_full:

### IGT changes ###

#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][1] ([i915#478]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4336_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +16 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#1402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [PASS][7] -> [INCOMPLETE][8] ([fdo#103927] / [i915#1402])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl7/igt@gem_ctx_persistence@close-replace-race.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110841])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-hsw:          [PASS][19] -> [DMESG-WARN][20] ([i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw7/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-hsw1/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-hsw7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-hsw:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw6/igt@i915_pm_rpm@drm-resources-equal.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-hsw1/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#1316])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb8/igt@i915_pm_rpm@drm-resources-equal.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb7/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-glk:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-glk4/igt@i915_pm_rpm@drm-resources-equal.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-glk9/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#1316])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb7/igt@i915_pm_rpm@drm-resources-equal.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-tglb7/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-snb:          [PASS][31] -> [DMESG-WARN][32] ([i915#478])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][35] -> [INCOMPLETE][36] ([i915#155]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109642] / [fdo#111068])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb5/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([fdo#103375])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109276]) +19 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb7/igt@gem_busy@extended-parallel-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb2/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [INCOMPLETE][49] ([i915#1402]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb5/igt@gem_ctx_persistence@close-replace-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [i915#677]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +23 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-hsw:          [DMESG-WARN][59] ([i915#478]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw4/igt@gem_mmap_gtt@basic-small-copy-odd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-hsw6/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][61] ([i915#644]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][63] ([i915#644]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][65] ([fdo#111870]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-apl:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][73] ([i915#155]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][75] ([i915#899]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_sequence@queue-idle:
    - shard-glk:          [INCOMPLETE][79] ([i915#58] / [k.org#198133]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-glk9/igt@kms_sequence@queue-idle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-glk4/igt@kms_sequence@queue-idle.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][81] ([fdo#112015]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][83] ([fdo#109278]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@prime_busy@hang-bsd2:
    - shard-tglb:         [INCOMPLETE][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb6/igt@prime_busy@hang-bsd2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-tglb5/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][87] ([i915#588]) -> [SKIP][88] ([i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][89] ([i915#454]) -> [SKIP][90] ([i915#468])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][91] ([i915#468]) -> [FAIL][92] ([i915#454])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][93] ([fdo#109506]) -> [SKIP][94] ([i915#1316])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][95] ([fdo#109293] / [fdo#109506]) -> [SKIP][96] ([i915#1316])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][97], [FAIL][98]) ([fdo#103927] / [i915#529]) -> ([FAIL][99], [FAIL][100]) ([fdo#103927] / [i915#1402])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl4/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl1/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-apl6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-apl4/igt@runner@aborted.html
    - shard-snb:          ([FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108]) ([fdo#111870] / [i915#1077] / [i915#1485]) -> ([FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115]) ([fdo#111870] / [i915#1077] / [i915#1485] / [i915#698])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb2/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb4/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb5/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-snb4/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-snb6/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-snb4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-snb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-snb4/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-snb4/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/shard-snb4/igt@runner@aborted.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5526 -> IGTPW_4336
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8166: 424db30dffb5504090c2b8ea4a387d6c358bbc50 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4336: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/index.html
  IGT_5526: f49ebeee9f54d6f23c60a842f75f65561d452ab0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4336/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
