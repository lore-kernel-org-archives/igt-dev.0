Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8558665531430638764=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Fri, 04 Nov 2022 20:49:25 -0000
Message-ID: <166759496550.23020.399049170527307404@emeril.freedesktop.org>
References: <20221102110428.4049549-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20221102110428.4049549-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Fix_SIGABRT_in_dynamic_subtests_=28rev2?=
 =?utf-8?q?=29?=
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

--===============8558665531430638764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Fix SIGABRT in dynamic subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/110407/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12340_full -> IGTPW_8044_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8044_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8044_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html

Participating hosts (9 -> 8)
------------------------------

  Additional (2): shard-rkl shard-dg1 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8044_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-tglb5/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb6/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_shrink@reclaim:
    - {shard-rkl}:        NOTRUN -> ([SKIP][5], [SKIP][6])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-rkl-2/igt@gem_shrink@reclaim.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-rkl-4/igt@gem_shrink@reclaim.html
    - {shard-dg1}:        NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-dg1-17/igt@gem_shrink@reclaim.html

  
Known issues
------------

  Here are the changes found in IGTPW_8044_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-snb5/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#4525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#4525])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][12] ([i915#2846])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#768])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#5566] / [i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl2/igt@gen9_exec_parse@allowed-single.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl6/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-apl:          NOTRUN -> [FAIL][19] ([i915#7036])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         NOTRUN -> [WARN][20] ([i915#2684])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-tglb:         NOTRUN -> [WARN][21] ([i915#2681])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#1769])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#111614])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#110725] / [fdo#111614])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#110723])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111615])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#6095]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#3689])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271]) +91 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl7/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs.html
    - shard-snb:          NOTRUN -> [SKIP][30] ([fdo#109271]) +49 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-snb4/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3689] / [i915#6095]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb8/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3886]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111615] / [i915#3689]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb5/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl1/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#3555]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_legacy@flip-vs-cursor@toggle:
    - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#2346]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109274]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-tglb:         [PASS][40] -> [FAIL][41] ([i915#79])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#2587] / [i915#2672])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#2587] / [i915#2672]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#2672]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271]) +24 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#6497]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109280]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109280] / [fdo#111825]) +13 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3555]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb6/igt@kms_hdr@static-swap.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][50] ([i915#4573]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl2/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#5235]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#5235]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#658])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109441])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-d-wait-forked:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278]) +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb8/igt@kms_vblank@pipe-d-wait-forked.html

  * igt@perf@mi-rpc:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109289])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb3/igt@perf@mi-rpc.html

  * igt@sysfs_clients@fair-3:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#2994])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl7/igt@sysfs_clients@fair-3.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#2994])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb8/igt@sysfs_clients@fair-3.html
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#2994])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-glk2/igt@sysfs_clients@fair-3.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#2994])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@sysfs_clients@fair-3.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][62] ([i915#6268]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [FAIL][64] ([i915#2842]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_softpin@evict-single-offset:
    - shard-tglb:         [FAIL][66] ([i915#4171]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-tglb5/igt@gem_softpin@evict-single-offset.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb1/igt@gem_softpin@evict-single-offset.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][68] ([i915#180]) -> [PASS][69] +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl7/igt@gem_workarounds@suspend-resume.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl8/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [INCOMPLETE][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-tglb3/igt@gem_workarounds@suspend-resume-context.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb7/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][72] ([i915#3989] / [i915#454]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [FAIL][74] ([i915#4275]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl8/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         [SKIP][76] ([i915#3555]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb1/igt@kms_psr@psr2_dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb2/igt@kms_psr@psr2_dpms.html

  
#### Warnings ####

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglb:         [INCOMPLETE][80] ([i915#7248]) -> [WARN][81] ([i915#2658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][82] ([i915#658]) -> [SKIP][83] ([i915#2920])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][84] ([fdo#111068] / [i915#658]) -> [SKIP][85] ([i915#2920]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][86] ([i915#2920]) -> [SKIP][87] ([fdo#111068] / [i915#658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][88], [FAIL][89], [FAIL][90], [FAIL][91], [FAIL][92]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][93], [FAIL][94], [FAIL][95]) ([fdo#109271] / [i915#3002] / [i915#4312])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl2/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl1/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl7/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl2/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl8/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl7/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl6/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
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
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
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
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4275]: https://gitlab.freedesktop.org/drm/intel/issues/4275
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#4998]: https://gitlab.freedesktop.org/drm/intel/issues/4998
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6463]: https://gitlab.freedesktop.org/drm/intel/issues/6463
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6778]: https://gitlab.freedesktop.org/drm/intel/issues/6778
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7247]: https://gitlab.freedesktop.org/drm/intel/issues/7247
  [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7043 -> IGTPW_8044
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12340: d34d4266c5ad4a28019a76b6a19602370b070268 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8044: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html
  IGT_7043: eef0a0c904846509f8185330ccd210a578ba55ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.html

--===============8558665531430638764==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Fix SIGABRT in dynamic=
 subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/110407/">https://patchwork.freedesktop.org/series/110407/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8044/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12340_full -&gt; IGTPW_8044_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8044_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_8044_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.=
html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Additional (2): shard-rkl shard-dg1 <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8044=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-tglb5/igt@gem_ppgtt@blt-vs-render-ctxn.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-t=
glb6/igt@gem_ppgtt@blt-vs-render-ctxn.html">INCOMPLETE</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@=
i915_pm_dc@dc9-dpms.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_shrink@reclaim:</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-rkl-2/igt@gem_shrink@reclaim.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-rkl-4=
/igt@gem_shrink@reclaim.html">SKIP</a>)</p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-dg1-17/igt@gem_shrink@reclaim.html">SKIP</a><=
/p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8044_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-snb5/igt@gem_ctx_persistence@engines-hostile=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8044/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525"=
>i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@gem_exec_balancer@parallel-out-fen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-apl8/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">=
i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/sh=
ard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-iclb7/igt@gem_render_copy@yf-tiled-to-vebox-=
y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-apl2/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-=
apl6/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-yt=
iled.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/7036">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/268=
4">i915#2684</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/268=
1">i915#2681</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb5/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-iclb1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110723">fdo#110723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-apl7/igt@kms_ccs@pipe-b-random-ccs-data-4_til=
ed_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a>) +91 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-snb4/igt@kms_ccs@pipe-b-random-ccs-data-4_til=
ed_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a>) +49 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-tglb8/igt@kms_ccs@pipe-b-random-ccs-data-4_ti=
led_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb5/igt@kms_ccs@pipe-c-missing-ccs-buffer-=
yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-apl1/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-iclb8/igt@kms_cursor_crc@cursor-offscreen-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
044/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-tglb3/igt@kms_flip@2x-flip-vs-absolute-wf_vbl=
ank.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-iclb3/igt@kms_flip@2x-flip-vs-absolute-wf_vbl=
ank.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_80=
44/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) =
+3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
offscren-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +24 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-badstride:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-ba=
dstride.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/6497">i915#6497</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +13 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb6/igt@kms_hdr@static-swap.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-apl2/igt@kms_plane_alpha_blend@alpha-opaque-=
fb@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-=
edp-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-tglb3/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issu=
es</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issu=
es</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard=
-iclb8/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-iclb8/igt@kms_vblank@pipe-d-wait-forked.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
8">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8044/shard-tglb3/igt@perf@mi-rpc.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a>)=
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-apl7/igt@sysfs_clients@fair-3.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-tglb8/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-glk2/igt@sysfs_clients@fair-3.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8044/shard-iclb7/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044=
/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/s=
hard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-tglb5/igt@gem_softpin@evict-single-offset.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#41=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_804=
4/shard-tglb1/igt@gem_softpin@evict-single-offset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-apl7/igt@gem_workarounds@suspend-resume.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
044/shard-apl8/igt@gem_workarounds@suspend-resume.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-tglb3/igt@gem_workarounds@suspend-resume-context.html">=
INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8044/shard-tglb7/igt@gem_workarounds@suspend-resume-context.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-i=
clb2/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4275">i915#4275</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-apl8/=
igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bp=
p-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb3/igt@kms=
_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-defau=
lt-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb1/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-iclb=
2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#=
7248</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
044/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_8044/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8044/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12340/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8044/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12340/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12340/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12340/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12340/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/s=
hard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8044/shard-apl6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/shard-ap=
l6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7043 -&gt; IGTPW_8044</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12340: d34d4266c5ad4a28019a76b6a19602370b070268 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_8044: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8044/index.htm=
l<br />
  IGT_7043: eef0a0c904846509f8185330ccd210a578ba55ec @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8558665531430638764==--
