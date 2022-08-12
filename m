Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4286935782755581486=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Fri, 12 Aug 2022 10:50:23 -0000
Message-ID: <166030142380.17840.110379978698441781@emeril.freedesktop.org>
References: <20220812005039.450842-1-ashutosh.dixit@intel.com>
In-Reply-To: <20220812005039.450842-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fsysfs=3A_Drop_igt=5Fdebug=5Fon_from_igt=5Fsysfs=5Fgt=5Fopen?=
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

--===============4286935782755581486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_sysfs: Drop igt_debug_on from igt_sysfs_gt_open
URL   : https://patchwork.freedesktop.org/series/107191/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11985_full -> IGTPW_7639_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Known issues
------------

  Here are the changes found in IGTPW_7639_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglb:         NOTRUN -> [SKIP][1] ([i915#6335])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@gem_create@create-ext-cpu-access-big.html
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#6335])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#280])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][4] -> [FAIL][5] ([i915#5784])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglb7/igt@gem_eio@kms.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#4525]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#2842]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#2849])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#4270])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@gem_pxp@create-valid-protected-context.html
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#4270]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@gem_pxp@create-valid-protected-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#5566] / [i915#716])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb4/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][24] ([i915#2681])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][25] ([i915#1759])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@i915_selftest@live@gt_pm.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#3689] / [i915#3886]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#3689] / [i915#6095]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#111615] / [i915#3689]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#3886]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3886]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109278] / [i915#3886]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3886]) +4 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][33] ([fdo#109271]) +48 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-snb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3689]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109284] / [fdo#111827])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_chamelium@hdmi-crc-single.html
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk9/igt@kms_chamelium@hdmi-crc-single.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb3/igt@kms_chamelium@hdmi-crc-single.html
    - shard-snb:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-snb6/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl6/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl1/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][41] ([i915#1319])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3116] / [i915#3299])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][43] ([i915#2105])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl3/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#1063]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109300] / [fdo#111066])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb8/igt@kms_content_protection@uevent.html
    - shard-kbl:          NOTRUN -> [FAIL][46] ([i915#2105])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109274] / [fdo#111825])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#72])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109274])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_display_modes@extended-mode-basic.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109274]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#5287])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-blt-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][53] -> [INCOMPLETE][54] ([i915#180] / [i915#1982] / [i915#4939])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][56] -> [DMESG-WARN][57] ([i915#180])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#6375])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#2672])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#2672]) +9 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271]) +92 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#6497]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271]) +20 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +66 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109280] / [fdo#111825]) +10 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109280]) +6 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          [PASS][67] -> [FAIL][68] ([i915#1188])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-apl8/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [PASS][69] -> [FAIL][70] ([i915#1188])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_mmap_write_crc@main@pipe-a-edp-1:
    - shard-iclb:         [PASS][71] -> [DMESG-FAIL][72] ([i915#1888] / [i915#6316])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb1/igt@kms_mmap_write_crc@main@pipe-a-edp-1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb3/igt@kms_mmap_write_crc@main@pipe-a-edp-1.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109289])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb6/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][74] ([fdo#108145] / [i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-glk:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#5235]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#5235]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109642] / [fdo#111068] / [i915#658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][80] -> [SKIP][81] ([fdo#109441])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-tglb:         NOTRUN -> [FAIL][82] ([i915#132] / [i915#3467])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#5519])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [PASS][84] -> [SKIP][85] ([i915#5519])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#3555]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#3555]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:
    - shard-apl:          [PASS][88] -> [SKIP][89] ([fdo#109271]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
    - shard-kbl:          [PASS][90] -> [SKIP][91] ([fdo#109271])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278]) +4 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb5/igt@kms_vblank@pipe-d-ts-continuation-modeset.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#2530])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#2530])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb7/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109289]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@stress-open-close:
    - shard-glk:          [PASS][96] -> [INCOMPLETE][97] ([i915#5213])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-glk3/igt@perf@stress-open-close.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk3/igt@perf@stress-open-close.html

  * igt@prime_nv_api@i915_nv_double_import:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109291])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb5/igt@prime_nv_api@i915_nv_double_import.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109291]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb7/igt@prime_nv_api@i915_self_import.html

  * igt@sysfs_clients@split-10:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2994])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl3/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@drm_read@empty-block:
    - {shard-rkl}:        [SKIP][101] ([i915#1845] / [i915#4098]) -> [PASS][102] +23 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-2/igt@drm_read@empty-block.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@drm_read@empty-block.html

  * igt@fbdev@pan:
    - {shard-rkl}:        [SKIP][103] ([i915#2582]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-2/igt@fbdev@pan.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@fbdev@pan.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][105] ([i915#6268]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html
    - {shard-tglu}:       [FAIL][107] ([i915#6268]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@kms:
    - {shard-dg1}:        [FAIL][109] ([i915#5784]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-dg1-15/igt@gem_eio@kms.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-dg1-13/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - {shard-tglu}:       [TIMEOUT][111] ([i915#3063]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglu-1/igt@gem_eio@unwedge-stress.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglu-1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@fairslice:
    - {shard-rkl}:        [SKIP][113] ([i915#6259]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-5/igt@gem_exec_balancer@fairslice.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-1/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][115] ([i915#4525]) -> [PASS][116] +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - {shard-rkl}:        [SKIP][117] ([i915#6247]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-2/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][119] ([i915#2846]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [FAIL][121] ([i915#2842]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][123] ([i915#2842]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - {shard-tglu}:       [FAIL][125] ([i915#2842]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglu-1/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglb:         [FAIL][127] ([i915#2842]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [FAIL][129] ([i915#2842]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_pread@display:
    - {shard-rkl}:        [SKIP][131] ([i915#3282]) -> [PASS][132] +4 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-2/igt@gem_pread@display.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-5/igt@gem_pread@display.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - {shard-rkl}:        [SKIP][133] ([i915#3281]) -> [PASS][134] +3 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-single-offset:
    - {shard-rkl}:        [FAIL][135] ([i915#4171]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-5/igt@gem_softpin@evict-single-offset.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@gem_softpin@evict-single-offset.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [DMESG-WARN][137] ([i915#180]) -> [PASS][138] +2 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl1/igt@gem_workarounds@suspend-resume.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@bb-secure:
    - {shard-rkl}:        [SKIP][139] ([i915#2527]) -> [PASS][140] +2 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][141] ([i915#454]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-rkl}:        [SKIP][143] ([i915#1397]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-iclb:         [INCOMPLETE][145] -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb4/igt@i915_pm_rpm@system-suspend.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - {shard-rkl}:        [SKIP][147] ([fdo#109308]) -> [PASS][148] +1 similar issue
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-5/igt@i915_pm_rpm@system-suspend-modeset.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@waitboost:
    - {shard-rkl}:        [FAIL][149] ([i915#4016]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-2/igt@i915_pm_rps@waitboost.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-5/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live@gt_pm:
    - {shard-tglu}:       [DMESG-FAIL][151] ([i915#3987]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglu-4/igt@i915_selftest@live@gt_pm.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglu-1/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@cursor-vs-flip@legacy:
    - shard-iclb:         [FAIL][153] ([i915#5072]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb4/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - {shard-rkl}:        [SKIP][155] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][156] +2 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_fbcon_fbt@fbc:
    - {shard-rkl}:        [SKIP][157] ([i915#1849] / [i915#4098]) -> [PASS][158] +14 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-5/igt@kms_fbcon_fbt@fbc.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [DMESG-WARN][159] ([i915#180]) -> [PASS][160] +2 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_plane@plane-panning-top-left@pipe-b-planes:
    - {shard-rkl}:        [SKIP][161] ([i915#3558]) -> [PASS][162] +3 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-1/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - {shard-rkl}:        [SKIP][163] ([i915#1849] / [i915#3546] / [i915#4070] / [i915#4098]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [SKIP][165] ([i915#5235]) -> [PASS][166] +2 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_properties@crtc-properties-legacy:
    - {shard-rkl}:        [SKIP][167] ([i915#1849]) -> [PASS][168] +1 similar issue
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr@primary_render:
    - {shard-rkl}:        [SKIP][169] ([i915#1072]) -> [PASS][170] +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-1/igt@kms_psr@primary_render.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_psr@primary_render.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][171] ([fdo#109441]) -> [PASS][172] +1 similar issue
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-b:
    - {shard-rkl}:        [SKIP][173] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][174] +3 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html

  * igt@perf@polling-parameterized:
    - {shard-rkl}:        [FAIL][175] ([i915#5639]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-rkl-1/igt@perf@polling-parameterized.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][177] ([i915#6117]) -> [SKIP][178] ([i915#4525])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         [INCOMPLETE][179] ([i915#2373]) -> [DMESG-FAIL][180] ([i915#2373])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-tglb3/igt@i915_selftest@live@gt_lrc.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][181] ([i915#2920]) -> [SKIP][182] ([i915#658]) +1 similar issue
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][183] ([fdo#111068] / [i915#658]) -> [SKIP][184] ([i915#2920])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][190], [FAIL][191]) ([i915#3002] / [i915#4312] / [i915#5257])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl1/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl4/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl1/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl7/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl4/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl1/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6316]: https://gitlab.freedesktop.org/drm/intel/issues/6316
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6375]: https://gitlab.freedesktop.org/drm/intel/issues/6375
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6458]: https://gitlab.freedesktop.org/drm/intel/issues/6458
  [i915#6463]: https://gitlab.freedesktop.org/drm/intel/issues/6463
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6623 -> IGTPW_7639
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11985: 89445c6d81d47caa0c489a412dd92aa4e627207d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7639: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/index.html
  IGT_6623: c8edfca649da71b296d882bb0319181d94e619eb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/index.html

--===============4286935782755581486==
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
<tr><td><b>Series:</b></td><td>lib/igt_sysfs: Drop igt_debug_on from igt_sy=
sfs_gt_open</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107191/">https://patchwork.freedesktop.org/series/107191/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7639/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11985_full -&gt; IGTPW_7639_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7639_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-tglb5/igt@gem_create@create-ext-cpu-access-bi=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6335">i915#6335</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-iclb2/igt@gem_create@create-ext-cpu-access-bi=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6335">i915#6335</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@gem_ctx_sseu@invalid-args.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-tglb7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@gem_eio@=
kms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/=
shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +3=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-=
tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/=
shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-g=
lk6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-k=
bl1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/sh=
ard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-tglb2/igt@gem_pxp@create-valid-protected-cont=
ext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-iclb1/igt@gem_pxp@create-valid-protected-cont=
ext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-glk7/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk=
5/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb4/igt@gen9_exec_parse@valid-registers.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
56">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.ht=
ml">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
81">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_ccs@pipe-b-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb7/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-apl4/igt@kms_ccs@pipe-c-bad-pixel-format-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-glk2/igt@kms_ccs@pipe-c-bad-pixel-format-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-iclb6/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-snb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-basic-y=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_chamelium@hdmi-crc-single.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-glk9/igt@kms_chamelium@hdmi-crc-single.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-iclb3/igt@kms_chamelium@hdmi-crc-single.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-snb6/igt@kms_chamelium@hdmi-crc-single.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-apl6/igt@kms_chamelium@hdmi-mode-timings.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-kbl1/igt@kms_chamelium@vga-hpd-fast.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-kbl7/igt@kms_content_protection@atomic.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_content_protection@dp-mst-lic-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-apl3/igt@kms_content_protection@uevent.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105">=
i915#2105</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-iclb8/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300=
">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-kbl1/igt@kms_content_protection@uevent.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105">=
i915#2105</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_cursor_legacy@2x-long-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7639/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
2">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_display_modes@extended-mode-bas=
ic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-iclb5/igt@kms_display_modes@extended-mode-bas=
ic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-bl=
t-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-apl8/=
igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_flip@2x-flip-vs-modeset.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-=
apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/6375">i915#6375</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +9 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +92 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/6497">i915#6497</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-glk8/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +10 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-apl8/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
9/shard-apl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-=
kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb1/igt@kms_mmap_write_crc@main@pipe-a-edp-1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639=
/shard-iclb3/igt@kms_mmap_write_crc@main@pipe-a-edp-1.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6316">i91=
5#6316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb6/igt@kms_pipe_b_c_ivb@pipe-b-double-mod=
eset-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@kms_plane_scaling@planes-downscale=
-factor-0-25@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb2/igt@kms_plane_scaling@planes-downscale=
-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1096=
42">fdo#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb1/=
igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_psr@psr2_cursor_plane_move.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132=
">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3467">i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb5/igt@kms_psr_stress_test@flip-primary-i=
nvalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7639/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-tglb3/igt@kms_setmode@clone-exclusive-crtc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
55">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-iclb5/igt@kms_setmode@clone-exclusive-crtc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
55">i915#3555</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11985/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7639/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11985/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7639/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-modeset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb5/igt@kms_vblank@pipe-d-ts-continuation-=
modeset.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109278">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-tglb7/igt@nouveau_crc@pipe-c-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb7/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-glk3/igt@perf@stress-open-close.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-glk3/igt=
@perf@stress-open-close.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5213">i915#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_import:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb5/igt@prime_nv_api@i915_nv_double_import=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-tglb7/igt@prime_nv_api@i915_self_import.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-apl3/igt@sysfs_clients@split-10.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@empty-block:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-2/igt@drm_read@empty-block.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/sh=
ard-rkl-6/igt@drm_read@empty-block.html">PASS</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-2/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@fbd=
ev@pan.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11985/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/=
shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11985/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639=
/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-dg1-15/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-dg1-13/igt@=
gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-tglu-1/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/sha=
rd-tglu-1/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-5/igt@gem_exec_balancer@fairslice.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6259">i915#6259</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/sh=
ard-rkl-1/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7639/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence=
.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6247">i915#624=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639=
/shard-rkl-2/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/sh=
ard-kbl4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/=
shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11985/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
639/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11985/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7639/shard-tglu-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></=
p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11985/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7639/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639=
/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-2/igt@gem_pread@display.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-5/=
igt@gem_pread@display.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">=
i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7639/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">PASS<=
/a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-5/igt@gem_softpin@evict-single-offset.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#41=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
9/shard-rkl-6/igt@gem_softpin@evict-single-offset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-kbl1/igt@gem_workarounds@suspend-resume.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
639/shard-kbl4/igt@gem_workarounds@suspend-resume.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shar=
d-rkl-5/igt@gen9_exec_parse@bb-secure.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb=
6/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#13=
97</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
9/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb4/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/sha=
rd-iclb4/igt@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-5/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo=
#109308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7639/shard-rkl-6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-2/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rk=
l-5/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-tglu-4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#39=
87</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
9/shard-tglu-1/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@legacy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072"=
>i915#5072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7639/shard-iclb4/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-render-x=
tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_draw_crc@draw-method=
-xrgb2101010-render-xtiled.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-=
rkl-6/igt@kms_fbcon_fbt@fbc.html">PASS</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
639/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-1/igt@kms_plane@plane-panning-top-left@pipe-b-plane=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7639/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-b-pl=
anes.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849=
">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3546">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-a=
lpha-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-iclb3/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html">=
PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i=
915#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7639/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html">PASS</a=
> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-1/igt@kms_psr@primary_render.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shard-r=
kl-6/igt@kms_psr@primary_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/shar=
d-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-b.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/184=
5">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7639/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-=
pipe-b.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-rkl-1/igt@perf@polling-parameterized.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/sha=
rd-rkl-5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7639/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-tglb3/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#23=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
9/shard-tglb5/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7639/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11985/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7639/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11985/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11985/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11985/shard-kbl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11985/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/s=
hard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7639/shard-kbl4/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#=
3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312"=
>i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6623 -&gt; IGTPW_7639</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11985: 89445c6d81d47caa0c489a412dd92aa4e627207d @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7639: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7639/index.htm=
l<br />
  IGT_6623: c8edfca649da71b296d882bb0319181d94e619eb @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============4286935782755581486==--
