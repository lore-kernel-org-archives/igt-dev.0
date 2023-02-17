Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2974697729159022362=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 17 Feb 2023 23:16:21 -0000
Message-ID: <167667578164.7013.3171957889412176122@emeril.freedesktop.org>
References: <20230217082017.27753-1-swati2.sharma@intel.com>
In-Reply-To: <20230217082017.27753-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVmFsaWRh?=
 =?utf-8?q?te_max_source_size_=28rev3=29?=
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

--===============2974697729159022362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Validate max source size (rev3)
URL   : https://patchwork.freedesktop.org/series/114059/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12757_full -> IGTPW_8504_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8504_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8504_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8504_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-apl:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-apl2/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * {igt@kms_plane_scaling@i915-max-source-size} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-3/igt@kms_plane_scaling@i915-max-source-size.html

  * {igt@kms_plane_scaling@i915-max-source-size@max-src-size} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-apl6/igt@kms_plane_scaling@i915-max-source-size@max-src-size.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk5/igt@kms_plane_scaling@i915-max-source-size@max-src-size.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_barrier_race@remote-request@rcs0}:
    - {shard-rkl}:        [ABORT][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-2/igt@gem_barrier_race@remote-request@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-4/igt@gem_barrier_race@remote-request@rcs0.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-0-25@pipe-a-hdmi-a-1}:
    - {shard-tglu}:       NOTRUN -> [SKIP][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-0-25@pipe-a-hdmi-a-1.html

  * {igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-0-25@pipe-c-hdmi-a-1}:
    - {shard-dg1}:        NOTRUN -> [SKIP][9] +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-0-25@pipe-c-hdmi-a-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12757_full and IGTPW_8504_full:

### New IGT tests (2) ###

  * igt@kms_plane_scaling@i915-max-source-size:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@i915-max-source-size@max-src-size:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8504_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-tglu-9:       NOTRUN -> [SKIP][10] ([i915#6230])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@api_intel_bb@crc32.html

  * igt@drm_buddy@all-tests:
    - shard-tglu-10:      NOTRUN -> [SKIP][11] ([i915#6433]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@drm_buddy@all-tests.html

  * igt@fbdev@eof:
    - shard-tglu-9:       NOTRUN -> [SKIP][12] ([i915#2582]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@fbdev@eof.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-10:      NOTRUN -> [SKIP][13] ([i915#5325])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-10:      NOTRUN -> [SKIP][14] ([i915#6335])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-10:      NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu-10:      NOTRUN -> [SKIP][16] ([i915#6334])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-tglu-10:      NOTRUN -> [FAIL][17] ([i915#2842]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#2842]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk8/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglu-10:      NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglu-9:       NOTRUN -> [SKIP][21] ([fdo#112283])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_exec_params@secure-non-root.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-10:      NOTRUN -> [SKIP][22] ([i915#2190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-9:       NOTRUN -> [SKIP][23] ([i915#4613]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][24] ([i915#4613]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-tglu-10:      NOTRUN -> [SKIP][25] ([i915#284])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_media_vme.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-9:       NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglu-10:      NOTRUN -> [SKIP][27] ([i915#4270]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglu-9:       NOTRUN -> [SKIP][28] ([i915#4270])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglu-9:       NOTRUN -> [SKIP][29] ([fdo#109312])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-9:       NOTRUN -> [SKIP][30] ([i915#3297]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-10:      NOTRUN -> [SKIP][31] ([i915#3297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-tglu-10:      NOTRUN -> [FAIL][32] ([i915#3318])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglu-9:       NOTRUN -> [SKIP][33] ([fdo#109289]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu-9:       NOTRUN -> [SKIP][34] ([i915#2527] / [i915#2856]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-10:      NOTRUN -> [SKIP][35] ([i915#2527] / [i915#2856]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_hwmon@hwmon-read:
    - shard-tglu-10:      NOTRUN -> [SKIP][36] ([i915#7707])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@i915_hwmon@hwmon-read.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-9:       NOTRUN -> [SKIP][37] ([i915#6412])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu-10:      NOTRUN -> [SKIP][38] ([i915#7561])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglu-9:       NOTRUN -> [SKIP][39] ([i915#1902])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu-10:      NOTRUN -> [SKIP][40] ([fdo#111644] / [i915#1397])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-snb:          [PASS][41] -> [ABORT][42] ([i915#4528])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-snb1/igt@i915_selftest@live@sanitycheck.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-snb1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu-10:      NOTRUN -> [SKIP][43] ([i915#5286]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu-9:       NOTRUN -> [SKIP][44] ([i915#1845] / [i915#7651]) +44 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][45] ([fdo#111614])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][46] ([fdo#111615]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_busy@basic-hang:
    - shard-tglu-9:       NOTRUN -> [SKIP][47] ([i915#1845]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_busy@basic-hang.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][48] ([i915#3689] / [i915#3886]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][49] ([i915#3689]) +9 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][50] ([fdo#111615] / [i915#3689]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:
    - shard-tglu-9:       NOTRUN -> [SKIP][51] ([fdo#111615] / [i915#1845] / [i915#7651]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][52] ([i915#6095]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][53] ([i915#3689] / [i915#6095]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-9:       NOTRUN -> [SKIP][54] ([i915#3742])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-tglu-10:      NOTRUN -> [SKIP][55] ([fdo#111827]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-tglu-9:       NOTRUN -> [SKIP][56] ([i915#7828]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-tglu-10:      NOTRUN -> [SKIP][57] ([i915#7828]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][58] ([i915#3116] / [i915#3299]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei_interface:
    - shard-tglu-10:      NOTRUN -> [SKIP][59] ([i915#6944] / [i915#7116] / [i915#7118])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu-10:      NOTRUN -> [SKIP][60] ([i915#3359]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-tglu-10:      NOTRUN -> [SKIP][61] ([fdo#109274])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-apl:          [PASS][62] -> [FAIL][63] ([i915#2346])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu-10:      NOTRUN -> [SKIP][64] ([i915#3469])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu-10:      NOTRUN -> [SKIP][65] ([fdo#109274] / [i915#3637] / [i915#3966])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu-10:      NOTRUN -> [SKIP][66] ([fdo#109274] / [i915#3637]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#79]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-9:       NOTRUN -> [SKIP][69] ([fdo#109274] / [i915#3637]) +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-tglu-9:       NOTRUN -> [SKIP][70] ([i915#3637]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu-10:      NOTRUN -> [SKIP][71] ([i915#2587] / [i915#2672]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglu-9:       NOTRUN -> [SKIP][72] ([i915#1849]) +31 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-10:      NOTRUN -> [SKIP][73] ([i915#5439])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglu-10:      NOTRUN -> [SKIP][74] ([fdo#110189]) +23 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-tglu-10:      NOTRUN -> [SKIP][75] ([fdo#109280]) +28 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-10:      NOTRUN -> [SKIP][76] ([i915#1839])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-tglu-10:      NOTRUN -> [SKIP][77] ([fdo#109289]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-tglu-9:       NOTRUN -> [SKIP][78] ([i915#1849] / [i915#3558]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu-10:      NOTRUN -> [SKIP][79] ([fdo#112054] / [i915#5288])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][80] ([i915#5176]) +11 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][81] ([fdo#109271]) +27 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-snb7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-tglu-9:       NOTRUN -> [SKIP][82] ([i915#6953] / [i915#8152])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-tglu-9:       NOTRUN -> [SKIP][83] ([i915#3555] / [i915#6953])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][84] ([i915#5235]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-10:      NOTRUN -> [SKIP][85] ([i915#658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglu-9:       NOTRUN -> [SKIP][86] ([i915#658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-10:      NOTRUN -> [SKIP][87] ([fdo#109642] / [fdo#111068] / [i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@sprite_plane_move:
    - shard-tglu-9:       NOTRUN -> [SKIP][88] ([fdo#110189]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_psr@sprite_plane_move.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-10:      NOTRUN -> [SKIP][89] ([i915#5289])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][90] ([fdo#111615] / [i915#5289])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic:
    - shard-tglu-9:       NOTRUN -> [SKIP][91] ([i915#3555]) +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][92] ([i915#5465]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_vblank@pipe-a-accuracy-idle:
    - shard-glk:          [PASS][93] -> [FAIL][94] ([i915#43])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk7/igt@kms_vblank@pipe-a-accuracy-idle.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk7/igt@kms_vblank@pipe-a-accuracy-idle.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu-10:      NOTRUN -> [SKIP][95] ([i915#3555]) +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_vrr@negative-basic.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglu-10:      NOTRUN -> [SKIP][96] ([fdo#109295])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@prime_vgem@fence-read-hang.html

  * igt@v3d/v3d_mmap@mmap-bad-flags:
    - shard-tglu-9:       NOTRUN -> [SKIP][97] ([fdo#109315] / [i915#2575]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@v3d/v3d_mmap@mmap-bad-flags.html

  * igt@v3d/v3d_perfmon@create-perfmon-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][98] ([fdo#109315] / [i915#2575]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@v3d/v3d_perfmon@create-perfmon-0.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-tglu-10:      NOTRUN -> [SKIP][99] ([i915#2575]) +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  * igt@vc4/vc4_wait_bo@unused-bo-0ns:
    - shard-tglu-9:       NOTRUN -> [SKIP][100] ([i915#2575]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@vc4/vc4_wait_bo@unused-bo-0ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - {shard-rkl}:        [FAIL][101] ([i915#7742]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-rkl}:        [FAIL][103] ([i915#6268]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-dg1}:        [DMESG-WARN][105] ([i915#4391]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-dg1-17/igt@gem_eio@in-flight-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-dg1-13/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][107] ([i915#2842]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - {shard-rkl}:        [SKIP][109] ([i915#3281]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc-active.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - {shard-rkl}:        [SKIP][111] ([i915#2527]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc5-dpms:
    - {shard-rkl}:        [FAIL][113] ([i915#7330]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-5/igt@i915_pm_dc@dc5-dpms.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-4/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc5-psr:
    - {shard-rkl}:        [SKIP][115] ([i915#658]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-4/igt@i915_pm_dc@dc5-psr.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - {shard-dg1}:        [SKIP][117] ([i915#1397]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-dg1-14/igt@i915_pm_rpm@dpms-non-lpsp.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-rkl}:        [SKIP][119] ([i915#1397]) -> [PASS][120] +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-3/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - {shard-rkl}:        [SKIP][121] ([i915#1845] / [i915#4098]) -> [PASS][122] +22 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-apl:          [FAIL][123] ([i915#2346]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][125] ([i915#2122]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - {shard-rkl}:        [SKIP][127] ([i915#1849] / [i915#4098]) -> [PASS][128] +11 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_psr@cursor_mmap_gtt:
    - {shard-rkl}:        [SKIP][129] ([i915#1072]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-2/igt@kms_psr@cursor_mmap_gtt.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@kms_psr@cursor_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a:
    - {shard-rkl}:        [SKIP][131] ([i915#4070] / [i915#4098]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-1/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][133] ([i915#1722]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-1/igt@perf@polling-small-buf.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@perf@polling-small-buf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
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
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
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
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
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
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5431]: https://gitlab.freedesktop.org/drm/intel/issues/5431
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
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
  [i915#7330]: https://gitlab.freedesktop.org/drm/intel/issues/7330
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#8151]: https://gitlab.freedesktop.org/drm/intel/issues/8151
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7163 -> IGTPW_8504

  CI-20190529: 20190529
  CI_DRM_12757: 6653ef2d4663783ddec0ce1622ebbb4d47a2747f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8504: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index.html
  IGT_7163: a3ef8a604f21123740f644fb7b2f437d5e37e367 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index.html

--===============2974697729159022362==
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
<tr><td><b>Series:</b></td><td>Validate max source size (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114059/">https://patchwork.freedesktop.org/series/114059/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12757_full -&gt; IGTPW_8504_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8504_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8504_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8504_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-apl2/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@i915-max-source-size} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-3/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@i915-max-source-size@max-src-size} (NEW):</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-apl6/igt@kms_plane_scaling@i915-max-source-size@max-src-size.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk5/igt@kms_plane_scaling@i915-max-source-size@max-src-size.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@gem_barrier_race@remote-request@rcs0}:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-2/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-4/igt@gem_barrier_race@remote-request@rcs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-0-25@pipe-a-hdmi-a-1}:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-0-25@pipe-a-hdmi-a-1.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-0-25@pipe-c-hdmi-a-1}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-0-25@pipe-c-hdmi-a-1.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12757_full and IGTPW_8504_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@i915-max-source-size:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@i915-max-source-size@max-src-size:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8504_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@all-tests:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@drm_buddy@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk8/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109312">fdo#109312</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1902">i915#1902</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-snb1/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-snb1/igt@i915_selftest@live@sanitycheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_busy@basic-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3966">i915#3966</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3558">i915#3558</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-snb7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_move:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_psr@sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk7/igt@kms_vblank@pipe-a-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk7/igt@kms_vblank@pipe-a-accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bad-flags:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@v3d/v3d_mmap@mmap-bad-flags.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@v3d/v3d_perfmon@create-perfmon-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-10/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@unused-bo-0ns:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-tglu-9/igt@vc4/vc4_wait_bo@unused-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-dg1-17/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-dg1-13/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-active.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-5/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7330">i915#7330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-4/igt@i915_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-4/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-dg1-14/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-3/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-2/igt@kms_psr@cursor_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@kms_psr@cursor_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-1/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12757/shard-rkl-1/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/shard-rkl-6/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7163 -&gt; IGTPW_8504</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12757: 6653ef2d4663783ddec0ce1622ebbb4d47a2747f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8504: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8504/index.html<br />
  IGT_7163: a3ef8a604f21123740f644fb7b2f437d5e37e367 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2974697729159022362==--
