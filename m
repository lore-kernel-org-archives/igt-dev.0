Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1961359992333220713=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Aug 2021 14:35:31 -0000
Message-ID: <162990213109.17675.5419389391882293639@emeril.freedesktop.org>
References: <20210825075149.81624-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210825075149.81624-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fparams=3A_Fix_context_within_which_batch_is_execut?=
 =?utf-8?q?ed?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1961359992333220713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_exec_params: Fix context within which batch is executed
URL   : https://patchwork.freedesktop.org/series/93991/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10519_full -> IGTPW_6152_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6152_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6152_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6152_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_event_leak:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-tglb7/igt@kms_flip_event_leak.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb7/igt@kms_flip_event_leak.html

  
Known issues
------------

  Here are the changes found in IGTPW_6152_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][3] ([i915#3002])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl1/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][4] ([i915#3002])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl7/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-snb2/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][6] ([i915#3354])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#2846])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][9] ([i915#2846])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#2842]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][14] ([i915#2658])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-snb7/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#768])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb7/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          NOTRUN -> [DMESG-WARN][16] ([i915#180])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][17] ([i915#3318])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl6/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-apl6/igt@gem_workarounds@suspend-resume.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl7/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@gem-mmap-type@fixed:
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#3976])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl1/igt@i915_pm_rpm@gem-mmap-type@fixed.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][21] ([i915#3921])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#118] / [i915#95]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#1888])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-glk9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-iclb:         [PASS][26] -> [DMESG-WARN][27] ([i915#3621])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#3777]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#111615])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#110723])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#3886]) +12 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3886]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3886])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109278] / [i915#3886])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3689] / [i915#3886])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][36] ([fdo#109271]) +366 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-snb6/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271]) +18 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk5/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3689]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb8/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +242 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl8/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-snb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk3/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][43] ([i915#1319]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@pipe-b-cursor-size-change:
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#3444])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
    - shard-glk:          [PASS][46] -> [FAIL][47] ([i915#3444])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
    - shard-apl:          NOTRUN -> [FAIL][48] ([i915#3444])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#3444])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3359])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-random:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278]) +6 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque:
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#2124]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html

  * igt@kms_draw_crc@fill-fb:
    - shard-glk:          [PASS][55] -> [FAIL][56] ([i915#1888] / [i915#3451])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-glk7/igt@kms_draw_crc@fill-fb.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk5/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#79])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109280])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#533]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][62] ([fdo#108145] / [i915#265]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][63] ([fdo#108145] / [i915#265]) +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][64] ([i915#265])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#658]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][66] -> [SKIP][67] ([fdo#109642] / [fdo#111068] / [i915#658])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@cursor_plane_onoff:
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +16 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl1/igt@kms_psr@cursor_plane_onoff.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][69] -> [SKIP][70] ([fdo#109441])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][71] ([IGT#2])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#2437]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_writeback@writeback-fb-id.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2994]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl1/igt@sysfs_clients@fair-7.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#2994])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb6/igt@sysfs_clients@fair-7.html
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2994])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl3/igt@sysfs_clients@fair-7.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2994])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb3/igt@sysfs_clients@fair-7.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][77] ([i915#2842]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][79] ([i915#2842]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [FAIL][81] ([i915#2428]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [DMESG-FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-tglb1/igt@i915_selftest@live@requests.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb1/igt@i915_selftest@live@requests.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [FAIL][85] ([i915#79]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb8/igt@kms_psr@psr2_primary_mmap_gtt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-glk:          [FAIL][91] ([i915#1888] / [i915#65]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-glk5/igt@kms_rotation_crc@sprite-rotation-180.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk7/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vblank@pipe-c-wait-forked-busy-hang:
    - shard-kbl:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-kbl1/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl3/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][95] ([i915#2684]) -> [WARN][96] ([i915#1804] / [i915#2684]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         [SKIP][97] ([i915#658]) -> [SKIP][98] ([i915#2920]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][99] ([i915#2920]) -> [SKIP][100] ([i915#658]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][101], [FAIL][102]) ([i915#3002]) -> ([FAIL][103], [FAIL][104], [FAIL][105]) ([i915#1814] / [i915#3002])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb8/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb2/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb7/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb1/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#3363])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-apl1/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-apl3/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-apl1/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-apl8/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl6/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl7/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl3/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl7/igt@runner@aborted.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2124]: https://gitlab.freedesktop.org/drm/intel/issues/2124
  [i915#2428]: https://gitlab.freedesktop.org/drm/intel/issues/2428
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3354]: https://gitlab.freedesktop.org/drm/intel/issues/3354
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3444]: https://gitlab.freedesktop.org/drm/intel/issues/3444
  [i915#3451]: https://gitlab.freedesktop.org/drm/intel/issues/3451
  [i915#3621]: https://gitlab.freedesktop.org/drm/intel/issues/3621
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3777]: https://gitlab.freedesktop.org/drm/intel/issues/3777
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3976]: https://gitlab.freedesktop.org/drm/intel/issues/3976
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 7)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6185 -> IGTPW_6152
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_10519: 3edb12bf2c3cd732bc930e3e418e4aeaaaf32ffa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6152: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/index.html
  IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/index.html

--===============1961359992333220713==
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
<tr><td><b>Series:</b></td><td>tests/gem_exec_params: Fix context within wh=
ich batch is executed</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/93991/">https://patchwork.freedesktop.org/series/93991/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6152/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10519_full -&gt; IGTPW_6152_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6152_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6152_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6152=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip_event_leak:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-tglb7/igt@kms_flip_event_leak.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-tglb7/igt@=
kms_flip_event_leak.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6152_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-kbl1/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002=
">i915#3002</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-apl7/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002=
">i915#3002</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-snb2/igt@gem_ctx_persistence@engines-queued.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-snb7/igt@gem_eio@unwedge-stress.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3354">i915#3=
354</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10519/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-kbl=
1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-apl2/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i=
915#2846</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/=
shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-k=
bl7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-iclb7/igt@gem_render_copy@yf-tiled-to-vebox-=
linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl6/igt@gem_softpin@noreloc-s3.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl6/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-apl6/igt@gem_workarounds@suspend-resume.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-=
apl7/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@fixed:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl1/igt@i915_pm_rpm@gem-mmap-type@fixed.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3976">i915#3976</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-snb6/igt@i915_selftest@live@hangcheck.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shar=
d-glk8/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-glk9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/sh=
ard-glk9/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6152/shard-iclb1/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3621">i915#3621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3777">i915#3777</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-kbl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-glk3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-iclb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-tglb3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-snb6/igt@kms_ccs@pipe-d-bad-pixel-format-y_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a>) +366 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-glk5/igt@kms_ccs@pipe-d-random-ccs-data-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +18 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-tglb8/igt@kms_ccs@pipe-d-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl8/igt@kms_cdclk@mode-transition.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a>) +242 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl8/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-snb2/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-glk3/igt@kms_color_chamelium@pipe-d-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl6/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-size-change:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10519/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_61=
52/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3444">i915#3444<=
/a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10519/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_61=
52/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3444">i915#3444<=
/a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-size-ch=
ange.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3444">i915#3444</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10519/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
152/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3444">i915#344=
4</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x21=
-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109278">fdo#109278</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6152/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2124">i915#=
2124</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-glk7/igt@kms_draw_crc@fill-fb.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-glk5/igt@k=
ms_draw_crc@fill-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3451">i915#3451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-iclb2/igt@kms_flip@2x-nonexisting-fb.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6152/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-d-=
frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/533">i915#533</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/658">i915#658</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb1/ig=
t@kms_psr2_su@page_flip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_onoff:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-kbl1/igt@kms_psr@cursor_plane_onoff.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard=
-iclb4/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_sysfs_edid_timing.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IG=
T#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6152/shard-apl2/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-apl1/igt@sysfs_clients@fair-7.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-iclb6/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-kbl3/igt@sysfs_clients@fair-7.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-tglb3/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6152/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/=
shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2428">i915#24=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_615=
2/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-tglb1/igt@i915_selftest@live@requests.html">DMESG-FAIL<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/sh=
ard-tglb1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">=
i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6152/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
152/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb8/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_615=
2/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-glk5/igt@kms_rotation_crc@sprite-rotation-180.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i91=
5#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65"=
>i915#65</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6152/shard-glk7/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy-hang:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-kbl1/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6152/shard-kbl3/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html">PAS=
S</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#26=
84</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_615=
2/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i91=
5#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6152/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</=
a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6152/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-ar=
ea-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-iclb2/igt@runner@a=
borted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3002">i915#3002</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6152/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-iclb1/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6152/shard-iclb6/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</=
a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10519/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-apl3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10519/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/shard-apl8/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3363">i915#3363</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl6/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-=
apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_6152/shard-apl3/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/shard-apl7/ig=
t@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 7)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6185 -&gt; IGTPW_6152</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10519: 3edb12bf2c3cd732bc930e3e418e4aeaaaf32ffa @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_6152: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/index.htm=
l<br />
  IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1961359992333220713==--
