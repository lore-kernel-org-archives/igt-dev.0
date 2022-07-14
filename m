Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2360791471511805673=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 14 Jul 2022 07:39:37 -0000
Message-ID: <165778437771.7514.5171417125052160635@emeril.freedesktop.org>
References: <20220714041733.19044-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220714041733.19044-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGNv?=
 =?utf-8?q?dename_in_device_selection_=28rev3=29?=
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

--===============2360791471511805673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add codename in device selection (rev3)
URL   : https://patchwork.freedesktop.org/series/106012/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6581_full -> IGTPW_7515_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7515_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7515_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7515_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@pipe-d-viewport-size-256:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-tglb7/igt@kms_plane_cursor@pipe-d-viewport-size-256.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb8/igt@kms_plane_cursor@pipe-d-viewport-size-256.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html

  
Known issues
------------

  Here are the changes found in IGTPW_7515_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#5327])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#5325])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-massive:
    - shard-glk:          NOTRUN -> [DMESG-WARN][7] ([i915#4991])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk3/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][8] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-snb7/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([i915#3063])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-tglb1/igt@gem_eio@in-flight-contexts-immediate.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb7/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#5784])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#4525])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#6117])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2842]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#2842]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl7/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk9/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify:
    - shard-kbl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@gem_lmem_swapping@verify.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4270])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb1/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#4270])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb1/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-apl2/igt@gem_workarounds@suspend-resume.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl2/igt@gem_workarounds@suspend-resume.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109289]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb3/igt@gen7_exec_parse@chained-batch.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109289]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb7/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#2527] / [i915#2856])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb3/igt@gen9_exec_parse@shadow-peek.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#2856])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb1/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][35] ([i915#454])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#404])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#404])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#5286])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#5286])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111615])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110723])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3689])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3886]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615] / [i915#3689])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271]) +71 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk8/igt@kms_cdclk@mode-transition.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#3742])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_cdclk@mode-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3742])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-snb7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb3/igt@kms_color_chamelium@pipe-b-degamma.html
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk6/igt@kms_color_chamelium@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_color_chamelium@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl1/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271]) +170 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl1/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109274] / [fdo#111825])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109274]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip@toggle:
    - shard-iclb:         [PASS][60] -> [FAIL][61] ([i915#5072])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip@toggle.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-apl:          [PASS][62] -> [FAIL][63] ([i915#2346])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#5287])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#5287])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html

  * igt@kms_flip@2x-busy-flip:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#2672]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#3555])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#2672] / [i915#3555])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280]) +7 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271]) +241 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109280] / [fdo#111825]) +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][73] ([fdo#108145] / [i915#265]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][74] ([fdo#108145] / [i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#112054])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_lowres@tiling-yf@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#3536]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_plane_lowres@tiling-yf@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#5176]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#5176]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([i915#5235]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#5235]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl1/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#2920])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#658]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#111068] / [i915#658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][86] -> [SKIP][87] ([fdo#109642] / [fdo#111068] / [i915#658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb3/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][89] -> [SKIP][90] ([fdo#109441]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109441])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
    - shard-tglb:         NOTRUN -> [FAIL][92] ([i915#132] / [i915#3467])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [PASS][93] -> [SKIP][94] ([i915#5519])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-iclb:         [PASS][95] -> [SKIP][96] ([i915#5519])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#5289])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#5289])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_vblank@pipe-c-query-busy-hang:
    - shard-snb:          NOTRUN -> [SKIP][99] ([fdo#109271]) +132 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-snb7/igt@kms_vblank@pipe-c-query-busy-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#533])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2437])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2530])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb7/igt@nouveau_crc@pipe-b-source-outp-inactive.html
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#2530])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109291]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109291]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb4/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@sysfs_clients@busy:
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2994])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl7/igt@sysfs_clients@busy.html
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#2994]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl4/igt@sysfs_clients@busy.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - {shard-rkl}:        [SKIP][108] ([i915#2582]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-4/igt@fbdev@eof.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-2/igt@fbdev@eof.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [SKIP][110] ([i915#4525]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][112] ([i915#2842]) -> [PASS][113] +4 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][114] ([i915#2842]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_reloc@basic-wc:
    - {shard-rkl}:        [SKIP][116] ([i915#3281]) -> [PASS][117] +8 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-6/igt@gem_exec_reloc@basic-wc.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-5/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - {shard-rkl}:        [SKIP][118] ([i915#3282]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-4/igt@gem_tiled_partial_pwrite_pread@writes.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][120] ([i915#5566] / [i915#716]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][122] ([i915#5566] / [i915#716]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl4/igt@gen9_exec_parse@allowed-single.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-param:
    - {shard-rkl}:        [SKIP][124] ([i915#2527]) -> [PASS][125] +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][126] ([i915#6258]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-1/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][128] ([i915#454]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-rkl}:        [SKIP][130] ([i915#3361]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-4/igt@i915_pm_dc@dc9-dpms.html
    - shard-apl:          [SKIP][132] ([fdo#109271]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-kbl:          [WARN][134] ([i915#6405]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_selftest@live@gt_pm:
    - {shard-tglu}:       [DMESG-FAIL][136] ([i915#3987]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-tglu-4/igt@i915_selftest@live@gt_pm.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglu-8/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][138] ([i915#3921]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-snb4/igt@i915_selftest@live@hangcheck.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-snb4/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - {shard-rkl}:        [SKIP][140] ([i915#1845] / [i915#4098]) -> [PASS][141] +5 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - {shard-rkl}:        [SKIP][142] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][144] ([i915#79]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - {shard-tglu}:       [DMESG-WARN][146] -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-tglu-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglu-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][148] ([i915#180]) -> [PASS][149] +2 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][150] ([i915#180]) -> [PASS][151] +4 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - {shard-rkl}:        [SKIP][152] ([i915#1849] / [i915#4098]) -> [PASS][153] +4 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [FAIL][154] ([i915#1188]) -> [PASS][155] +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min:
    - {shard-rkl}:        [SKIP][156] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][158] ([i915#5176]) -> [PASS][159] +2 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html

  * igt@kms_properties@crtc-properties-legacy:
    - {shard-rkl}:        [SKIP][160] ([i915#1849]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr@primary_render:
    - {shard-rkl}:        [SKIP][162] ([i915#1072]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-5/igt@kms_psr@primary_render.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_psr@primary_render.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][164] ([fdo#109441]) -> [PASS][165] +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:
    - {shard-rkl}:        [SKIP][166] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html

  * igt@prime_vgem@basic-read:
    - {shard-rkl}:        [SKIP][168] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-rkl-2/igt@prime_vgem@basic-read.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-5/igt@prime_vgem@basic-read.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][170] ([i915#180] / [i915#4939]) -> [FAIL][171] ([i915#4767])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][172] ([i915#2920]) -> [SKIP][173] ([i915#658]) +2 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][174] ([i915#658]) -> [SKIP][175] ([i915#2920])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][176] ([fdo#111068] / [i915#658]) -> [SKIP][177] ([i915#2920])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [SKIP][178] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][179] ([i915#5939])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-iclb1/igt@kms_psr2_su@page_flip-nv12.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][180], [FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716] / [i915#92]) -> ([FAIL][189], [FAIL][190], [FAIL][191]) ([i915#3002] / [i915#4312] / [i915#5257])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl6/igt@runner@aborted.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl7/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl4/igt@runner@aborted.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl4/igt@runner@aborted.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl1/igt@runner@aborted.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl7/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl6/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl4/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl6/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
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
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
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
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6405]: https://gitlab.freedesktop.org/drm/intel/issues/6405
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6581 -> IGTPW_7515

  CI-20190529: 20190529
  CI_DRM_11877: e55cefc370de5a38ee848aa96082d9d9f4cacdb9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7515: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/index.html
  IGT_6581: 3c3a4cc75cfa7f6f34f2803ba68b0e8c5d1956e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/index.html

--===============2360791471511805673==
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
<tr><td><b>Series:</b></td><td>Add codename in device selection (rev3)</td>=
</tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106012/">https://patchwork.freedesktop.org/series/106012/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7515/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6581_full -&gt; IGTPW_7515_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7515_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7515_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/index.=
html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7515=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_cursor@pipe-d-viewport-size-256:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-tglb7/igt@kms_plane_cursor@pipe-d-viewport-size-256.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_751=
5/shard-tglb8/igt@kms_plane_cursor@pipe-d-viewport-size-256.html">INCOMPLET=
E</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_fair@basic-deadline:<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-2=
/igt@gem_exec_fair@basic-deadline.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7515_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327=
">i915#5327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325=
">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-glk3/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-apl7/igt@gem_ctx_isolation@preservation-s3@r=
cs0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-snb7/igt@gem_ctx_persistence@engines-queued.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-tglb1/igt@gem_eio@in-flight-contexts-immediate.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/sha=
rd-tglb7/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-tglb3/igt@g=
em_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7515/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@gem_exec_balancer@parallel-ordering=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6117">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl4/=
igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6=
/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-=
iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-apl7/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-glk9/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@gem_lmem_swapping@verify.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/46=
13">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb1/igt@gem_pxp@regular-baseline-src-copy-r=
eadible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb1/igt@gem_pxp@regular-baseline-src-copy-r=
eadible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-apl2/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl2=
/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb3/igt@gen7_exec_parse@chained-batch.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb7/igt@gen7_exec_parse@chained-batch.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb3/igt@gen9_exec_parse@shadow-peek.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i=
915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb1/igt@gen9_exec_parse@shadow-peek.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">i=
915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/404">i915#404</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/404">i915#404</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
86">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
86">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111615">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-tglb2/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb8/igt@kms_ccs@pipe-a-missing-ccs-buffer-=
y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_ccs@pipe-a-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-apl8/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_ccs@pipe-c-bad-pixel-format-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-glk6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-glk8/igt@kms_cdclk@mode-transition.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) +71 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_cdclk@mode-transition.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i91=
5#3742</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_cdclk@mode-transition.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i91=
5#3742</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-snb7/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_color_chamelium@pipe-a-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb3/igt@kms_color_chamelium@pipe-b-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-glk6/igt@kms_color_chamelium@pipe-b-degamma.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_color_chamelium@pipe-b-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-apl1/igt@kms_color_chamelium@pipe-d-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-apl1/igt@kms_cursor_crc@cursor-rapid-movemen=
t@pipe-b-dp-1-32x10.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +170 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-cursor=
-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb4/igt@kms_cursor_legacy@2x-flip-vs-cursor=
-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip@toggle.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/=
shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@toggle.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072">i915#5072</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor@ato=
mic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb210101=
0-mmap-wc-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb210101=
0-mmap-wc-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_flip@2x-busy-flip.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo#1=
09274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11182=
5">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_frontbuffer_tracking@fbcpsr-rgb=
565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>) +241 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_plane_lowres@tiling-yf@pipe-a-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-=
edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-=
edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pip=
e-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7515/shard-iclb2/igt@kms_plane_scaling@planes-downscale-facto=
r-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@kms_plane_scaling@planes-upscale-2=
0x20-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-apl1/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-glk2/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6581/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb=
3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-kbl4/igt@kms_psr2_su@page_flip-xrgb8888.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-icl=
b6/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10944=
1">fdo#109441</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_psr@psr2_sprite_plane_move.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132"=
>i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3467">i915#3467</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6581/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-flip-overla=
y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7515/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5519">i915#5519</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6581/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overla=
y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7515/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5519">i915#5519</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb4/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-snb7/igt@kms_vblank@pipe-c-query-busy-hang.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +132 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7515/shard-kbl7/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb7/igt@nouveau_crc@pipe-b-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9291">fdo#109291</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-iclb4/igt@prime_nv_api@i915_nv_import_twice.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9291">fdo#109291</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-apl7/igt@sysfs_clients@busy.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i91=
5#2994</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7515/shard-kbl4/igt@sysfs_clients@busy.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i91=
5#2994</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-4/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-2/igt@fbdev@eo=
f.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_751=
5/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard=
-kbl7/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shar=
d-apl4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-6/igt@gem_exec_reloc@basic-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rk=
l-5/igt@gem_exec_reloc@basic-wc.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-4/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#=
3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
515/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@writes.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-glk1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#=
716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
15/shard-glk5/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-kbl4/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#55=
66</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i9=
15#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7515/shard-kbl6/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/sha=
rd-rkl-5/igt@gen9_exec_parse@bb-start-param.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#6258=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/=
shard-rkl-1/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb2/igt@i=
915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6581/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-4/igt=
@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6581/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-apl1/igt=
@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-kbl4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6405">i915#640=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515=
/shard-kbl4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-tglu-4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/sh=
ard-tglu-8/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-snb4/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/=
shard-snb4/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#18=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i=
915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7515/shard-rkl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a> =
+5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untile=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb8888-mmap-cpu-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
b-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7515/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-tglu-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1=
.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7515/shard-tglu-8/igt@kms_flip@flip-vs-suspend-interruptible@a-h=
dmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/=
shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7515/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#118=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515=
/shard-kbl6/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-cons=
tant-alpha-min.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-form=
at-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-iclb5/igt@kms_plane_scaling=
@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html">PASS</a> +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#=
1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
515/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-5/igt@kms_psr@primary_render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-rkl-6=
/igt@kms_psr@primary_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-=
iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7515/shard-rkl-6/igt@kms_universal_plane@disable-pr=
imary-vs-flip-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-rkl-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#37=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_751=
5/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#493=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515=
/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7515/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-=
sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7515/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7515/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continu=
ous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6581/shard-iclb1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7515/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6581/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/=
shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6581/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl1/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6581/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl6/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6581/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6581/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/716">i915#716</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl6/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
515/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7515/shard-kbl7/igt@runner@aborted.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">=
i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6581 -&gt; IGTPW_7515</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11877: e55cefc370de5a38ee848aa96082d9d9f4cacdb9 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7515: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7515/index.htm=
l<br />
  IGT_6581: 3c3a4cc75cfa7f6f34f2803ba68b0e8c5d1956e5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2360791471511805673==--
