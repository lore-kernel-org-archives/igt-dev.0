Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 02:55:12 -0000
Message-ID: <157611931210.32009.7813612595905171078@emeril.freedesktop.org>
References: <20191211164838.137117-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191211164838.137117-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fparse=3A_Check_batch=5Fstart=5Foffset?=
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

Series: i915/gem_exec_parse: Check batch_start_offset
URL   : https://patchwork.freedesktop.org/series/70772/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7543_full -> IGTPW_3846_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3846_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_parse@basic-offset} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb1/igt@gem_exec_parse@basic-offset.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb1/igt@gem_exec_parse@basic-offset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7543_full and IGTPW_3846_full:

### New IGT tests (1) ###

  * igt@gem_exec_parse@basic-offset:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_3846_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@gem_ctx_isolation@vcs1-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb7/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([fdo#111735])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb9/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#435])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb1/igt@gem_exec_nop@basic-parallel.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb4/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb3/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html

  * igt@gem_mmap_gtt@hang:
    - shard-snb:          [PASS][15] -> [INCOMPLETE][16] ([i915#82])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb5/igt@gem_mmap_gtt@hang.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-snb2/igt@gem_mmap_gtt@hang.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#520])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-hsw8/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-hsw1/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#644])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl2/igt@gem_softpin@noreloc-s3.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#435] / [i915#472])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb8/igt@gem_sync@basic-store-each.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb3/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([fdo#111870]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_wait@await-vcs1:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#112080]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@gem_wait@await-vcs1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb7/igt@gem_wait@await-vcs1.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-iclb:         [PASS][31] -> [DMESG-WARN][32] ([fdo#111764])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb8/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#456] / [i915#460]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb9/igt@i915_suspend@debugfs-reader.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#460] / [i915#516])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb6/igt@kms_flip@flip-vs-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#140])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#49]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([fdo#103665] / [i915#648] / [i915#667])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl6/igt@kms_plane@pixel-format-pipe-a-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-kbl2/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#576])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb4/igt@kms_plane@pixel-format-pipe-b-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb3/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb1/igt@kms_psr@psr2_dpms.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb3/igt@gem_busy@extended-parallel-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb2/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [fdo#112080]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb7/igt@gem_ctx_isolation@vcs1-clean.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_exec_parallel@basic:
    - shard-tglb:         [INCOMPLETE][51] ([i915#476]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb3/igt@gem_exec_parallel@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb7/igt@gem_exec_parallel@basic.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [INCOMPLETE][55] ([fdo#103665]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-snb:          [TIMEOUT][57] ([i915#530]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][59] ([i915#644]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][61] ([fdo#110789] / [fdo#111870]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][63] ([fdo#111870]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [INCOMPLETE][65] ([i915#455]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb3/igt@i915_selftest@live_gt_timelines.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb7/igt@i915_selftest@live_gt_timelines.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-apl8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:
    - shard-tglb:         [INCOMPLETE][69] ([fdo#112393] / [i915#667]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb9/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][71] ([i915#79]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [INCOMPLETE][73] ([i915#474] / [i915#667]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +5 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][79] ([i915#31]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl3/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][81] ([i915#456] / [i915#460]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][83] ([fdo#109276]) -> [PASS][84] +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs2-nonpriv:
    - shard-tglb:         [SKIP][85] ([fdo#111912] / [fdo#112080]) -> [SKIP][86] ([fdo#112080])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb7/igt@gem_ctx_isolation@vcs2-nonpriv.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/shard-tglb9/igt@gem_ctx_isolation@vcs2-nonpriv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112393]: https://bugs.freedesktop.org/show_bug.cgi?id=112393
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#576]: https://gitlab.freedesktop.org/drm/intel/issues/576
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5345 -> IGTPW_3846
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7543: 91752f80df9b582561be6bbac12ef780b12f606c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3846: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/index.html
  IGT_5345: 9e0c82b6d70065db894ececf2be8de372e983cf0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3846/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
