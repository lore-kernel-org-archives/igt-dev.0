Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4721276050313971609=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Fri, 17 Nov 2023 06:49:12 -0000
Message-ID: <170020375207.7874.12751801074786426394@emeril.freedesktop.org>
References: <20231116032837.1629-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231116032837.1629-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgeGU6IFZh?=
 =?utf-8?q?lidate_fixed_CCS_mode_setting_=28rev3=29?=
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

--===============4721276050313971609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Validate fixed CCS mode setting (rev3)
URL   : https://patchwork.freedesktop.org/series/125873/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13882_full -> IGTPW_10198_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10198_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10198_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10198_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl7/igt@gem_workarounds@suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl2/igt@gem_workarounds@suspend-resume.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][4] +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@prime_busy@hang@bcs0:
    - shard-snb:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb2/igt@prime_busy@hang@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb2/igt@prime_busy@hang@bcs0.html

  
#### Warnings ####

  * igt@kms_content_protection@lic@pipe-a-dp-1:
    - shard-apl:          [TIMEOUT][7] ([i915#7173]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl6/igt@kms_content_protection@lic@pipe-a-dp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl3/igt@kms_content_protection@lic@pipe-a-dp-1.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          [SKIP][9] ([i915#3555]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          [SKIP][11] ([i915#3555]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         [SKIP][13] ([i915#3555]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-mtlp:         [SKIP][15] ([i915#3555]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-5/igt@kms_dsc@dsc-fractional-bpp.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          [SKIP][17] ([i915#9683]) -> [SKIP][18] +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-13/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-tglu:         [SKIP][19] ([i915#9683]) -> [SKIP][20] +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][21] ([i915#9683]) -> [SKIP][22] +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          [SKIP][23] ([i915#9683]) -> [SKIP][24] +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_dsc@dsc-fractional-bpp-with-bpc}:
    - shard-dg2:          [SKIP][25] ([i915#3555]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          [SKIP][27] ([i915#4098]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          [SKIP][29] ([i915#3555]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-16/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         [SKIP][31] ([i915#3555]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * {igt@kms_pm_dc@dc3co-vpb-simulation}:
    - shard-rkl:          [SKIP][33] ([i915#9683]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg1:          [SKIP][35] ([i915#9683]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-13/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-17/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-tglu:         [SKIP][37] ([i915#9683]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * {igt@kms_psr@pr_cursor_render}:
    - shard-mtlp:         NOTRUN -> [SKIP][39] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_psr@pr_cursor_render.html

  * {igt@kms_psr@pr_sprite_plane_onoff}:
    - shard-mtlp:         [SKIP][40] ([i915#3555]) -> [SKIP][41] +14 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-2/igt@kms_psr@pr_sprite_plane_onoff.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_psr@pr_sprite_plane_onoff.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option}:
    - shard-tglu:         [PASS][42] -> [TIMEOUT][43] +4 other tests timeout
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-8/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:
    - shard-rkl:          [PASS][44] -> [TIMEOUT][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html

  * {igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible}:
    - shard-dg1:          [PASS][46] -> [TIMEOUT][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-13/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible.html

  * {igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_src_moved}:
    - shard-rkl:          NOTRUN -> [TIMEOUT][48] +1 other test timeout
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_src_moved.html

  * {igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp}:
    - shard-mtlp:         [PASS][49] -> [TIMEOUT][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-2/igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp.html

  * {igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled}:
    - shard-snb:          NOTRUN -> [TIMEOUT][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb2/igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_10198_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#8411])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#8411])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][54] ([i915#6122])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@api_intel_bb@render-ccs.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#7701])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#8414]) +7 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-1/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#8414]) +10 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@drm_fdinfo@busy@vcs1.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#8414]) +40 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4873])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-1/igt@gem_caching@read-writes.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][60] -> [INCOMPLETE][61] ([i915#7297])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#7697])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][63] ([i915#9364])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#6335])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#8562])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [PASS][66] -> [FAIL][67] ([i915#6268])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-tglu:         NOTRUN -> [FAIL][68] ([i915#6268])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-tglu:         [PASS][69] -> [INCOMPLETE][70] ([i915#8797])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-9/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#8555])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#1099]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#280])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#280])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-internal-immediate:
    - shard-mtlp:         [PASS][75] -> [ABORT][76] ([i915#9414]) +1 other test abort
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@gem_eio@in-flight-internal-immediate.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@gem_eio@in-flight-internal-immediate.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4812]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4771]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#4525]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#6334])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-dg2:          NOTRUN -> [FAIL][81] ([i915#9606])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4473] / [i915#4771]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][83] ([i915#2842])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3539])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         [PASS][85] -> [FAIL][86] ([i915#2842])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4812])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-rkl:          [PASS][88] -> [SKIP][89] ([fdo#109313])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([fdo#109313])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3539] / [i915#4852])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3539] / [i915#4852]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([fdo#112283])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#3281]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [PASS][95] -> [SKIP][96] ([i915#3281]) +13 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#3281]) +17 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#3281]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#3281]) +12 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4537] / [i915#4812]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [PASS][101] -> [SKIP][102] ([i915#7276])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4860]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4860])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#2190])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#2190])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#4613]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#4613]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-glk4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#4613])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl6/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#4613]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4083]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-17/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap@basic-small-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#4083])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4077]) +22 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#4077]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4077]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4083]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#3282]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#3282]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#3282]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [PASS][121] -> [SKIP][122] ([i915#3282]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#4270]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#4270]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4270]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#768]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#8428]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4079])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#4079]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-dg2:          NOTRUN -> [FAIL][130] ([fdo#103375])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4879])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#3297]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#3323])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#3297] / [i915#4880])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3297]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#3297])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg1:          NOTRUN -> [FAIL][137] ([i915#3318])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([fdo#109289])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([fdo#109289]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([fdo#109289])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [PASS][141] -> [SKIP][142] ([i915#2527]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gen9_exec_parse@allowed-single.html
    - shard-apl:          [PASS][143] -> [INCOMPLETE][144] ([i915#5566])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl3/igt@gen9_exec_parse@allowed-single.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#2856]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gen9_exec_parse@bb-start-out.html
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#2527]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#2856])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#2527])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][149] -> [DMESG-WARN][150] ([i915#9559])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [PASS][151] -> [INCOMPLETE][152] ([i915#9200])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#8399]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([fdo#109289]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#6621])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#8925])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_rps@thresholds-idle@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#3555] / [i915#8925])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle@gt1.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#8925]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_power@sanity:
    - shard-rkl:          [PASS][159] -> [SKIP][160] ([i915#7984])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@i915_power@sanity.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#6188])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#6188])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][163] ([i915#9311])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#4212])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#4212]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][166] ([i915#8247]) +3 other tests fail
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#6228])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#1769] / [i915#3555]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#5286]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([fdo#111615] / [i915#5286]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#4538] / [i915#5286]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([fdo#111614] / [i915#3638])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([fdo#111614])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([fdo#111614]) +5 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3638])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([fdo#111614]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#5190]) +31 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#6187]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [FAIL][179] ([i915#3743])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [PASS][180] -> [FAIL][181] ([i915#3743]) +1 other test fail
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([fdo#110723]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([fdo#111615])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([fdo#111615])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-10/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([fdo#111615])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#4538]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#4538] / [i915#5190]) +7 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([fdo#111615]) +5 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#2705])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4087] / [i915#7213])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#7213]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4087]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([fdo#111827])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([fdo#111827])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([fdo#111827]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_chamelium_color@degamma.html
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([fdo#111827]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#7828]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#7828]) +6 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#7828]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#7828]) +14 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#7828]) +5 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_color@ctm-0-50@pipe-b:
    - shard-rkl:          [PASS][202] -> [SKIP][203] ([i915#4098]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@kms_color@ctm-0-50@pipe-b.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-b.html

  * igt@kms_color@ctm-0-50@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#4098]) +6 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-c.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#7118]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#6944])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3116])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#7116])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-17/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8814])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3359]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#1845] / [i915#4098]) +19 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3555]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3359]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3555]) +11 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#3359])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([fdo#111767] / [i915#3546])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([fdo#109274] / [i915#5354]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-rkl:          [PASS][218] -> [SKIP][219] ([i915#1845] / [i915#4098]) +7 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([fdo#111825]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][221] -> [FAIL][222] ([i915#2346])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-move@all-pipes:
    - shard-mtlp:         [PASS][223] -> [DMESG-WARN][224] ([i915#2017])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-3/igt@kms_cursor_legacy@forked-move@all-pipes.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_cursor_legacy@forked-move@all-pipes.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#4103] / [i915#4213])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#4213])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-glk:          NOTRUN -> [SKIP][227] ([fdo#109271]) +35 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-glk2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#3555]) +10 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_dirtyfb@dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3804])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#8812])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#3840]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#3555] / [i915#3840])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#3555] / [i915#3840])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#3555] / [i915#3840])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#3955])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3469])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#3637]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([fdo#109274] / [i915#3637])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([fdo#111767] / [fdo#111825])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([fdo#109274] / [fdo#111767])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#8381])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#8381]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([fdo#109274]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-snb:          NOTRUN -> [SKIP][244] ([fdo#109271]) +19 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#3637] / [i915#4098]) +7 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#8381])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#2672]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#2672]) +4 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#2672]) +7 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2587] / [i915#2672])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [PASS][254] -> [SKIP][255] ([i915#1849] / [i915#4098]) +4 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([fdo#111825]) +21 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([fdo#111825] / [i915#1825]) +20 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([fdo#109280]) +10 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#3458]) +25 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#3023]) +17 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#1825]) +19 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#1849] / [i915#4098]) +11 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([fdo#110189]) +6 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#3458]) +10 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#8708]) +6 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#5354]) +43 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#8708]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][268] ([fdo#109271]) +153 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#8708]) +36 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#6118])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [PASS][271] -> [SKIP][272] ([i915#433])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-1/igt@kms_hdmi_inject@inject-audio.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html
    - shard-snb:          [PASS][273] -> [SKIP][274] ([fdo#109271])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb2/igt@kms_hdmi_inject@inject-audio.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb5/igt@kms_hdmi_inject@inject-audio.html
    - shard-mtlp:         [PASS][275] -> [SKIP][276] ([i915#433])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html
    - shard-glk:          [PASS][277] -> [SKIP][278] ([fdo#109271])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-glk4/igt@kms_hdmi_inject@inject-audio.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-glk3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#3555] / [i915#8228])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#3555] / [i915#8228])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8228]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-htotal:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#3555] / [i915#4098]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#4816])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#4070] / [i915#4816])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#6301])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#6301])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-position-hole:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#8825])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][289] ([i915#4573]) +1 other test fail
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#3582]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#8821])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#3555] / [i915#8821])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8806])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#6953] / [i915#8152])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#5176] / [i915#9423]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#5235]) +19 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#5235]) +23 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#5235]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#5235]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#6524])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([fdo#111068])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-9/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([fdo#111068])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#4348])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#9673]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#9681]) +7 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#9673])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-rkl:          [PASS][307] -> [INCOMPLETE][308] ([i915#9569])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-2/igt@kms_rotation_crc@bad-pixel-format.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#4235]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#4235])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#4235] / [i915#5190])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([fdo#111615] / [i915#5289])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][313] ([i915#5465]) +1 other test fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#3555] / [i915#4098]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#3555] / [i915#8809])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#8623])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][317] -> [FAIL][318] ([i915#9196])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][319] ([i915#9196])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#3555]) +4 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][321] ([fdo#109271] / [i915#2437])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#2437])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#2437])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#2437])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [PASS][325] -> [SKIP][326] ([i915#2436])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#7387]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@perf@global-sseu-config-invalid.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([fdo#109289])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [PASS][329] -> [FAIL][330] ([i915#4349])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@perf_pmu@busy-double-start@ccs0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-dg1:          [PASS][331] -> [FAIL][332] ([i915#4349])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs0.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#8850])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-6/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][334] ([i915#6806])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@perf_pmu@frequency@gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][335] ([i915#5493])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([fdo#109291])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@prime_udl.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#3291] / [i915#3708])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@prime_vgem@basic-write.html
    - shard-rkl:          [PASS][338] -> [SKIP][339] ([fdo#109295] / [i915#3291] / [i915#3708])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@prime_vgem@basic-write.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#3708])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@prime_vgem@fence-write-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][341] ([fdo#109295] / [i915#3708])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-snb:          NOTRUN -> [FAIL][342] ([i915#7812])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb1/igt@runner@aborted.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#4818])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#2575]) +5 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@v3d/v3d_submit_cl@bad-multisync-in-sync:
    - shard-tglu:         NOTRUN -> [SKIP][345] ([fdo#109315] / [i915#2575]) +3 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([fdo#109315]) +8 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@v3d/v3d_submit_csd@bad-multisync-pad:
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#2575]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@v3d/v3d_submit_csd@bad-multisync-pad.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#2575]) +21 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#7711]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-6/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#7711]) +7 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@vc4/vc4_tiling@get-bad-modifier.html

  * igt@vc4/vc4_tiling@set-bad-flags:
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#2575]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@vc4/vc4_tiling@set-bad-flags.html

  * igt@vc4/vc4_tiling@set-get:
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#7711]) +10 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@vc4/vc4_tiling@set-get.html

  * igt@vc4/vc4_wait_bo@used-bo-1ns:
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#7711]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@vc4/vc4_wait_bo@used-bo-1ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][354] ([i915#7742]) -> [PASS][355] +2 other tests pass
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@fbdev@nullptr:
    - shard-rkl:          [SKIP][356] ([i915#2582]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@fbdev@nullptr.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@fbdev@nullptr.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][358] ([i915#2842]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [FAIL][360] ([i915#2842]) -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][362] ([i915#3281]) -> [PASS][363] +5 other tests pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-tglu:         [INCOMPLETE][364] ([i915#8797]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-7/igt@gem_exec_suspend@basic-s0@smem.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-rkl:          [DMESG-WARN][366] -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-1/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          [SKIP][368] ([i915#3282]) -> [PASS][369] +2 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_spin_batch@spin-each:
    - shard-apl:          [FAIL][370] -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl2/igt@gem_spin_batch@spin-each.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl6/igt@gem_spin_batch@spin-each.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-rkl:          [SKIP][372] ([i915#2527]) -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][374] ([i915#8489] / [i915#8668]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0}:
    - shard-dg1:          [FAIL][376] -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [FAIL][378] ([i915#6537]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl4/igt@i915_pm_rps@engine-order.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl6/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][380] ([i915#7790]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb6/igt@i915_pm_rps@reset.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb4/igt@i915_pm_rps@reset.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][382] ([i915#4387]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][384] ([i915#5138]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [FAIL][386] ([i915#3743]) -> [PASS][387] +1 other test pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-mtlp:         [ABORT][388] ([i915#9414]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * {igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs}:
    - shard-rkl:          [SKIP][390] ([i915#4098]) -> [PASS][391] +15 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][392] ([i915#1845] / [i915#4098]) -> [PASS][393] +26 other tests pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          [SKIP][394] ([i915#1849] / [i915#4098]) -> [PASS][395] +11 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          [ABORT][396] ([i915#180]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * {igt@kms_plane@planar-pixel-format-settings}:
    - shard-rkl:          [SKIP][398] ([i915#9581]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_plane@planar-pixel-format-settings.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_plane@planar-pixel-format-settings.html

  * {igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-1}:
    - shard-rkl:          [INCOMPLETE][400] ([i915#8875]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-1.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-1.html

  * {igt@kms_pm_dc@dc6-dpms}:
    - shard-tglu:         [FAIL][402] ([i915#9295]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html

  * {igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait}:
    - shard-rkl:          [SKIP][404] ([i915#9519]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg1:          [SKIP][406] ([i915#9519]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * {igt@kms_pm_rpm@pm-tiling}:
    - shard-rkl:          [SKIP][408] ([fdo#109308]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_pm_rpm@pm-tiling.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [SKIP][410] ([i915#1849]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:
    - shard-mtlp:         [TIMEOUT][412] -> [PASS][413] +1 other test pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-5/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html

  * {igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb}:
    - shard-snb:          [TIMEOUT][414] -> [PASS][415] +3 other tests pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb4/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb7/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb.html

  * {igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:
    - shard-rkl:          [TIMEOUT][416] -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
    - shard-dg1:          [TIMEOUT][418] -> [PASS][419] +1 other test pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-14/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:
    - shard-snb:          [FAIL][420] ([i915#9196]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][422] ([i915#4349]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [FAIL][424] ([i915#4349]) -> [PASS][425] +1 other test pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html

  
#### Warnings ####

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][426] ([i915#7957]) -> [SKIP][427] ([i915#9323])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][428] ([i915#3555]) -> [SKIP][429] ([i915#7957])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_create@hog-create@smem0:
    - shard-mtlp:         [ABORT][430] ([i915#9414]) -> [FAIL][431] ([i915#8758])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-4/igt@gem_create@hog-create@smem0.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@gem_create@hog-create@smem0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-rkl:          [FAIL][432] ([i915#2842]) -> [SKIP][433] ([i915#9591])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][434] ([i915#8247]) -> [DMESG-FAIL][435] ([i915#8561])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-5/igt@kms_async_flips@crc@pipe-b-edp-1.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_async_flips@crc@pipe-b-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][436] ([i915#1845] / [i915#4098]) -> [SKIP][437] ([i915#1769] / [i915#3555])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][438] ([i915#1845] / [i915#4098]) -> [SKIP][439] ([i915#5286]) +8 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-rkl:          [SKIP][440] ([i915#5286]) -> [SKIP][441] ([i915#1845] / [i915#4098]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][442] ([fdo#111614] / [i915#3638]) -> [SKIP][443] ([i915#1845] / [i915#4098]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][444] ([i915#1845] / [i915#4098]) -> [SKIP][445] ([fdo#111614] / [i915#3638]) +4 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          [SKIP][446] ([fdo#111615]) -> [SKIP][447] ([i915#1845] / [i915#4098])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][448] ([i915#1845] / [i915#4098]) -> [SKIP][449] ([fdo#110723]) +6 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          [SKIP][450] ([fdo#110723]) -> [SKIP][451] ([i915#1845] / [i915#4098]) +3 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          [SKIP][452] ([i915#7118]) -> [SKIP][453] ([i915#1845] / [i915#4098])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-2/igt@kms_content_protection@atomic.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][454] ([i915#1845] / [i915#4098]) -> [SKIP][

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/index.html

--===============4721276050313971609==
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
<tr><td><b>Series:</b></td><td>xe: Validate fixed CCS mode setting (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125873/">https://patchwork.freedesktop.org/series/125873/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13882_full -&gt; IGTPW_10198_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10198_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10198_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/index.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10198_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl7/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl2/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb2/igt@prime_busy@hang@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb2/igt@prime_busy@hang@bcs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl6/igt@kms_content_protection@lic@pipe-a-dp-1.html">TIMEOUT</a> ([i915#7173]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl3/igt@kms_content_protection@lic@pipe-a-dp-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-13/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +6 other tests skip</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +6 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_dsc@dsc-fractional-bpp-with-bpc}:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a></p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-16/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc3co-vpb-simulation}:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-13/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-17/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9683]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_render}:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_psr@pr_cursor_render.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_plane_onoff}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-2/igt@kms_psr@pr_sprite_plane_onoff.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_psr@pr_sprite_plane_onoff.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-8/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option.html">TIMEOUT</a> +4 other tests timeout</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-13/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_src_moved}:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_src_moved.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-2/igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled}:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb2/igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10198_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-1/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@drm_fdinfo@busy@vcs1.html">SKIP</a> ([i915#8414]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-1/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> ([i915#9364])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-9/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> ([i915#8797])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-immediate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@gem_eio@in-flight-internal-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@gem_eio@in-flight-internal-immediate.html">ABORT</a> ([i915#9414]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl4/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([fdo#109271] / [i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@gem_exec_fair@basic-deadline.html">SKIP</a> ([i915#4473] / [i915#4771]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_exec_fair@basic-pace.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> ([i915#3281]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> ([i915#3281]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-9/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@gem_lmem_swapping@basic.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-glk4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-9/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl6/igt@gem_lmem_swapping@verify.html">SKIP</a> ([fdo#109271] / [i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-17/igt@gem_mmap@bad-offset.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@gem_mmap@basic-small-bo.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-2/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@gem_softpin@noreloc-s3.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2527]) +2 other tests skip</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl3/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl6/igt@gen9_exec_parse@allowed-single.html">INCOMPLETE</a> ([i915#5566])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2856]) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#9559])</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9200])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle@gt1.html">SKIP</a> ([i915#3555] / [i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> ([i915#8925]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +31 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#6187]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#110723]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-10/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#4538]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#111615]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#4087] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827]) +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@kms_color@ctm-0-50@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-b.html">SKIP</a> ([i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-c.html">SKIP</a> ([i915#4098]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118]) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-17/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7116])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#1845] / [i915#4098]) +19 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#111767] / [i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [i915#5354]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> ([i915#1845] / [i915#4098]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([fdo#111825]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-3/igt@kms_cursor_legacy@forked-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_cursor_legacy@forked-move@all-pipes.html">DMESG-WARN</a> ([i915#2017])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-glk2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([fdo#109271]) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_dirtyfb@dirtyfb-ioctl.html">SKIP</a> ([i915#3555]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([fdo#109274] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#111767] / [fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> ([fdo#109274]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> ([fdo#109271]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP</a> ([i915#3637] / [i915#4098]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> ([fdo#111825]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3458]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3023]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#1849] / [i915#4098]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> ([fdo#110189]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> ([i915#3458]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#5354]) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +153 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-glk4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-glk3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> ([i915#3555] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4070] / [i915#4816])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_plane@plane-position-hole.html">SKIP</a> ([i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1.html">FAIL</a> ([i915#4573]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html">SKIP</a> ([i915#3582]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#3555] / [i915#8821])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html">SKIP</a> ([i915#5235]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-9/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#111068])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#111068])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> ([i915#9673]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_psr@psr2_dpms.html">SKIP</a> ([i915#9681]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([i915#9673])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-2/igt@kms_rotation_crc@bad-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_rotation_crc@bad-pixel-format.html">INCOMPLETE</a> ([i915#9569])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#4235]) +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#4235])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> ([i915#4235] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html">FAIL</a> ([i915#5465]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> ([i915#3555] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@kms_vrr@flip-basic.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl4/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-13/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-1/igt@perf@global-sseu-config-invalid.html">SKIP</a> ([i915#7387]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-6/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@prime_udl.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708])</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@prime_vgem@basic-write.html">SKIP</a> ([fdo#109295] / [i915#3291] / [i915#3708])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#3708])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295] / [i915#3708])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb1/igt@runner@aborted.html">FAIL</a> ([i915#7812])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-8/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> ([i915#2575]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-in-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html">SKIP</a> ([fdo#109315] / [i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> ([fdo#109315]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-pad:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-15/igt@v3d/v3d_submit_csd@bad-multisync-pad.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-2/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> ([i915#2575]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-6/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-bad-flags:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-6/igt@vc4/vc4_tiling@set-bad-flags.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-get:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg2-11/igt@vc4/vc4_tiling@set-get.html">SKIP</a> ([i915#7711]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-1ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-19/igt@vc4/vc4_wait_bo@used-bo-1ns.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@fbdev@nullptr.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-7/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#8797]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-1/igt@gem_exec_whisper@basic-contexts-priority-all.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-each:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl2/igt@gem_spin_batch@spin-each.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl6/igt@gem_spin_batch@spin-each.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gen9_exec_parse@allowed-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl4/igt@i915_pm_rps@engine-order.html">FAIL</a> ([i915#6537]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl6/igt@i915_pm_rps@engine-order.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb6/igt@i915_pm_rps@reset.html">INCOMPLETE</a> ([i915#7790]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb4/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">ABORT</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@planar-pixel-format-settings}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> ([i915#9581]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-1}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#8875]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc6-dpms}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait}:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@pm-tiling}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109308]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@kms_pm_rpm@pm-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-5/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-4/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb}:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb4/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb7/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-14/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-18/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#7957]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#7957])</li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create@smem0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-4/igt@gem_create@hog-create@smem0.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@gem_create@hog-create@smem0.html">FAIL</a> ([i915#8758])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html">SKIP</a> ([i915#9591])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-mtlp-5/igt@kms_async_flips@crc@pipe-b-edp-1.html">FAIL</a> ([i915#8247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-mtlp-2/igt@kms_async_flips@crc@pipe-b-edp-1.html">DMESG-FAIL</a> ([i915#8561])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([i915#5286]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([i915#1845] / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([fdo#111615]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#110723]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#110723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13882/shard-rkl-2/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10198/shard-rkl-5/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          [SKIP][454] ([i915#1845] / [i915#4098]) -&gt; [SKIP][</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4721276050313971609==--
