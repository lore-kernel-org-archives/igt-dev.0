Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8353794681098147031=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Sep 2021 11:58:43 -0000
Message-ID: <163153432374.12458.4010250205647059304@emeril.freedesktop.org>
References: <20210913101346.1599740-1-jigar.bhatt@intel.com>
In-Reply-To: <20210913101346.1599740-1-jigar.bhatt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fdc=3A_Fix_DC9_test_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8353794681098147031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_dc: Fix DC9 test (rev6)
URL   : https://patchwork.freedesktop.org/series/93180/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10573_full -> IGTPW_6214_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6214_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6214_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6214_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][3] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb4/igt@kms_psr2_su@page_flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_6214_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-glk:          NOTRUN -> [DMESG-WARN][5] ([i915#3002])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk5/igt@gem_create@create-massive.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([fdo#109314])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb3/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [TIMEOUT][8] ([i915#3427])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-snb5/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][9] -> [TIMEOUT][10] ([i915#2369] / [i915#2481] / [i915#3070])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842]) +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#2190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][16] ([i915#2658])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#768])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb5/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#3323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][19] ([i915#3002])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][20] ([i915#2724])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-snb5/igt@gem_userptr_blits@vma-merge.html
    - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#3318])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb6/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271]) +79 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk7/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#1937])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#3777]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#118] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#3777]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3777])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3689] / [i915#3886])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3886]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk2/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3886]) +12 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3886]) +11 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109278]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb5/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3689]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb6/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb5/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb5/igt@kms_color_chamelium@pipe-b-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk9/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#3116])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][44] ([i915#1319])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl6/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][45] ([i915#1319]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3319]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3359])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +202 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl2/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#533])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk8/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][50] -> [INCOMPLETE][51] ([i915#456])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109274])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][53] ([i915#180])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#2587])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#2672])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111825]) +7 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109280])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][58] ([fdo#109271]) +355 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#533]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#533]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][61] ([fdo#108145] / [i915#265]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][62] ([fdo#108145] / [i915#265]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][63] ([i915#265])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][64] ([i915#265]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][65] ([i915#265])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][66] ([fdo#108145] / [i915#265])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3536])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb3/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-x:
    - shard-glk:          [PASS][68] -> [FAIL][69] ([i915#1779] / [i915#1888])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-glk4/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk1/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl7/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#2920]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#658]) +4 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl6/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][74] -> [SKIP][75] ([fdo#109642] / [fdo#111068] / [i915#658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109441])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][77] ([i915#132] / [i915#3467]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][78] -> [SKIP][79] ([fdo#109441]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#2437])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#2530])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb6/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#2530])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb3/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html

  * igt@perf_pmu@rc6-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][83] ([i915#180]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@perf_pmu@rc6-suspend.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271]) +250 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl6/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#111656])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb7/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2994]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl3/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@recycle:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2994]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl1/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@sema-10:
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2994])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk2/igt@sysfs_clients@sema-10.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-tglb:         [INCOMPLETE][89] ([i915#1373]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-tglb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][91] ([i915#2846]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][93] ([i915#2842]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][95] ([i915#2842]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][97] ([i915#2190]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][99] ([i915#644]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [FAIL][101] ([i915#3343]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [WARN][103] ([i915#2681]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-tglb:         [INCOMPLETE][105] ([i915#2411] / [i915#456]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb8/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][107] ([i915#180]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][109] ([i915#180]) -> [PASS][110] +9 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][111] ([fdo#109441]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@cursor-rotation-180:
    - shard-glk:          [FAIL][113] ([i915#65]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-glk9/igt@kms_rotation_crc@cursor-rotation-180.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-glk4/igt@kms_rotation_crc@cursor-rotation-180.html

  
#### Warnings ####

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [INCOMPLETE][115] ([i915#155]) -> [DMESG-WARN][116] ([i915#180])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl3/igt@gem_workarounds@suspend-resume.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl3/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][117] ([i915#2684]) -> [WARN][118] ([i915#1804] / [i915#2684])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         [INCOMPLETE][119] ([i915#1759]) -> [DMESG-FAIL][120] ([i915#1759] / [i915#2291])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-tglb3/igt@i915_selftest@live@gt_pm.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb2/igt@i915_selftest@live@gt_pm.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][121] ([i915#658]) -> [SKIP][122] ([i915#2920]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][123] ([i915#2920]) -> [SKIP][124] ([i915#658]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl3/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl3/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl6/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl3/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/ig

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/index.html

--===============8353794681098147031==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_dc: Fix DC9 test (rev6)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/93180/">https://patchwork.freedesktop.org/series/93180/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6214/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10573_full -&gt; IGTPW_6214_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6214_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6214_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6214=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspen=
d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6214/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr2_su@page_flip:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb4/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#10=
9642] / [fdo#111068] / [i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6214/shard-iclb2/igt@kms_psr2_su@page_flip.html">FA=
IL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6214_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk5/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb3/igt@gem_ctx_param@set-priority-not-sup=
ported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-snb5/igt@gem_eio@reset-stress.html">TIMEOUT<=
/a> ([i915#3427])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb8/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i=
915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk3/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb8/igt@gem_exec_fair@basic-pace-solo@rcs0=
.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html"=
>FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl6/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk2/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-iclb5/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> ([i915#2724])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-tglb6/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> ([i915#3318])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/sha=
rd-kbl7/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#1=
80]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk7/igt@i915_pm_backlight@bad-brightness.ht=
ml">SKIP</a> ([fdo#109271]) +79 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl8/igt@kms_big_fb@x-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/sha=
rd-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#1=
18] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk4/igt@kms_big_fb@yf-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk2/igt@kms_ccs@pipe-a-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl7/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +12 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl6/igt@kms_ccs@pipe-b-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +11 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-iclb5/igt@kms_ccs@pipe-d-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb6/igt@kms_ccs@pipe-d-missing-ccs-buffer-=
yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl6/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb5/igt@kms_color_chamelium@pipe-a-gamma.h=
tml">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-iclb5/igt@kms_color_chamelium@pipe-b-ctm-0-2=
5.html">SKIP</a> ([fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk9/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb6/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-kbl6/igt@kms_content_protection@srm.html">TIM=
EOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-apl2/igt@kms_content_protection@srm.html">TIM=
EOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-offscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x1=
70-rapid-movement.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl2/igt@kms_cursor_edge_walk@pipe-d-64x64-l=
eft-edge.html">SKIP</a> ([fdo#109271]) +202 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk8/igt@kms_cursor_legacy@pipe-d-single-bo.=
html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-tglb=
7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-iclb8/igt@kms_flip@2x-modeset-vs-vblank-race=
.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html=
">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-pri-indfb-draw-blt.html">SKIP</a> ([fdo#111825]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-pri-indfb-draw-blt.html">SKIP</a> ([fdo#109280])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#109271]) +355 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb3/igt@kms_plane_lowres@pipe-c-tiling-non=
e.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-x:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-glk4/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6214/shard-glk1/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html">FAIL</a=
> ([i915#1779] / [i915#1888])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl7/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
0.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-tglb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
2.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-apl6/igt@kms_psr2_sf@plane-move-sf-dmg-area-2=
.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-iclb8/=
igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [=
i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html">SKIP=
</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-=
iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fdo#109441]) +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk2/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-iclb6/igt@nouveau_crc@ctx-flip-threshold-rese=
t-after-capture.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-tglb3/igt@nouveau_crc@ctx-flip-threshold-rese=
t-after-capture.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@perf_pmu@rc6-suspend.html">DMESG-WA=
RN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl6/igt@prime_nv_api@i915_nv_reimport_twice=
_check_flink_name.html">SKIP</a> ([fdo#109271]) +250 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-tglb7/igt@prime_vgem@coherency-gtt.html">SKI=
P</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-apl3/igt@sysfs_clients@fair-1.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-kbl1/igt@sysfs_clients@recycle.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6214/shard-glk2/igt@sysfs_clients@sema-10.html">SKIP</a=
> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-tglb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">=
INCOMPLETE</a> ([i915#1373]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6214/shard-tglb2/igt@gem_ctx_isolation@preservation-s3@rc=
s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([=
i915#2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6214/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_6214/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6214/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2=
190]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/=
shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL<=
/a> ([i915#644]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6214/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#334=
3]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/sh=
ard-iclb8/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a=
> ([i915#2681]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6214/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html">INCO=
MPLETE</a> ([i915#2411] / [i915#456]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6214/shard-tglb8/igt@i915_pm_rpm@system-suspend-=
modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6214/shard-apl1/igt@kms_flip@flip-vs-suspend-interrup=
tible@c-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a=
> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6214/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +9 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 ([fdo#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6214/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@cursor-rotation-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-glk9/igt@kms_rotation_crc@cursor-rotation-180.html">FAI=
L</a> ([i915#65]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6214/shard-glk4/igt@kms_rotation_crc@cursor-rotation-180.html">PASS<=
/a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-kbl3/igt@gem_workarounds@suspend-resume.html">INCOMPLET=
E</a> ([i915#155]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6214/shard-kbl3/igt@gem_workarounds@suspend-resume.html">DMESG-WARN=
</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>=
 ([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6214/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i9=
15#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-tglb3/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a>=
 ([i915#1759]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6214/shard-tglb2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i9=
15#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-=
1.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6214/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-1.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10573/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a-3.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6214/shard-iclb8/igt@kms_psr2_sf@overlay-primary-upda=
te-sf-dmg-area-3.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_10573/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl3/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_10573/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_10573/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl4/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
10573/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_105=
73/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_10573/shard-kbl4/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10573/=
shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#1436] /=
 [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602]) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6214/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6214/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl6/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6214/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6214=
/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_6214/shard-kbl4/ig">FAIL</a>, [FAIL][145], [F=
AIL][146], [FAIL][147]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#300=
2] / [i915#3363] / [i915#602])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8353794681098147031==--
