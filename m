Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8021149431483337863=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Sat, 11 Mar 2023 21:06:08 -0000
Message-ID: <167856876877.29628.2901631254521369721@emeril.freedesktop.org>
References: <20230309194841.241213-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20230309194841.241213-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZ2VtX2N0?=
 =?utf-8?q?x=5Ffreq=3A_Remove_reference_to_non-existent_sysfs_entry?=
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

--===============8021149431483337863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_ctx_freq: Remove reference to non-existent sysfs entry
URL   : https://patchwork.freedesktop.org/series/114930/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12832_full -> IGTPW_8586_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8586_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8586_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8586_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-tglu-10:      NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@resize-bar:
    - {shard-dg1}:        NOTRUN -> [ABORT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-dg1-16/igt@i915_module_load@resize-bar.html

  * {igt@xe/xe_guc_pc@rc6_on_idle}:
    - {shard-dg1}:        NOTRUN -> [SKIP][5] +192 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-dg1-15/igt@xe/xe_guc_pc@rc6_on_idle.html

  
Known issues
------------

  Here are the changes found in IGTPW_8586_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-10:      NOTRUN -> [SKIP][6] ([i915#7697])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-apl:          [PASS][7] -> [INCOMPLETE][8] ([i915#4793])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl3/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_exec_endless@dispatch@vcs1:
    - shard-tglu-10:      NOTRUN -> [TIMEOUT][9] ([i915#3778])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_exec_endless@dispatch@vcs1.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-tglu-10:      NOTRUN -> [FAIL][12] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-tglu-10:      NOTRUN -> [SKIP][15] ([i915#4613]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglu-10:      NOTRUN -> [SKIP][16] ([fdo#111656])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu-10:      NOTRUN -> [SKIP][17] ([i915#4270]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271]) +22 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu-10:      NOTRUN -> [SKIP][19] ([i915#3323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-10:      NOTRUN -> [SKIP][20] ([i915#3297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglu-10:      NOTRUN -> [SKIP][21] ([fdo#109289]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gen7_exec_parse@load-register-reg.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-10:      NOTRUN -> [SKIP][22] ([i915#6412])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl4/igt@i915_pm_dc@dc9-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-10:      NOTRUN -> [WARN][25] ([i915#2681]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-10:      NOTRUN -> [SKIP][26] ([i915#6245])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu-10:      NOTRUN -> [SKIP][27] ([fdo#109302])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-tglu-10:      NOTRUN -> [SKIP][28] ([i915#5286]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-tglu-10:      NOTRUN -> [SKIP][29] ([fdo#111614]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglu-10:      NOTRUN -> [SKIP][30] ([fdo#111615]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#3886]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][32] ([i915#3689]) +8 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][33] ([i915#3689] / [i915#3886]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][34] ([i915#3689] / [i915#6095]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][35] ([i915#6095]) +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][36] ([fdo#111615] / [i915#3689]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-tglu-10:      NOTRUN -> [SKIP][37] ([i915#7828]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@type1:
    - shard-tglu-10:      NOTRUN -> [SKIP][38] ([i915#6944] / [i915#7116] / [i915#7118])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-10:      NOTRUN -> [SKIP][39] ([i915#3359])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-10:      NOTRUN -> [SKIP][40] ([i915#4103])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-tglu-10:      NOTRUN -> [SKIP][41] ([fdo#109274]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu-10:      NOTRUN -> [SKIP][42] ([i915#3469])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-tglu-10:      NOTRUN -> [SKIP][43] ([fdo#109274] / [i915#3637]) +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-10:      NOTRUN -> [SKIP][44] ([i915#2587] / [i915#2672]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-10:      NOTRUN -> [SKIP][45] ([i915#5439])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-tglu-10:      NOTRUN -> [SKIP][46] ([fdo#110189]) +21 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu-10:      NOTRUN -> [SKIP][48] ([fdo#109280]) +28 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-10:      NOTRUN -> [SKIP][49] ([i915#3555])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_hdr@static-swap.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu-10:      NOTRUN -> [SKIP][50] ([fdo#112054] / [i915#5288])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][51] ([i915#5176]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][52] ([i915#5235]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-10:      NOTRUN -> [SKIP][53] ([i915#658]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu-10:      NOTRUN -> [SKIP][54] ([fdo#109642] / [fdo#111068] / [i915#658])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-10:      NOTRUN -> [SKIP][55] ([i915#5289])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][56] ([fdo#111615] / [i915#5289])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglu-10:      NOTRUN -> [SKIP][57] ([fdo#109309])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu-10:      NOTRUN -> [SKIP][58] ([i915#2437]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_writeback@writeback-fb-id.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-tglu-10:      NOTRUN -> [SKIP][59] ([fdo#109315] / [i915#2575]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@vc4/vc4_create_bo@create-bo-4096:
    - shard-tglu-10:      NOTRUN -> [SKIP][60] ([i915#2575]) +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@vc4/vc4_create_bo@create-bo-4096.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - {shard-rkl}:        [FAIL][61] ([i915#4778]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-3/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@idle@rcs0:
    - {shard-rkl}:        [FAIL][63] ([i915#7742]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [ABORT][65] ([i915#180]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - {shard-rkl}:        [SKIP][67] ([i915#6252]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-3/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0:
    - {shard-tglu}:       [FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0.html

  * igt@gem_exec_capture@pi@rcs0:
    - {shard-rkl}:        [ABORT][71] ([i915#3371]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-1/igt@gem_exec_capture@pi@rcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-3/igt@gem_exec_capture@pi@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][73] ([i915#2842]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - {shard-rkl}:        [FAIL][75] ([i915#2842]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_reloc@basic-gtt:
    - {shard-rkl}:        [SKIP][77] ([i915#3281]) -> [PASS][78] +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@gem_exec_reloc@basic-gtt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_mmap_wc@set-cache-level:
    - {shard-rkl}:        [SKIP][79] ([i915#1850]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][81] ([i915#3282]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@gem_set_tiling_vs_pwrite.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [ABORT][83] ([i915#5566]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@shadow-peek:
    - {shard-rkl}:        [SKIP][85] ([i915#2527]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][87] ([i915#6258]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-3/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - {shard-tglu}:       [SKIP][89] ([i915#3547]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@i915_pm_rpm@system-suspend-modeset.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-1/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - {shard-rkl}:        [SKIP][91] ([i915#1845] / [i915#4098]) -> [PASS][92] +16 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - {shard-tglu}:       [SKIP][93] ([i915#1845] / [i915#7651]) -> [PASS][94] +15 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][95] ([i915#2346]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - {shard-tglu}:       [SKIP][97] ([i915#1845]) -> [PASS][98] +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - {shard-rkl}:        [SKIP][99] ([i915#1849] / [i915#4098]) -> [PASS][100] +11 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - {shard-tglu}:       [SKIP][101] ([i915#1849]) -> [PASS][102] +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - {shard-rkl}:        [SKIP][103] ([i915#1849]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_psr@cursor_plane_onoff:
    - {shard-rkl}:        [SKIP][105] ([i915#1072]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-4/igt@kms_psr@cursor_plane_onoff.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@kms_psr@cursor_plane_onoff.html

  * igt@kms_universal_plane@universal-plane-pipe-d-functional:
    - {shard-tglu}:       [SKIP][107] ([fdo#109274]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@kms_universal_plane@universal-plane-pipe-d-functional.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-1/igt@kms_universal_plane@universal-plane-pipe-d-functional.html

  * igt@perf@gen12-mi-rpc:
    - {shard-rkl}:        [SKIP][109] ([fdo#109289]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-5/igt@perf@gen12-mi-rpc.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-2/igt@perf@gen12-mi-rpc.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][111] ([i915#1722]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@perf@polling-small-buf.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@perf@polling-small-buf.html

  * igt@prime_vgem@coherency-gtt:
    - {shard-rkl}:        [SKIP][113] ([fdo#109295] / [fdo#111656] / [i915#3708]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-6/igt@prime_vgem@coherency-gtt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@prime_vgem@coherency-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3371]: https://gitlab.freedesktop.org/drm/intel/issues/3371
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4778]: https://gitlab.freedesktop.org/drm/intel/issues/4778
  [i915#4793]: https://gitlab.freedesktop.org/drm/intel/issues/4793
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5431]: https://gitlab.freedesktop.org/drm/intel/issues/5431
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7791]: https://gitlab.freedesktop.org/drm/intel/issues/7791
  [i915#7811]: https://gitlab.freedesktop.org/drm/intel/issues/7811
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8275]: https://gitlab.freedesktop.org/drm/intel/issues/8275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7188 -> IGTPW_8586
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12832: 40eaf607cfcc6f514cd3ea652525704137bcea15 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8586: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/index.html
  IGT_7188: b35bfa32fe672d67ced8555557e3e707ace211ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/index.html

--===============8021149431483337863==
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
<tr><td><b>Series:</b></td><td>gem_ctx_freq: Remove reference to non-existent sysfs entry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114930/">https://patchwork.freedesktop.org/series/114930/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12832_full -&gt; IGTPW_8586_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8586_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8586_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8586_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_ppgtt@blt-vs-render-ctx0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-dg1-16/igt@i915_module_load@resize-bar.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@xe/xe_guc_pc@rc6_on_idle}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-dg1-15/igt@xe/xe_guc_pc@rc6_on_idle.html">SKIP</a> +192 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8586_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl3/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4793">i915#4793</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_exec_endless@dispatch@vcs1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_create_bo@create-bo-4096:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-10/igt@vc4/vc4_create_bo@create-bo-4096.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4778">i915#4778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-3/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-3/igt@gem_ctx_persistence@engines-hang@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-1/igt@gem_exec_capture@pi@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3371">i915#3371</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-3/igt@gem_exec_capture@pi@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@gem_exec_reloc@basic-gtt.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1850">i915#1850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#6258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-3/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3547">i915#3547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-1/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_onoff:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-4/igt@kms_psr@cursor_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-6/igt@kms_psr@cursor_plane_onoff.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-d-functional:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-tglu-6/igt@kms_universal_plane@universal-plane-pipe-d-functional.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-tglu-1/igt@kms_universal_plane@universal-plane-pipe-d-functional.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-5/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-2/igt@perf@gen12-mi-rpc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-3/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12832/shard-rkl-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7188 -&gt; IGTPW_8586</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12832: 40eaf607cfcc6f514cd3ea652525704137bcea15 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8586: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8586/index.html<br />
  IGT_7188: b35bfa32fe672d67ced8555557e3e707ace211ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8021149431483337863==--
