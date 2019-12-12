Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 03:46:45 -0000
Message-ID: <157612240551.32007.14724333954396500866@emeril.freedesktop.org>
References: <20191211141054.21455-1-anshuman.gupta@intel.com>
In-Reply-To: <20191211141054.21455-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Fix_uevent_subtest?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: Fix uevent subtest
URL   : https://patchwork.freedesktop.org/series/70773/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7543_full -> IGTPW_3847_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3847_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3847_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3847_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@bonded-slice:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl1/igt@gem_exec_balancer@bonded-slice.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-kbl7/igt@gem_exec_balancer@bonded-slice.html
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb4/igt@gem_exec_balancer@bonded-slice.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_3847_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#435])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb1/igt@gem_busy@close-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb6/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@vcs0-s3:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl1/igt@gem_ctx_isolation@vcs0-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-apl4/igt@gem_ctx_isolation@vcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-cleanup:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [fdo#112080])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb4/igt@gem_ctx_persistence@vcs1-cleanup.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb5/igt@gem_ctx_persistence@vcs1-cleanup.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#111735])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb8/igt@gem_ctx_shared@q-smoketest-vebox.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb4/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          [PASS][13] -> [FAIL][14] ([i915#232])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb4/igt@gem_eio@unwedge-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_schedule@fifo-bsd2:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@gem_exec_schedule@fifo-bsd2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb8/igt@gem_exec_schedule@fifo-bsd2.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-snb7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_wait@await-vcs1:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#112080]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@gem_wait@await-vcs1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb8/igt@gem_wait@await-vcs1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#454])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#435] / [i915#460])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb7/igt@i915_pm_rpm@system-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb7/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_color@pipe-b-degamma:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#71])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl8/igt@kms_color@pipe-b-degamma.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-apl3/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#460] / [i915#516])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb6/igt@kms_flip@flip-vs-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#456] / [i915#460] / [i915#474]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#474] / [i915#667])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([fdo#103665] / [i915#648] / [i915#667])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [fdo#112080]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb3/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_parallel@basic:
    - shard-tglb:         [INCOMPLETE][43] ([i915#476]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb3/igt@gem_exec_parallel@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb9/igt@gem_exec_parallel@basic.html

  * {igt@gem_exec_schedule@pi-distinct-iova-bsd}:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [INCOMPLETE][49] ([fdo#103665]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-snb:          [TIMEOUT][51] ([i915#530]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][53] ([i915#644]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][55] ([fdo#110789] / [fdo#111870]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][57] ([i915#447]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-apl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +6 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][63] ([i915#460]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb9/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:
    - shard-tglb:         [INCOMPLETE][65] ([fdo#112393] / [i915#667]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][67] ([i915#79]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [INCOMPLETE][69] ([i915#474] / [i915#667]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb7/igt@kms_psr@psr2_sprite_plane_onoff.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][75] ([i915#31]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-apl3/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-apl2/igt@kms_setmode@basic.html
    - shard-hsw:          [FAIL][77] ([i915#31]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-hsw2/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-hsw7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][79] ([i915#456] / [i915#460]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-idle-check-all-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb3/igt@perf_pmu@busy-idle-check-all-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb4/igt@perf_pmu@busy-idle-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][83] ([fdo#109276]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112393]: https://bugs.freedesktop.org/show_bug.cgi?id=112393
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5345 -> IGTPW_3847
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7543: 91752f80df9b582561be6bbac12ef780b12f606c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3847: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/index.html
  IGT_5345: 9e0c82b6d70065db894ececf2be8de372e983cf0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3847/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
