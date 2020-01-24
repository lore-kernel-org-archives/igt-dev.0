Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 04:52:43 -0000
Message-ID: <157984156376.15090.8969442845305927662@emeril.freedesktop.org>
References: <20200123002517.31327-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200123002517.31327-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fschedule=3A_Use_mmap=5F=5Fdevice=5Fcoherent?=
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
To: vbelgaum <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_schedule: Use mmap__device_coherent
URL   : https://patchwork.freedesktop.org/series/72436/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7799_full -> IGTPW_3974_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/index.html

Known issues
------------

  Here are the changes found in IGTPW_3974_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +16 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([fdo#103665] / [i915#530] / [i915#640])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([fdo#103665])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [PASS][17] -> [INCOMPLETE][18] ([i915#61]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw6/igt@gem_persistent_relocs@forked-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-hsw6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#874])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw6/igt@gem_pipe_control_store_loop@reused-buffer.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-hsw5/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#818])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw1/igt@gem_tiled_blits@normal.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([fdo#111870] / [i915#478]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#413])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@i915_pm_rps@reset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#79])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#49]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +9 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#140])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][39] ([fdo#109276] / [fdo#112080]) -> [PASS][40] +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-glk:          [FAIL][41] ([i915#679]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk6/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-glk9/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][43] ([i915#232]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb4/igt@gem_eio@reset-stress.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-snb2/igt@gem_eio@reset-stress.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][45] ([fdo#112080]) -> [PASS][46] +14 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +20 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@normal:
    - shard-glk:          [DMESG-WARN][53] ([i915#118] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk4/igt@gem_exec_whisper@normal.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-glk1/igt@gem_exec_whisper@normal.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-snb:          [DMESG-WARN][55] ([i915#478]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb5/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-snb2/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [INCOMPLETE][57] ([fdo#103927] / [i915#970]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-glk:          [INCOMPLETE][59] ([i915#58] / [i915#970] / [k.org#198133]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-glk5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-kbl:          [INCOMPLETE][61] ([fdo#103665] / [i915#970]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [INCOMPLETE][63] ([i915#530] / [i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [INCOMPLETE][65] ([fdo#103665]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl2/igt@gem_persistent_relocs@forked-thrashing.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-kbl3/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][67] ([i915#644]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][69] ([i915#454]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [INCOMPLETE][71] ([fdo#103927]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl7/igt@i915_selftest@mock_requests.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-apl4/igt@i915_selftest@mock_requests.html
    - shard-hsw:          [INCOMPLETE][73] ([i915#61]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw2/igt@i915_selftest@mock_requests.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-hsw5/igt@i915_selftest@mock_requests.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [FAIL][75] ([i915#49]) -> [PASS][76] +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][79] ([i915#31]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl6/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-hsw:          [INCOMPLETE][83] ([i915#61]) -> [INCOMPLETE][84] ([i915#530] / [i915#61])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][85] ([i915#694]) -> [FAIL][86] ([i915#818])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][87] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][88] ([fdo#110789] / [fdo#111870] / [i915#478])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][89] ([fdo#107724]) -> [SKIP][90] ([fdo#109349])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-tglb:         [FAIL][91] ([i915#49]) -> [FAIL][92] ([i915#160])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#160]: https://gitlab.freedesktop.org/drm/intel/issues/160
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#640]: https://gitlab.freedesktop.org/drm/intel/issues/640
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#874]: https://gitlab.freedesktop.org/drm/intel/issues/874
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#970]: https://gitlab.freedesktop.org/drm/intel/issues/970
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3974
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7799: 0f8a46a25a7781ef6ede604c9cb50f82cfb5e960 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3974: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3974/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
