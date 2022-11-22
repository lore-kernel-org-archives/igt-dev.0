Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8630811737811346604=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 22 Nov 2022 23:43:01 -0000
Message-ID: <166916058121.2185.17889011092064153407@emeril.freedesktop.org>
References: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_remnants_in_i915_code?=
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

--===============8630811737811346604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm remnants in i915 code
URL   : https://patchwork.freedesktop.org/series/111200/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12417_full -> IGTPW_8142_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8142_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8142_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8142_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  
Known issues
------------

  Here are the changes found in IGTPW_8142_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#4525])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2846])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-glk2/igt@gem_exec_fair@basic-deadline.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([fdo#109283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-tglb:         NOTRUN -> [SKIP][11] ([fdo#109283])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb3/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_softpin@evict-single-offset:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#4171])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb8/igt@gem_softpin@evict-single-offset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb7/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#3297])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#2527] / [i915#2856])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb7/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#111644] / [i915#1397] / [i915#2411])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#110892])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4387])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb8/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4387])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][20] -> [DMESG-WARN][21] ([i915#5591])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-tglb6/igt@i915_selftest@live@hangcheck.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb8/igt@i915_selftest@live@hangcheck.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#3826])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#3826])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
    - shard-glk:          [PASS][24] -> [INCOMPLETE][25] ([i915#5584])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#5286]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#5286])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#110723])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#111615])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109278]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3689] / [i915#6095])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3886]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109278] / [i915#3886]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3689] / [i915#3886])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3886]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3689]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615] / [i915#3689])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-audio-edid:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl7/igt@kms_chamelium@dp-audio-edid.html
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-snb4/igt@kms_chamelium@dp-audio-edid.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_chamelium@dp-audio-edid.html
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk8/igt@kms_chamelium@dp-audio-edid.html

  * igt@kms_color_chamelium@ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb3/igt@kms_color_chamelium@ctm-limited-range.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109274] / [fdo#111825] / [i915#3637]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109274]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-iclb:         [PASS][47] -> [DMESG-WARN][48] ([i915#2867])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#2672]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#2587] / [i915#2672]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#2672] / [i915#3555])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-snb:          NOTRUN -> [SKIP][52] ([fdo#109271]) +37 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#2546])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-iclb:         [PASS][55] -> [FAIL][56] ([i915#2546])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#6497]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109280]) +8 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109280] / [fdo#111825]) +13 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109289])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#112054] / [i915#5288])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#3536]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb1/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#5235]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +39 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][65] -> [SKIP][66] ([i915#5235]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-tglb:         NOTRUN -> [FAIL][67] ([i915#132] / [i915#3467])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][68] -> [SKIP][69] ([fdo#109441]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#3555]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vblank@pipe-d-wait-busy-hang:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271]) +21 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk6/igt@kms_vblank@pipe-d-wait-busy-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3555]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb7/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2437])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@stress-open-close:
    - shard-apl:          [PASS][74] -> [INCOMPLETE][75] ([i915#5213])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl2/igt@perf@stress-open-close.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl6/igt@perf@stress-open-close.html

  
#### Possible fixes ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - {shard-rkl}:        [SKIP][76] ([i915#3281]) -> [PASS][77] +12 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@fbdev@unaligned-read:
    - {shard-rkl}:        [SKIP][78] ([i915#2582]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-4/igt@fbdev@unaligned-read.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@fbdev@unaligned-read.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][80] ([i915#658]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb3/igt@feature_discovery@psr2.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][82] ([i915#6268]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-tglb8/igt@gem_ctx_exec@basic-nohangcheck.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-rkl}:        [FAIL][84] ([fdo#103375]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][86] ([i915#4525]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][88] ([i915#2842]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - {shard-rkl}:        [FAIL][90] ([i915#2842]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][92] ([i915#7276]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][94] ([i915#3282]) -> [PASS][95] +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@allowed-all:
    - {shard-rkl}:        [SKIP][96] ([i915#2527]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-3/igt@gen9_exec_parse@allowed-all.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-5/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][98] ([i915#6258]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][100] ([i915#3989] / [i915#454]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][102] ([i915#4281]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - {shard-rkl}:        [SKIP][104] ([i915#1397]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - {shard-rkl}:        [SKIP][106] ([fdo#109308]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-5/igt@i915_pm_rpm@system-suspend-modeset.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs:
    - {shard-rkl}:        [SKIP][108] ([i915#1845] / [i915#4098]) -> [PASS][109] +16 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][110] ([i915#72]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][112] ([i915#2346]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [FAIL][114] ([i915#79]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:
    - shard-apl:          [SKIP][116] ([fdo#109271]) -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl2/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl7/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html

  * igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1:
    - shard-glk:          [SKIP][118] ([fdo#109271]) -> [PASS][119] +3 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-glk2/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk8/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [DMESG-WARN][120] ([i915#180]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         [SKIP][122] ([i915#3555]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - {shard-rkl}:        [SKIP][124] ([i915#1849] / [i915#4098]) -> [PASS][125] +9 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_psr@primary_page_flip:
    - {shard-rkl}:        [SKIP][126] ([i915#1072]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-1/igt@kms_psr@primary_page_flip.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][128] ([fdo#109441]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - {shard-rkl}:        [SKIP][130] ([fdo#109289]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-4/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - {shard-rkl}:        [SKIP][132] ([i915#2434]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-4/igt@perf@mi-rpc.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-5/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - {shard-dg1}:        [FAIL][134] ([i915#4349]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-dg1-13/igt@perf_pmu@busy-double-start@vcs1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@prime_vgem@basic-read:
    - {shard-rkl}:        [SKIP][136] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-rkl-4/igt@prime_vgem@basic-read.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-5/igt@prime_vgem@basic-read.html

  
#### Warnings ####

  * igt@gem_pread@exhaustion:
    - shard-apl:          [INCOMPLETE][138] ([i915#7248]) -> [WARN][139] ([i915#2658])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl7/igt@gem_pread@exhaustion.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl6/igt@gem_pread@exhaustion.html
    - shard-glk:          [INCOMPLETE][140] ([i915#7248]) -> [WARN][141] ([i915#2658])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-glk5/igt@gem_pread@exhaustion.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk6/igt@gem_pread@exhaustion.html

  * igt@kms_content_protection@mei_interface:
    - shard-tglb:         [SKIP][142] ([i915#7118]) -> [SKIP][143] ([fdo#109300])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-tglb8/igt@kms_content_protection@mei_interface.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-tglb8/igt@kms_content_protection@mei_interface.html
    - shard-iclb:         [SKIP][144] ([i915#7118]) -> [SKIP][145] ([fdo#109300])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb7/igt@kms_content_protection@mei_interface.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb8/igt@kms_content_protection@mei_interface.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
    - shard-apl:          [DMESG-FAIL][146] ([IGT#6]) -> [FAIL][147] ([i915#4573]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl6/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][148] ([i915#658]) -> [SKIP][149] ([i915#2920]) +2 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][150] ([fdo#111068] / [i915#658]) -> [SKIP][151] ([i915#2920]) +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][152] ([i915#2920]) -> [SKIP][153] ([fdo#111068] / [i915#658])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][154], [FAIL][155], [FAIL][156]) ([i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][157], [FAIL][158], [FAIL][159], [FAIL][160]) ([i915#3002] / [i915#4312])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl2/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl7/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl6/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl6/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl7/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl3/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5584]: https://gitlab.freedesktop.org/drm/intel/issues/5584
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7071 -> IGTPW_8142
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12417: 146bf59b0038cbb0c1665088db64c46c1d420630 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8142: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/index.html
  IGT_7071: 0801475083ccb938b1d3b358502ff97fdb435585 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/index.html

--===============8630811737811346604==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Remove libdrm remnants in i915 code</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/111200/">https://patchwork.freedesktop.org/series/111200/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8142/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12417_full -&gt; IGTPW_8142_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8142_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_8142_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/index.=
html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8142=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-apl8/igt@gem_partial_pwrite_pread@writes-after-reads-un=
cached.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_8142/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads-=
uncached.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8142_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142=
/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-gl=
k6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/sh=
ard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-iclb7/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb3/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb8/igt@gem_softpin@evict-single-offset.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shar=
d-iclb7/igt@gem_softpin@evict-single-offset.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4171">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@gem_userptr_blits@invalid-mmap-off=
set-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb7/igt@gen9_exec_parse@batch-zero-length.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fd=
o#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fd=
o#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb8/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915=
#4387</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-iclb1/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915=
#4387</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-tglb6/igt@i915_selftest@live@hangcheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-t=
glb8/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-iclb8/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hd=
mi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transi=
tion-fencing@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-glk2/igt@kms_atomic_transition@=
plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5584">i915#5584<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-64=
bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5286">i915#5286</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-64=
bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D111615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109278">fdo#109278</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb5/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/6095">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-iclb1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-apl7/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb6/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-audio-edid:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-apl7/igt@kms_chamelium@dp-audio-edid.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-snb4/igt@kms_chamelium@dp-audio-edid.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_chamelium@dp-audio-edid.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8142/shard-glk8/igt@kms_chamelium@dp-audio-edid.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb3/igt@kms_color_chamelium@ctm-limited-ra=
nge.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8142/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@kms_flip@2x-flip-vs-dpms.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fd=
o#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3637">i915#3637</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_flip@2x-flip-vs-panning.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8142/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2867">i915#2867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#35=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_8142/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-b=
lt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8142/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/6497">i915#6497</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +13 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-=
with-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb2/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb1/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-=
edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb6/igt@kms_plane_scaling@planes-upscale-2=
0x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-=
dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-apl6/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-75@pipe-c-dp-1.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +39 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb8/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_plane_scalin=
g@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5=
235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb3/igt@kms_psr@psr2_cursor_plane_move.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132=
">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3467">i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb1/=
igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-iclb6/igt@kms_setmode@invalid-clone-exclusiv=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-busy-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-glk6/igt@kms_vblank@pipe-d-wait-busy-hang.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-tglb7/igt@kms_vrr@flip-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#35=
55</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8142/shard-apl8/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-apl2/igt@perf@stress-open-close.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl6/igt=
@perf@stress-open-close.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5213">i915#5213</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8142/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html">PASS</a> =
+12 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-4/igt@fbdev@unaligned-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rk=
l-6/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-icl=
b2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-tglb8/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142=
/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-4/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375">fdo#103375</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/sh=
ard-rkl-5/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8142/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8142/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8142/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7276">i915#=
7276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
142/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard=
-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-3/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/sh=
ard-rkl-5/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#=
6258</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
142/shard-rkl-6/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shar=
d-iclb5/igt@i915_pm_dc@dc6-dpms.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-ic=
lb8/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397"=
>i915#1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8142/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-5/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo=
#109308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8142/shard-rkl-6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_=
rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@kms_ccs@pipe-b-random-ccs-data-=
y_tiled_gen12_rc_ccs.html">PASS</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legac=
y.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/72">i915#72</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8142/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8142/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic=
-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915=
#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_81=
42/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-apl2/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8142/shard-apl7/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html">PASS<=
/a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-glk2/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_8142/shard-glk8/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.htm=
l">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
142/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bp=
p-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-iclb3/igt@kms=
_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-defau=
lt-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-6/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-1/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shar=
d-rkl-6/igt@kms_psr@primary_page_flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_81=
42/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9289">fdo#109289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_8142/shard-rkl-4/igt@perf@gen12-unprivileged-single-ctx-counters=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-4/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-rkl-5/igt@pe=
rf@mi-rpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-dg1-13/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_81=
42/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708">i91=
5#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8142/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12417/shard-apl7/igt@gem_pread@exhaustion.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard=
-apl6/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12417/shard-glk5/igt@gem_pread@exhaustion.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard=
-glk6/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12417/shard-tglb8/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7118">i91=
5#7118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8142/shard-tglb8/igt@kms_content_protection@mei_interface.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10930=
0</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12417/shard-iclb7/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7118">i91=
5#7118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8142/shard-iclb8/igt@kms_content_protection@mei_interface.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10930=
0</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu=
-tools/issues/6">IGT#6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_8142/shard-apl6/igt@kms_plane_alpha_blend@alpha-basic@pipe=
-c-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4573">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920">i915#2920</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8142/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12417/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_8142/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12417/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12417/shard-apl7/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12417/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-=
apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8142/shard-apl7/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/shard-apl3/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8142/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7071 -&gt; IGTPW_8142</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12417: 146bf59b0038cbb0c1665088db64c46c1d420630 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_8142: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/index.htm=
l<br />
  IGT_7071: 0801475083ccb938b1d3b358502ff97fdb435585 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8630811737811346604==--
