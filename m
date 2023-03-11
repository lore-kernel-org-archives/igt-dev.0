Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4077334727608462831=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Sat, 11 Mar 2023 06:59:41 -0000
Message-ID: <167851798178.29627.15835662090325242558@emeril.freedesktop.org>
References: <20230309141940.714569-1-vikas.srivastava@intel.com>
In-Reply-To: <20230309141940.714569-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_skip_gem=5Fset=5Fcaching_call_for_mtl_=28rev2=29?=
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

--===============4077334727608462831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915: skip gem_set_caching call for mtl (rev2)
URL   : https://patchwork.freedesktop.org/series/114544/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12831_full -> IGTPW_8583_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8583_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8583_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8583_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_reloc@basic-cpu-active:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl7/igt@gem_exec_reloc@basic-cpu-active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl1/igt@gem_exec_reloc@basic-cpu-active.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate}:
    - {shard-dg1}:        NOTRUN -> [SKIP][3] +187 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-dg1-12/igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in IGTPW_8583_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-10:      NOTRUN -> [SKIP][4] ([i915#7697])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-10:      NOTRUN -> [SKIP][5] ([i915#5325])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-10:      NOTRUN -> [SKIP][6] ([i915#6335])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-tglu-10:      NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglu-10:      NOTRUN -> [SKIP][10] ([fdo#109313])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-10:      NOTRUN -> [SKIP][11] ([i915#2190])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu-10:      NOTRUN -> [SKIP][12] ([i915#4613])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglu-10:      NOTRUN -> [SKIP][13] ([i915#4270]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglu-10:      NOTRUN -> [SKIP][14] ([fdo#109312])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-tglu-10:      NOTRUN -> [SKIP][15] ([fdo#109289]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][16] -> [ABORT][17] ([i915#5566])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-glk2/igt@gen9_exec_parse@allowed-single.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-glk6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu-10:      NOTRUN -> [SKIP][18] ([i915#2527] / [i915#2856])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-tglu-10:      NOTRUN -> [SKIP][19] ([i915#7561])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-tglu-10:      NOTRUN -> [FAIL][20] ([i915#3825])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-10:      NOTRUN -> [SKIP][21] ([fdo#111644] / [i915#1397])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu-10:      NOTRUN -> [SKIP][22] ([i915#5286]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-tglu-10:      NOTRUN -> [SKIP][23] ([fdo#111614]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][24] ([fdo#111615]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +15 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl1/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][27] ([i915#3689] / [i915#3886])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][28] ([fdo#111615] / [i915#3689]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][29] ([i915#6095])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][30] ([i915#3689] / [i915#6095]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][31] ([i915#3689]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-tglu-10:      NOTRUN -> [SKIP][32] ([fdo#111827]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu-10:      NOTRUN -> [SKIP][33] ([i915#7828]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [FAIL][34] ([i915#315] / [i915#6946]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][35] ([i915#3116] / [i915#3299])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglu-10:      NOTRUN -> [SKIP][36] ([i915#3555]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu-10:      NOTRUN -> [SKIP][37] ([i915#3359])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu-10:      NOTRUN -> [SKIP][38] ([fdo#109274]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglu-10:      NOTRUN -> [SKIP][39] ([i915#426])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu-10:      NOTRUN -> [SKIP][40] ([fdo#109274] / [i915#3637]) +5 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][41] -> [ABORT][42] ([i915#180])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl4/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-10:      NOTRUN -> [SKIP][43] ([i915#2587] / [i915#2672]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [PASS][44] -> [DMESG-WARN][45] ([i915#1982])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglu-10:      NOTRUN -> [SKIP][47] ([fdo#110189]) +19 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-tglu-10:      NOTRUN -> [SKIP][48] ([fdo#109280]) +24 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#1188])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][51] ([i915#5176]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-10:      NOTRUN -> [SKIP][52] ([i915#658]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@v3d/v3d_perfmon@destroy-invalid-perfmon:
    - shard-tglu-10:      NOTRUN -> [SKIP][53] ([fdo#109315] / [i915#2575]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html

  * igt@vc4/vc4_tiling@set-bad-flags:
    - shard-tglu-10:      NOTRUN -> [SKIP][54] ([i915#2575]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@vc4/vc4_tiling@set-bad-flags.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-block:
    - {shard-rkl}:        [SKIP][55] ([i915#4098]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-5/igt@drm_read@short-buffer-block.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@drm_read@short-buffer-block.html

  * igt@fbdev@pan:
    - {shard-rkl}:        [SKIP][57] ([i915#2582]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@fbdev@pan.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@fbdev@pan.html

  * igt@gem_exec_reloc@basic-write-read:
    - {shard-rkl}:        [SKIP][59] ([i915#3281]) -> [PASS][60] +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_mmap_gtt@coherency:
    - {shard-rkl}:        [SKIP][61] ([fdo#111656]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-2/igt@gem_mmap_gtt@coherency.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pwrite@basic-self:
    - {shard-rkl}:        [SKIP][63] ([i915#3282]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-1/igt@gem_pwrite@basic-self.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@gem_pwrite@basic-self.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - {shard-rkl}:        [SKIP][65] ([i915#2527]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-rkl}:        [WARN][67] ([i915#2681]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-dg1}:        [SKIP][69] ([i915#1397]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_suspend@debugfs-reader:
    - {shard-rkl}:        [FAIL][71] ([fdo#103375]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@i915_suspend@debugfs-reader.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - {shard-tglu}:       [SKIP][73] ([i915#1845]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-tglu-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - {shard-tglu}:       [SKIP][75] ([i915#1849]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - {shard-rkl}:        [SKIP][77] ([i915#1849] / [i915#4098]) -> [PASS][78] +14 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_plane@plane-panning-top-left@pipe-a-planes:
    - {shard-rkl}:        [SKIP][79] ([i915#1849]) -> [PASS][80] +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html

  * igt@kms_psr@primary_blt:
    - {shard-rkl}:        [SKIP][81] ([i915#1072]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@kms_psr@primary_blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@kms_psr@primary_blt.html

  * igt@kms_rotation_crc@exhaust-fences:
    - {shard-rkl}:        [SKIP][83] ([i915#1845] / [i915#4098]) -> [PASS][84] +25 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-5/igt@kms_rotation_crc@exhaust-fences.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_vblank@pipe-d-query-forked:
    - {shard-tglu}:       [SKIP][85] ([i915#1845] / [i915#7651]) -> [PASS][86] +12 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-tglu-6/igt@kms_vblank@pipe-d-query-forked.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-3/igt@kms_vblank@pipe-d-query-forked.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - {shard-dg1}:        [FAIL][87] ([i915#5234]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@prime_vgem@basic-fence-read:
    - {shard-rkl}:        [SKIP][89] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@prime_vgem@basic-fence-read.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@prime_vgem@basic-fence-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8151]: https://gitlab.freedesktop.org/drm/intel/issues/8151
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8154]: https://gitlab.freedesktop.org/drm/intel/issues/8154
  [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8273]: https://gitlab.freedesktop.org/drm/intel/issues/8273
  [i915#8275]: https://gitlab.freedesktop.org/drm/intel/issues/8275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7188 -> IGTPW_8583
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12831: 4910ebea52abc05f63bfc43bc91baebd8af93d45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html
  IGT_7188: b35bfa32fe672d67ced8555557e3e707ace211ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html

--===============4077334727608462831==
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
<tr><td><b>Series:</b></td><td>tests/i915: skip gem_set_caching call for mtl (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114544/">https://patchwork.freedesktop.org/series/114544/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12831_full -&gt; IGTPW_8583_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8583_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8583_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8583_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_reloc@basic-cpu-active:<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl7/igt@gem_exec_reloc@basic-cpu-active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl1/igt@gem_exec_reloc@basic-cpu-active.html">DMESG-WARN</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate}:<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-dg1-12/igt@xe/xe_exec_compute_mode@many-bindengine-userptr-invalidate.html">SKIP</a> +187 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8583_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109313">fdo#109313</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109312">fdo#109312</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-glk2/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-glk6/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3825">i915#3825</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl1/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-a-bad-pixel-format-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_color@ctm-0-25@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/315">i915#315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6946">i915#6946</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/426">i915#426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl4/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@destroy-invalid-perfmon:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-bad-flags:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-10/igt@vc4/vc4_tiling@set-bad-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-5/igt@drm_read@short-buffer-block.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@drm_read@short-buffer-block.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-2/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-1/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@gem_pwrite@basic-self.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@i915_suspend@debugfs-reader.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-1/igt@i915_suspend@debugfs-reader.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-tglu-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">PASS</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-a-planes.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_blt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@kms_psr@primary_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@kms_psr@primary_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-5/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html">PASS</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-tglu-6/igt@kms_vblank@pipe-d-query-forked.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-tglu-3/igt@kms_vblank@pipe-d-query-forked.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#5234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/shard-rkl-4/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/shard-rkl-5/igt@prime_vgem@basic-fence-read.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7188 -&gt; IGTPW_8583</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12831: 4910ebea52abc05f63bfc43bc91baebd8af93d45 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8583: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8583/index.html<br />
  IGT_7188: b35bfa32fe672d67ced8555557e3e707ace211ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4077334727608462831==--
