Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7600693939284164660=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Fri, 30 Sep 2022 11:36:29 -0000
Message-ID: <166453778902.23343.5221839242140517200@emeril.freedesktop.org>
References: <20220929032642.16556-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20220929032642.16556-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/3=5D_tests/kms=5Ffrontbuffer?=
 =?utf-8?q?=5Ftracking=3A_Check_compression_state_on_all_gens_=28rev2=29?=
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

--===============7600693939284164660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/3] tests/kms_frontbuffer_tracking: Check compression state on all gens (rev2)
URL   : https://patchwork.freedesktop.org/series/109225/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12198_full -> IGTPW_7888_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/index.html

Participating hosts (9 -> 6)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Known issues
------------

  Here are the changes found in IGTPW_7888_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([i915#658])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb2/igt@feature_discovery@psr2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb4/igt@feature_discovery@psr2.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][3] ([i915#4991])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-snb4/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][4] ([i915#4991])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl2/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][5] ([i915#4991])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb7/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][6] ([i915#4991])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk1/igt@gem_create@create-massive.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][7] ([i915#4991])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb1/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-snb7/igt@gem_ctx_persistence@process.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         NOTRUN -> [FAIL][9] ([i915#5784])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#4525]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-iclb:         [PASS][16] -> [INCOMPLETE][17] ([i915#6453])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked-all.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#284])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@gem_media_vme.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#5566] / [i915#716])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-glk1/igt@gen9_exec_parse@allowed-single.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk1/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#5591])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-tglb2/igt@i915_selftest@live@hangcheck.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-snb:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-snb4/igt@i915_suspend@debugfs-reader.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-snb6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#5286]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#5286]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#110723])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#111615])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111615] / [i915#3689]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb1/igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3886]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109278] / [i915#3886]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#6095])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb5/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3689] / [i915#3886])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3886]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109278]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb7/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3689])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl7/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-snb2/igt@kms_color_chamelium@ctm-blue-to-red.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb2/igt@kms_color_chamelium@ctm-blue-to-red.html
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk6/igt@kms_color_chamelium@ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109284] / [fdo#111827])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb4/igt@kms_color_chamelium@ctm-blue-to-red.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][44] -> [FAIL][45] ([i915#4767])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109274]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#79])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#2672]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#2587] / [i915#2672]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#2587] / [i915#2672]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109280]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#6497])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109280] / [fdo#111825]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#6988]) +31 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +151 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#6988]) +31 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([i915#5176]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#658])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#658])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][65] ([i915#132] / [i915#3467])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_psr@psr2_basic.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109441])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb5/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109441]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [PASS][69] -> [SKIP][70] ([i915#5519])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3555]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#3555]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][73] -> [FAIL][74] ([i915#43])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-glk6/igt@kms_vblank@pipe-c-accuracy-idle.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk7/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#6971]) +44 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271]) +114 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk7/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> [SKIP][77] ([fdo#109271]) +120 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-snb7/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#6971]) +44 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@prime_nv_test@i915_blt_fill_nv_read.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][79] ([i915#2842]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][81] ([i915#2842]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_mmap_offset@close-race:
    - shard-snb:          [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-snb2/igt@gem_mmap_offset@close-race.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-snb4/igt@gem_mmap_offset@close-race.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl6/igt@gem_workarounds@suspend-resume.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl3/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-apl:          [TIMEOUT][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [FAIL][89] ([i915#6537]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl1/igt@i915_pm_rps@engine-order.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl7/igt@i915_pm_rps@engine-order.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [DMESG-FAIL][91] ([i915#5334]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl8/igt@i915_selftest@live@gt_heartbeat.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-tglb:         [INCOMPLETE][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-tglb5/igt@kms_addfb_basic@legacy-format.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-tglb7/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][95] ([i915#2346]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [FAIL][97] ([i915#79]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-iclb:         [FAIL][99] ([i915#1888]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [SKIP][101] ([i915#5235]) -> [PASS][102] +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [SKIP][103] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106] +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb6/igt@kms_psr@psr2_no_drrs.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@stress-open-close:
    - shard-glk:          [INCOMPLETE][107] ([i915#5213]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-glk5/igt@perf@stress-open-close.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-glk6/igt@perf@stress-open-close.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][109] ([i915#4525]) -> [FAIL][110] ([i915#6117])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][111] ([i915#2920]) -> [SKIP][112] ([i915#658]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [FAIL][113] ([i915#5939]) -> [SKIP][114] ([fdo#109642] / [fdo#111068] / [i915#658])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][115], [FAIL][116], [FAIL][117]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122]) ([i915#180] / [i915#3002] / [i915#4312])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl6/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl8/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl3/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl2/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl2/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6453]: https://gitlab.freedesktop.org/drm/intel/issues/6453
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6971]: https://gitlab.freedesktop.org/drm/intel/issues/6971
  [i915#6988]: https://gitlab.freedesktop.org/drm/intel/issues/6988
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6669 -> IGTPW_7888
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12198: 4c88fe47b0b231e7b7830573f47d9e2ea443b8c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7888: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/index.html
  IGT_6669: 3d2df081c14c251e0269e3510ddc4e9d26ffe925 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/index.html

--===============7600693939284164660==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/3] tests/km=
s_frontbuffer_tracking: Check compression state on all gens (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109225/">https://patchwork.freedesktop.org/series/109225/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7888/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12198_full -&gt; IGTPW_7888_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/index.=
html</p>
<h2>Participating hosts (9 -&gt; 6)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7888_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb4/i=
gt@feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-snb4/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991=
">i915#4991</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-apl2/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991=
">i915#4991</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-tglb7/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-glk1/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991=
">i915#4991</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-iclb1/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-snb7/igt@gem_ctx_persistence@process.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@gem_eio@reset-stress.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#57=
84</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/=
shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/s=
hard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/sh=
ard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked-all.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7888/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked-all.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6453">i=
915#6453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-glk1/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-=
glk1/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl2/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-tglb2/igt@i915_selftest@live@hangcheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-t=
glb1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-snb4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-snb=
6/igt@i915_suspend@debugfs-reader.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-iclb8/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0723">fdo#110723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb1/igt@kms_ccs@pipe-a-crc-primary-basic-y=
f_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-apl2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-iclb7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb5/igt@kms_ccs@pipe-b-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-glk6/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-iclb7/igt@kms_ccs@pipe-d-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-tglb3/igt@kms_ccs@pipe-d-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-apl7/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-snb2/igt@kms_color_chamelium@ctm-blue-to-red.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-tglb2/igt@kms_color_chamelium@ctm-blue-to-red=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-glk6/igt@kms_color_chamelium@ctm-blue-to-red.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-iclb4/igt@kms_color_chamelium@ctm-blue-to-red=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl6/=
igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb5/igt@kms_flip@2x-plain-flip-fb-recreate=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_flip@2x-single-buffer-flip-vs-=
dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109274">fdo#109274</a>) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7888/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7888/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#26=
72</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/6497">i915#6497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@kms_plane_alpha_blend@pipe-b-cover=
age-7efc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/6988">i915#6988</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +151 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_plane_alpha_blend@pipe-c-alpha=
-transparent-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6988">i915#6988</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb7/igt@kms_plane_scaling@plane-downscale-with-pixel-=
format-factor-0-5@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb2/igt@kms_plane_scaling@p=
lane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-apl7/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-glk2/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-tglb8/igt@kms_psr@psr2_basic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915#132</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467">i915#3=
467</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-iclb5/igt@kms_psr@psr2_basic.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shar=
d-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7888/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-tglb3/igt@kms_setmode@clone-exclusive-crtc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
55">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7888/shard-iclb7/igt@kms_setmode@clone-exclusive-crtc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
55">i915#3555</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-glk6/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard=
-glk7/igt@kms_vblank@pipe-c-accuracy-idle.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-tglb3/igt@nouveau_crc@pipe-b-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6971">i915#6971</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-glk7/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +114 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-snb7/igt@prime_nv_pcopy@test3_5.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +120 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6971">i915#6971</a>) +44 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7888/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7888/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@close-race:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-snb2/igt@gem_mmap_offset@close-race.html">FAIL</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-snb4=
/igt@gem_mmap_offset@close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-apl6/igt@gem_workarounds@suspend-resume.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
888/shard-apl3/igt@gem_workarounds@suspend-resume.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIME=
OUT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_788=
8/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-apl1/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6537">i915#6537</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-=
apl7/igt@i915_pm_rps@engine-order.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-apl8/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5334">i9=
15#5334</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7888/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-tglb5/igt@kms_addfb_basic@legacy-format.html">INCOMPLET=
E</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/=
shard-tglb7/igt@kms_addfb_basic@legacy-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7888/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic=
-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7888/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interru=
ptible@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-=
indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb1/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-iclb3/igt@kms_plane_scalin=
g@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">PASS</a> +2 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109=
642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068"=
>fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7888/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb6/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-=
iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-glk5/igt@perf@stress-open-close.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/sh=
ard-glk6/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7888/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7888/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-=
continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12198/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/sha=
rd-iclb3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12198/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/shard-apl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12198/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#43=
12</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
88/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl3/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shar=
d-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7888/shard-apl6/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/shard-apl2/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6669 -&gt; IGTPW_7888</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12198: 4c88fe47b0b231e7b7830573f47d9e2ea443b8c6 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7888: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7888/index.htm=
l<br />
  IGT_6669: 3d2df081c14c251e0269e3510ddc4e9d26ffe925 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7600693939284164660==--
