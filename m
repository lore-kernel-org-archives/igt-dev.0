Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Feb 2020 15:32:37 -0000
Message-ID: <158134875766.3100.5036394427549617640@emeril.freedesktop.org>
References: <20200207134527.17205-1-ramalingam.c@intel.com>
In-Reply-To: <20200207134527.17205-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/intel=5Fdp=5Fcompli?=
 =?utf-8?q?ance=3A_use_device_coherent_mapping_instead_of_mmap=5Fgtt?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/intel_dp_compliance: use device coherent mapping instead of mmap_gtt
URL   : https://patchwork.freedesktop.org/series/73148/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7886_full -> IGTPW_4113_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4113_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4113_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4113_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-kbl4/igt@gem_mmap_gtt@basic-small-copy-odd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-kbl6/igt@gem_mmap_gtt@basic-small-copy-odd.html

  
Known issues
------------

  Here are the changes found in IGTPW_4113_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@promotion-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb8/igt@gem_exec_schedule@promotion-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb2/igt@gem_exec_schedule@promotion-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([fdo#111870] / [i915#478])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-apl8/igt@gem_workarounds@suspend-resume-context.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][15] -> [DMESG-FAIL][16] ([i915#725])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-hsw5/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-hsw8/igt@i915_selftest@live_blt.html

  * igt@kms_color@pipe-a-ctm-negative:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#1149])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb7/igt@kms_color@pipe-a-ctm-negative.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb1/igt@kms_color@pipe-a-ctm-negative.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1173])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#559]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:
    - shard-tglb:         [PASS][23] -> [DMESG-FAIL][24] ([i915#402])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#668])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#899])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb3/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#31])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-apl8/igt@kms_setmode@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-apl6/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +21 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [TIMEOUT][37] ([fdo#112271]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb8/igt@gem_exec_balancer@hang.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][39] ([i915#677]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][43] ([fdo#109276]) -> [PASS][44] +18 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-hsw:          [FAIL][45] ([i915#694]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-hsw7/igt@gem_partial_pwrite_pread@write-uncached.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-hsw5/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [DMESG-WARN][49] ([i915#402]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb8/igt@i915_pm_dc@dc5-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb7/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][51] ([i915#413]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb6/igt@i915_pm_rps@reset.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180:
    - shard-tglb:         [DMESG-FAIL][53] ([i915#402]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-tglb:         [FAIL][55] ([fdo#111703]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
    - shard-tglb:         [FAIL][59] ([i915#559]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-snb:          [DMESG-WARN][61] ([i915#478]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-snb4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [SKIP][63] ([i915#668]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-tglb:         [FAIL][65] ([i915#1183]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-tglb:         [FAIL][67] ([i915#1171]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb8/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb8/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-tglb:         [FAIL][69] ([i915#1184]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-tglb:         [FAIL][71] ([i915#1139]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb5/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-tglb:         [FAIL][73] ([i915#899]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb5/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb7/igt@kms_psr@psr2_basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][77] ([fdo#103665]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][79] ([i915#140]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][81] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +15 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][85] ([fdo#109349]) -> [DMESG-WARN][86] ([fdo#107724])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [DMESG-WARN][88] ([i915#180] / [i915#56])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-kbl7/igt@kms_flip@flip-vs-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-kbl4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [FAIL][89] ([fdo#103375]) -> [DMESG-WARN][90] ([i915#180])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1171]: https://gitlab.freedesktop.org/drm/intel/issues/1171
  [i915#1173]: https://gitlab.freedesktop.org/drm/intel/issues/1173
  [i915#1183]: https://gitlab.freedesktop.org/drm/intel/issues/1183
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5425 -> IGTPW_4113
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7886: c76da740823aa950e340a8e53758511680da79ca @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4113: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/index.html
  IGT_5425: ad4542ef1adbaa1227bc9ba9e24bb0e0f6dd408d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
