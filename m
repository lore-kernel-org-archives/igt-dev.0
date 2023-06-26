Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0055749822715287612=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 26 Jun 2023 13:08:13 -0000
Message-ID: <168778489338.5705.14482379421139797057@emeril.freedesktop.org>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgWEUgdGVz?=
 =?utf-8?q?t_cleanup_to_handle_xe=5Fdevice_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0055749822715287612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: XE test cleanup to handle xe_device (rev7)
URL   : https://patchwork.freedesktop.org/series/117263/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13320_full -> IGTPW_9253_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9253_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9253_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9253_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-apl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl7/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_madvise@dontneed-after-mmap:
    - {shard-mtlp}:       [PASS][2] -> [WARN][3] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-7/igt@gem_madvise@dontneed-after-mmap.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-5/igt@gem_madvise@dontneed-after-mmap.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - {shard-dg2}:        [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@perf_pmu@busy-check-all@rcs0:
    - {shard-mtlp}:       [PASS][6] -> [FAIL][7] +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-6/igt@perf_pmu@busy-check-all@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-2/igt@perf_pmu@busy-check-all@rcs0.html

  * igt@perf_pmu@busy-check-all@vcs1:
    - {shard-dg1}:        NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg1-12/igt@perf_pmu@busy-check-all@vcs1.html

  
Known issues
------------

  Here are the changes found in IGTPW_9253_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][9] -> [FAIL][10] ([i915#7742])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#280])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][12] -> [FAIL][13] ([fdo#103375]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-1/igt@gem_eio@in-flight-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][14] -> [FAIL][15] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2842]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-rkl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#3281])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#3282]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#4270])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#8411])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#3297])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-4/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#2527])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#7561])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-6/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][27] -> [SKIP][28] ([i915#1397]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#5286]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#5354] / [i915#6095]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#3689] / [i915#5354] / [i915#6095])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#3734] / [i915#5354] / [i915#6095])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#5354] / [i915#6095]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-9/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3886])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl4/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#5354]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#7828]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-6/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([fdo#111827])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#7828])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#4767])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3955])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([fdo#109274] / [i915#3637])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([fdo#111825]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#79])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([fdo#111825] / [i915#1825]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][47] ([fdo#109280]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][48] ([fdo#110189]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3023]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271]) +57 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271]) +33 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#3555] / [i915#4579])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4579] / [i915#6953] / [i915#8228])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][54] -> [FAIL][55] ([i915#8292])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#5176]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4579] / [i915#5176]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#5235]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#4579])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#4579]) +13 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4579] / [i915#5235]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#658])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@sprite_mmap_gtt:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#1072]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@kms_psr@sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4070] / [i915#6768]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_vblank@pipe-c-ts-continuation-modeset.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#4070] / [i915#533] / [i915#6768]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@perf@stress-open-close@0-rcs0:
    - shard-glk:          [PASS][66] -> [ABORT][67] ([i915#5213] / [i915#7941])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk7/igt@perf@stress-open-close@0-rcs0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk5/igt@perf@stress-open-close@0-rcs0.html

  * igt@v3d/v3d_submit_csd@bad-multisync-out-sync:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([fdo#109315] / [i915#2575])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-8/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html

  * igt@v3d/v3d_submit_csd@multiple-job-submission:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([fdo#109315])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@v3d/v3d_submit_csd@multiple-job-submission.html

  * igt@vc4/vc4_wait_bo@used-bo-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#2575]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-9/igt@vc4/vc4_wait_bo@used-bo-0ns.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#7711]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@gem_barrier_race@remote-request@rcs0:
    - {shard-dg1}:        [ABORT][72] ([i915#7461] / [i915#8234]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg1-17/igt@gem_barrier_race@remote-request@rcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg1-13/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_eio@reset-stress:
    - {shard-dg2}:        [FAIL][74] ([i915#5784]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-1/igt@gem_eio@reset-stress.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-5/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - {shard-dg1}:        [FAIL][76] ([i915#5784]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg1-19/igt@gem_eio@unwedge-stress.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [FAIL][78] ([i915#2842]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_whisper@basic-normal:
    - {shard-mtlp}:       [FAIL][80] ([i915#6363]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-3/igt@gem_exec_whisper@basic-normal.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-3/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-snb:          [ABORT][82] ([i915#5161]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-x.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [ABORT][84] ([i915#5566]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-apl3/igt@gen9_exec_parse@allowed-single.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_hangman@detector@vcs0:
    - {shard-mtlp}:       [FAIL][86] ([i915#8456]) -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-8/igt@i915_hangman@detector@vcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - {shard-mtlp}:       [FAIL][88] ([i915#7069]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-2/igt@i915_hangman@engine-engine-error@vcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-8/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@ccs0:
    - {shard-mtlp}:       [DMESG-WARN][90] -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-idle@ccs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-idle@ccs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-dg2}:        [SKIP][92] ([i915#1397]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - {shard-dg1}:        [SKIP][94] ([i915#1397]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][96] ([i915#1397]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-glk:          [DMESG-FAIL][98] ([i915#5334]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk8/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_mocs:
    - {shard-mtlp}:       [DMESG-FAIL][100] ([i915#7059]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@slpc:
    - {shard-mtlp}:       [DMESG-WARN][102] ([i915#6367]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-7/igt@i915_selftest@live@slpc.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-1/igt@i915_selftest@live@slpc.html

  * igt@kms_atomic@plane-immutable-zpos:
    - {shard-dg2}:        [TIMEOUT][104] -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-7/igt@kms_atomic@plane-immutable-zpos.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-10/igt@kms_atomic@plane-immutable-zpos.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - {shard-mtlp}:       [FAIL][106] ([i915#3743]) -> [PASS][107] +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][108] ([i915#2346]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-rkl:          [INCOMPLETE][110] ([i915#8011]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-7/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - {shard-dg2}:        [FAIL][112] ([i915#6880]) -> [PASS][113] +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@perf@non-zero-reason@0-rcs0:
    - {shard-dg2}:        [FAIL][114] ([i915#7484]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - {shard-mtlp}:       [FAIL][116] ([i915#8553]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-5/igt@perf_pmu@rc6-all-gts.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-3/igt@perf_pmu@rc6-all-gts.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - {shard-mtlp}:       [FAIL][118] ([i915#6015]) -> [PASS][119] +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  
#### Warnings ####

  * igt@kms_content_protection@mei_interface:
    - shard-rkl:          [SKIP][120] ([i915#4579] / [i915#7118]) -> [SKIP][121] ([fdo#109300])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-4/igt@kms_content_protection@mei_interface.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_content_protection@mei_interface.html
    - shard-snb:          [SKIP][122] ([fdo#109271] / [i915#4579]) -> [SKIP][123] ([fdo#109271])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-snb2/igt@kms_content_protection@mei_interface.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-snb5/igt@kms_content_protection@mei_interface.html
    - shard-tglu:         [SKIP][124] ([i915#4579] / [i915#6944] / [i915#7116] / [i915#7118]) -> [SKIP][125] ([fdo#109300])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-tglu-2/igt@kms_content_protection@mei_interface.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-7/igt@kms_content_protection@mei_interface.html
    - shard-apl:          [SKIP][126] ([fdo#109271] / [i915#4579]) -> [SKIP][127] ([fdo#109271])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-apl4/igt@kms_content_protection@mei_interface.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl1/igt@kms_content_protection@mei_interface.html
    - shard-glk:          [SKIP][128] ([fdo#109271] / [i915#4579]) -> [SKIP][129] ([fdo#109271])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk7/igt@kms_content_protection@mei_interface.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk3/igt@kms_content_protection@mei_interface.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][130] ([fdo#109285] / [i915#4098]) -> [SKIP][131] ([fdo#109285])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#5161]: https://gitlab.freedesktop.org/drm/intel/issues/5161
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5793]: https://gitlab.freedesktop.org/drm/intel/issues/5793
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6363]: https://gitlab.freedesktop.org/drm/intel/issues/6363
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7327]: https://gitlab.freedesktop.org/drm/intel/issues/7327
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
  [i915#7507]: https://gitlab.freedesktop.org/drm/intel/issues/7507
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7916]: https://gitlab.freedesktop.org/drm/intel/issues/7916
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
  [i915#8553]: https://gitlab.freedesktop.org/drm/intel/issues/8553
  [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
  [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7348 -> IGTPW_9253
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13320: 405d048c3aa602273991afc895d1c1f56dbadfce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9253: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/index.html
  IGT_7348: feb4fdbcce1e53cb1d483aad3d5ec4ff41092359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/index.html

--===============0055749822715287612==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>XE test cleanup to handle xe_device (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117263/">https://patchwork.freedesktop.org/series/117263/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13320_full -&gt; IGTPW_9253_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9253_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9253_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/index.html</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9253_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl7/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_madvise@dontneed-after-mmap:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-7/igt@gem_madvise@dontneed-after-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-5/igt@gem_madvise@dontneed-after-mmap.html">WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>{shard-dg2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-check-all@rcs0:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-6/igt@perf_pmu@busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-2/igt@perf_pmu@busy-check-all@rcs0.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-check-all@vcs1:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg1-12/igt@perf_pmu@busy-check-all@vcs1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9253_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-5/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-1/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-4/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-6/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-9/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl4/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-6/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-dp-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@kms_psr@sprite_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_vblank@pipe-c-ts-continuation-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close@0-rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk7/igt@perf@stress-open-close@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk5/igt@perf@stress-open-close@0-rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-out-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-8/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@multiple-job-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@v3d/v3d_submit_csd@multiple-job-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-9/igt@vc4/vc4_wait_bo@used-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-6/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg1-17/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8234">i915#8234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg1-13/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-1/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-5/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg1-19/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg1-18/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-3/igt@gem_exec_whisper@basic-normal.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-3/igt@gem_exec_whisper@basic-normal.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-x.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5161">i915#5161</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-apl3/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl2/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-8/igt@i915_hangman@detector@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8456">i915#8456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-2/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-8/igt@i915_hangman@engine-engine-error@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@ccs0:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-idle@ccs0.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-idle@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-dg2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-1/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk8/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-7/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-immutable-zpos:</p>
<ul>
<li>{shard-dg2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-7/igt@kms_atomic@plane-immutable-zpos.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-10/igt@kms_atomic@plane-immutable-zpos.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-7/igt@kms_cursor_legacy@single-bo@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-2/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>{shard-dg2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>{shard-dg2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7484">i915#7484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-5/igt@perf_pmu@rc6-all-gts.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8553">i915#8553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-3/igt@perf_pmu@rc6-all-gts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>{shard-mtlp}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-4/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-4/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-snb2/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-snb5/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-tglu-2/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-tglu-7/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-apl4/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-apl1/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-glk7/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-glk3/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13320/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7348 -&gt; IGTPW_9253</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13320: 405d048c3aa602273991afc895d1c1f56dbadfce @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9253: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9253/index.html<br />
  IGT_7348: feb4fdbcce1e53cb1d483aad3d5ec4ff41092359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0055749822715287612==--
