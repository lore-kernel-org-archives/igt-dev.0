Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 15:21:38 -0000
Message-ID: <158100249856.15031.278413740566871718@emeril.freedesktop.org>
References: <20200204114837.887623-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200204114837.887623-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Delegate_exhaustive_fault-injection_to_the_idle_runs_=28r?=
 =?utf-8?q?ev2=29?=
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

Series: intel-ci: Delegate exhaustive fault-injection to the idle runs (rev2)
URL   : https://patchwork.freedesktop.org/series/70452/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7864_full -> IGTPW_4090_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4090_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4090_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4090_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb6/igt@gem_workarounds@suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb3/igt@gem_workarounds@suspend-resume.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7864_full and IGTPW_4090_full:

### New IGT tests (5) ###

  * igt@gem_ctx_sseu@engines:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ctx_sseu@ggtt-args:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@invalid-args:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@invalid-sseu:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_media_vme:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.04, 0.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_4090_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +10 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb3/igt@gem_exec_schedule@pi-userfault-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +17 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([i915#478])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-snb1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#694]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw1/igt@gen7_exec_parse@basic-offset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-hsw2/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#413])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1140])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#129])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#129])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-apl3/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#96])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms-interruptible:
    - shard-hsw:          [PASS][35] -> [DMESG-WARN][36] ([i915#44])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw1/igt@kms_flip@2x-flip-vs-dpms-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-hsw5/igt@kms_flip@2x-flip-vs-dpms-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [PASS][37] -> [INCOMPLETE][38] ([i915#82])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@kms_flip@flip-vs-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-snb1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#49])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#49])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#49])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#56])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-iclb:         [PASS][47] -> [INCOMPLETE][48] ([i915#123])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][49] -> [DMESG-WARN][50] ([i915#180]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb8/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#180]) +7 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +13 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-snb:          [DMESG-WARN][61] ([i915#478]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_mmap_gtt@big-copy-odd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-snb5/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][63] ([i915#694]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-apl3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][67] ([i915#818]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_tiled_blits@normal.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870] / [i915#478]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][71] ([i915#725]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@i915_selftest@live_blt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-hsw8/igt@i915_selftest@live_blt.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][73] ([i915#1140]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl3/igt@kms_flip@flip-vs-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-kbl6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][79] ([i915#899]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][83] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][85] ([i915#831]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][87] ([fdo#109276]) -> [PASS][88] +23 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][89] ([fdo#112080]) -> [FAIL][90] ([IGT#28])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4090
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7864: 5a140e2fc771e4c8b10d14e2db7bfb4996ee9d8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4090: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
