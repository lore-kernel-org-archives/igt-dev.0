Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 19:13:47 -0000
Message-ID: <158196682780.16572.13631654961406241412@emeril.freedesktop.org>
References: <20200214130826.31004-1-matthew.auld@intel.com>
In-Reply-To: <20200214130826.31004-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fstore=3A_remove_hard_coded_engine_limit?=
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
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_store: remove hard coded engine limit
URL   : https://patchwork.freedesktop.org/series/73465/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7939_full -> IGTPW_4153_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4153_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4153_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4153_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-apl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-apl7/igt@gem_ctx_persistence@close-replace-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_4153_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][7] -> [TIMEOUT][8] ([fdo#112271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb1/igt@gem_exec_balancer@hang.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#559]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:
    - shard-tglb:         [PASS][19] -> [DMESG-FAIL][20] ([i915#402])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-x:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#778])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-a-tiling-x.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-a-tiling-x.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-kbl7/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#112080]) +10 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb4/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb7/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +16 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb8/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +7 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [FAIL][37] -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][39] ([fdo#109276]) -> [PASS][40] +20 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb7/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +7 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][45] ([i915#413]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb8/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-tglb:         [FAIL][47] ([i915#1172]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb3/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb1/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-tglb:         [FAIL][49] ([i915#1149]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb8/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb1/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-tglb:         [FAIL][51] ([fdo#111703]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-apl:          [FAIL][53] ([i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-glk:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-kbl:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
    - shard-tglb:         [FAIL][59] ([i915#559]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-kbl:          [FAIL][61] ([i915#34]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [SKIP][63] ([i915#668]) -> [PASS][64] +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglb:         [FAIL][65] ([i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb1/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb5/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-tglb:         [FAIL][67] ([i915#1183]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-tglb:         [FAIL][69] ([i915#1184]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][71] ([fdo#109642] / [fdo#111068]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-tglb:         [FAIL][75] ([i915#65]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][77] ([fdo#112080]) -> [PASS][78] +11 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][79] ([fdo#112080]) -> [FAIL][80] ([IGT#28])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][81] ([i915#818]) -> [FAIL][82] ([i915#694])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][83] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][84] ([fdo#111870] / [i915#478])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][85] ([i915#468]) -> [FAIL][86] ([i915#454])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [INCOMPLETE][88] ([i915#82])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb2/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][89], [FAIL][90], [FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97]) ([fdo#111870] / [i915#1077] / [i915#698] / [i915#974]) -> ([FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104]) ([fdo#111870] / [i915#1077] / [i915#974])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb6/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb4/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb5/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb2/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb5/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb4/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb6/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7939/shard-snb2/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb4/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb4/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb5/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb2/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1183]: https://gitlab.freedesktop.org/drm/intel/issues/1183
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#778]: https://gitlab.freedesktop.org/drm/intel/issues/778
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5441 -> IGTPW_4153
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7939: cceb0c30a34af6ca96e35211ecdc5ca198d44e7e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4153: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/index.html
  IGT_5441: 534ca091fe4ffed916752165bc5becd7ff56cd84 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4153/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
