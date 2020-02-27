Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 Feb 2020 16:54:07 -0000
Message-ID: <158282244710.29656.7898805432432199559@emeril.freedesktop.org>
References: <20200227000925.16988-1-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200227000925.16988-1-akeem.g.abodunrin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU3VwcG9y?=
 =?utf-8?q?t_to_assemble_CB_kernel_for_gen7?=
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
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Support to assemble CB kernel for gen7
URL   : https://patchwork.freedesktop.org/series/73985/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8010_full -> IGTPW_4231_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4231_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4231_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4231_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@reorder-wide-blt:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb8/igt@gem_exec_schedule@reorder-wide-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb4/igt@gem_exec_schedule@reorder-wide-blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4231_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112146]) +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb7/igt@gem_exec_schedule@in-order-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-apl:          [PASS][7] -> [INCOMPLETE][8] ([fdo#103927]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl3/igt@gem_exec_whisper@basic-queues-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-apl2/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl2/igt@gem_workarounds@suspend-resume-context.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk4/igt@i915_pm_rpm@system-suspend-modeset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-glk3/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#1316])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb7/igt@i915_pm_rpm@system-suspend-modeset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb1/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#1316])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-tglb6/igt@i915_pm_rpm@system-suspend-modeset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-tglb5/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb5/igt@i915_pm_rps@reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-hsw:          [PASS][23] -> [INCOMPLETE][24] ([i915#61])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-hsw5/igt@kms_flip@plain-flip-ts-check.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-hsw7/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-kbl:          [PASS][25] -> [INCOMPLETE][26] ([fdo#103665])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-kbl1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#668]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#112080]) +11 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +18 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][39] ([fdo#110854]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd:
    - shard-iclb:         [SKIP][41] ([i915#677]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [INCOMPLETE][45] ([i915#1120]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb3/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-iclb:         [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [SKIP][51] ([i915#1316]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-tglb6/igt@i915_pm_rpm@pm-caching.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-tglb7/igt@i915_pm_rpm@pm-caching.html
    - shard-glk:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk2/igt@i915_pm_rpm@pm-caching.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-glk6/igt@i915_pm_rpm@pm-caching.html
    - shard-iclb:         [SKIP][55] ([i915#1316]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb3/igt@i915_pm_rpm@pm-caching.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb5/igt@i915_pm_rpm@pm-caching.html
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-hsw7/igt@i915_pm_rpm@pm-caching.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-hsw4/igt@i915_pm_rpm@pm-caching.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][67] ([i915#899]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][71] ([i915#31]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl3/igt@kms_setmode@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [PASS][74] +17 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb8/igt@perf_pmu@init-busy-vcs1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +13 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][77] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][78] ([fdo#111870] / [i915#478])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][79] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][80] ([fdo#111870])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-hsw7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][81] ([fdo#111644]) -> [SKIP][82] ([i915#1316])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][83] ([fdo#110892]) -> [SKIP][84] ([i915#1316])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][85] ([i915#1319] / [i915#727]) -> [TIMEOUT][86] ([i915#1319]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl2/igt@kms_content_protection@atomic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-kbl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][87] ([i915#1319]) -> [TIMEOUT][88] ([i915#1319] / [i915#727])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl3/igt@kms_content_protection@lic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][89] ([i915#1226]) -> [SKIP][90] ([fdo#109349])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5471 -> IGTPW_4231
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8010: 97bbec4d80df1c6573fc7063ad830e8beefe07c8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4231: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/index.html
  IGT_5471: 668afe52887a164ee6a12fd1c898bc1c9086cf3e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4231/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
