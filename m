Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 22:43:59 -0000
Message-ID: <158197943950.16571.9027092881177733518@emeril.freedesktop.org>
References: <20200214165502.21990-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200214165502.21990-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_Speed_up_by_not_testing_every_format?=
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_rotation_crc: Speed up by not testing every format
URL   : https://patchwork.freedesktop.org/series/73478/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7941_full -> IGTPW_4155_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4155_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4155_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4155_full:

### IGT changes ###

#### Possible regressions ####

  * igt@prime_vgem@basic-sync-default:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb8/igt@prime_vgem@basic-sync-default.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb6/igt@prime_vgem@basic-sync-default.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb3/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb7/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-glk7/igt@gem_ctx_persistence@close-replace-race.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_4155_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-hsw2/igt@gem_caching@reads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-hsw2/igt@gem_caching@reads.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_await@wide-contexts:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([fdo#111736])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb5/igt@gem_exec_await@wide-contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb7/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][15] -> [TIMEOUT][16] ([fdo#112271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb3/igt@gem_exec_balancer@hang.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112080]) +14 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#677]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109276]) +16 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112146]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([fdo#111870] / [i915#478])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#402])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb8/igt@i915_pm_dc@dc5-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb8/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@modeset-stress-extra-wait:
    - shard-glk:          [PASS][29] -> [DMESG-WARN][30] ([i915#118] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-glk8/igt@i915_pm_rpm@modeset-stress-extra-wait.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-glk8/igt@i915_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([fdo#111703])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#54]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#54]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#559])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-tglb:         [PASS][41] -> [DMESG-FAIL][42] ([i915#402]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#79])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#79])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [PASS][47] -> [INCOMPLETE][48] ([i915#82])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb5/igt@kms_flip@flip-vs-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][49] -> [SKIP][50] ([i915#668]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#180]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#899])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-x:
    - shard-tglb:         [PASS][55] -> [FAIL][56] ([i915#778])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-a-tiling-x.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-a-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][57] -> [FAIL][58] ([i915#608])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb1/igt@kms_psr2_su@page_flip.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb6/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109642] / [fdo#111068])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][63] -> [FAIL][64] ([i915#31])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-apl6/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-apl6/igt@kms_setmode@basic.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][65] -> [INCOMPLETE][66] ([i915#1176] / [i915#61])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-hsw8/igt@perf_pmu@cpu-hotplug.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-hsw4/igt@perf_pmu@cpu-hotplug.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][67] ([fdo#110841]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][69] ([fdo#109276]) -> [PASS][70] +16 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][71] ([i915#677]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][73] ([fdo#112146]) -> [PASS][74] +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-hsw:          [FAIL][75] ([i915#694]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-hsw1/igt@gem_partial_pwrite_pread@write-display.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-hsw2/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-iclb:         [INCOMPLETE][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * {igt@kms_busy@basic@flip}:
    - shard-tglb:         [DMESG-WARN][85] ([i915#402]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb7/igt@kms_busy@basic@flip.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb5/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-tglb:         [FAIL][87] ([i915#70]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
    - shard-tglb:         [FAIL][89] ([i915#559]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [DMESG-WARN][91] ([i915#478]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][93] ([fdo#103665]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-tglb:         [FAIL][95] ([i915#1184]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-tglb8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@short-reads:
    - shard-hsw:          [TIMEOUT][99] ([fdo#112271] / [i915#51]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-hsw6/igt@perf@short-reads.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-hsw7/igt@perf@short-reads.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][101] ([fdo#112080]) -> [PASS][102] +8 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][103] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][104] ([fdo#111870] / [i915#478]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][105] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][106] ([fdo#110789] / [fdo#111870] / [i915#478])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-snb:          [SKIP][107] ([fdo#109271]) -> [INCOMPLETE][108] ([i915#82])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb2/igt@i915_pm_rpm@pm-tiling.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb7/igt@i915_pm_rpm@pm-tiling.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][109] ([i915#974]) -> ([FAIL][110], [FAIL][111]) ([i915#1176] / [i915#974])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-hsw8/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-hsw7/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-hsw4/igt@runner@aborted.html
    - shard-snb:          ([FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120]) ([fdo#111870] / [i915#1077] / [i915#698] / [i915#974]) -> ([FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128]) ([fdo#111870] / [i915#1077] / [i915#974])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb5/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb6/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb5/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb4/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb6/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7941/shard-snb6/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb5/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb5/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb2/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb4/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#778]: https://gitlab.freedesktop.org/drm/intel/issues/778
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5442 -> IGTPW_4155
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7941: c77a53006f446facee890cb72459da477c3c8f5f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4155: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/index.html
  IGT_5442: 3f6080996885b997685f08ecb8b416b2dc485290 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4155/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
