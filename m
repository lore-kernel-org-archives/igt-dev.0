Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6710829266000682194=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Wed, 15 Nov 2023 09:56:57 -0000
Message-ID: <170004221765.645.13222523888573453840@emeril.freedesktop.org>
References: <20231114090926.1618995-1-kunal1.joshi@intel.com>
In-Reply-To: <20231114090926.1618995-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZXh0ZW5k?=
 =?utf-8?q?_kms=5Fpsr_test_to_validate_pr_=28rev11=29?=
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

--===============6710829266000682194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend kms_psr test to validate pr (rev11)
URL   : https://patchwork.freedesktop.org/series/125379/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13873_full -> IGTPW_10183_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10183_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10183_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/index.html

Participating hosts (11 -> 12)
------------------------------

  Additional (1): shard-tglu0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10183_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][1] +37 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp.html

  * {igt@kms_psr@pr_cursor_plane_move} (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][2] +39 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_psr@pr_cursor_plane_move.html

  * {igt@kms_psr@pr_sprite_plane_onoff} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][3] +21 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_psr@pr_sprite_plane_onoff.html

  * {igt@kms_psr@pr_suspend} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][4] +41 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@kms_psr@pr_suspend.html

  * {igt@kms_psr@psr_cursor_mmap_gtt} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][5] +34 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_psr@psr_cursor_mmap_gtt.html

  
#### Warnings ####

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][6] ([i915#658]) -> [SKIP][7] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg1:          [SKIP][8] ([i915#658]) -> [SKIP][9] +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-tglu:         [SKIP][10] ([i915#658]) -> [SKIP][11] +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          [SKIP][12] ([i915#658]) -> [SKIP][13] +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-rkl:          [SKIP][14] ([i915#1072]) -> [SKIP][15] +16 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@kms_psr@psr2_cursor_plane_onoff.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          [SKIP][16] ([i915#1072]) -> [SKIP][17] +9 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-2/igt@kms_psr@psr2_dpms.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-dg1:          [SKIP][18] ([i915#1072] / [i915#4078]) -> [SKIP][19] +18 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-16/igt@kms_psr@psr2_primary_page_flip.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_psr@psr2_primary_page_flip.html
    - shard-tglu:         [SKIP][20] ([fdo#110189]) -> [SKIP][21] +17 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-2/igt@kms_psr@psr2_primary_page_flip.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-6/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         [SKIP][22] ([i915#5461] / [i915#658]) -> [SKIP][23] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          [SKIP][24] ([i915#5461] / [i915#658]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          [SKIP][26] ([i915#5461] / [i915#658]) -> [SKIP][27] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-rkl:          [SKIP][28] ([i915#5461] / [i915#658]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic}:
    - shard-snb:          [PASS][30] -> [TIMEOUT][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-snb5/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb6/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic.html

  * {igt@drm_mm@drm_mm@drm_test_mm_highest}:
    - shard-apl:          [PASS][32] -> [TIMEOUT][33] +1 other test timeout
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-apl1/igt@drm_mm@drm_mm@drm_test_mm_highest.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl1/igt@drm_mm@drm_mm@drm_test_mm_highest.html
    - shard-dg2:          [PASS][34] -> [TIMEOUT][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-6/igt@drm_mm@drm_mm@drm_test_mm_highest.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@drm_mm@drm_mm@drm_test_mm_highest.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@drm_mm@drm_mm@drm_test_mm_highest.html

  * {igt@kms_dsc@dsc-fractional-bpp-with-bpc}:
    - shard-mtlp:         NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * {igt@kms_plane@pixel-format@pipe-a}:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_plane@pixel-format@pipe-a.html

  * {igt@kms_pm_dc@dc3co-vpb-simulation}:
    - shard-rkl:          [SKIP][39] ([i915#658]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * {igt@kms_pm_dc@dc5-psr}:
    - shard-dg2:          [SKIP][41] ([i915#658]) -> [SKIP][42] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-6/igt@kms_pm_dc@dc5-psr.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_pm_dc@dc5-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html

  * {igt@kms_pm_dc@dc6-psr}:
    - shard-dg1:          [SKIP][44] ([i915#658]) -> [SKIP][45] +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         [SKIP][46] ([i915#658]) -> [SKIP][47] +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-4/igt@kms_pm_dc@dc6-psr.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:
    - shard-snb:          NOTRUN -> [TIMEOUT][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb4/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html

  * {igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:
    - shard-rkl:          [PASS][49] -> [TIMEOUT][50] +1 other test timeout
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html

  * {igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled}:
    - shard-dg1:          [PASS][51] -> [TIMEOUT][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-15/igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-tglu:         [PASS][53] -> [TIMEOUT][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-glk:          [PASS][55] -> [TIMEOUT][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13873_full and IGTPW_10183_full:

### New IGT tests (69) ###

  * igt@kms_psr@pr_basic:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_blt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_cpu:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_move:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_onoff:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_render:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_dpms:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_no_drrs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_blt:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_cpu:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_gtt:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_page_flip:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_render:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_blt:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_cpu:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_gtt:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_move:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_onoff:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_suspend:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_basic@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_mmap_gtt@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_plane_move@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_plane_onoff@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_render@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_dpms@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_no_drrs@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_mmap_cpu@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_mmap_gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_page_flip@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_render@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_blt@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_mmap_cpu@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_mmap_gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_plane_onoff@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_suspend@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10183_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#8411])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-rkl:          [PASS][58] -> [SKIP][59] ([i915#8411])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#8411])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#9318])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#8414]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#8414]) +11 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@drm_fdinfo@busy@ccs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][64] -> [FAIL][65] ([i915#7742])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@fbdev@pan:
    - shard-rkl:          [PASS][66] -> [SKIP][67] ([i915#2582]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-2/igt@fbdev@pan.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@fbdev@pan.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3281]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#7697])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gem_basic@multigpu-create-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#7697])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#9323])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][72] ([i915#7297])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#6335])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          NOTRUN -> [FAIL][74] ([i915#6268])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@ccs0:
    - shard-mtlp:         [PASS][75] -> [ABORT][76] ([i915#8213] / [i915#9414])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-8/igt@gem_ctx_isolation@preservation-s3@ccs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@gem_ctx_isolation@preservation-s3@ccs0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([fdo#109314])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#1099])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb1/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#8555])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-mtlp:         [PASS][80] -> [ABORT][81] ([i915#9414]) +1 other test abort
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#280]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][83] -> [FAIL][84] ([i915#5784])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-19/igt@gem_eio@reset-stress.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4771])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4812])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4036])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#4525])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4812]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#6334])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#6334])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-apl:          NOTRUN -> [FAIL][92] ([i915#9606])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl1/igt@gem_exec_capture@many-4k-zero.html
    - shard-tglu:         NOTRUN -> [FAIL][93] ([i915#9606])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-3/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][94] -> [FAIL][95] ([i915#2846])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#4473] / [i915#4771])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][97] ([i915#2842])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk9/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][98] ([i915#2842]) +3 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3539])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [PASS][100] -> [FAIL][101] ([i915#2842])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3539] / [i915#4852]) +5 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#3539] / [i915#4852]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#7697]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@gem_exec_gttfill@multigpu-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#7697]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([fdo#109283] / [i915#5107])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html
    - shard-rkl:          NOTRUN -> [SKIP][107] ([fdo#109283])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([fdo#112283])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_exec_params@secure-non-root.html
    - shard-rkl:          NOTRUN -> [SKIP][109] ([fdo#112283])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#3281]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          [PASS][111] -> [SKIP][112] ([i915#3281]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3281]) +11 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#3281]) +15 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4537] / [i915#4812]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4860]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4860])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_gtt_cpu_tlb:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4077]) +9 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@gem_gtt_cpu_tlb.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#4613]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-apl:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#4613]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#4613]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][122] ([i915#4936] / [i915#5493])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          [PASS][123] -> [TIMEOUT][124] ([i915#5493])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk:          NOTRUN -> [SKIP][125] ([fdo#109271] / [i915#4613]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk9/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#8289])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#8289])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#284])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4083])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([fdo#111656])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#4077]) +13 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#4083]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4083]) +8 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#3282]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          [PASS][135] -> [SKIP][136] ([i915#3282]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@bench:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#3282])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@gem_pread@bench.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][138] ([i915#2658])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#3282]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#4270]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-1/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#4270]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4270]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#4270]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#4270])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][145] ([fdo#109271]) +101 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#768]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#8428]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#8411]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#4079]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#4079])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#4885])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4077]) +19 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3282]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4879])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3297]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_userptr_blits@coherency-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][156] ([fdo#110542])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3323])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3297])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#3297] / [i915#4880])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#3297]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gen3_render_linear_blits:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([fdo#109289]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#109289]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([fdo#109289]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([fdo#109289])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [PASS][165] -> [SKIP][166] ([i915#2527])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-large:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#2856]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#2527]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#2527]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#2856]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@load:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#6227])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][172] -> [ABORT][173] ([i915#8489] / [i915#8668])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#8399])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#6590])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#6590])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([fdo#109293] / [fdo#109506])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#6621]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#6621])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#8925])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#8925]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#4387])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#4387])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#6188])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([fdo#109303])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([fdo#109302])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#4212]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#4212])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#5190])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4215] / [i915#5190])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#4212]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [FAIL][192] ([i915#8247]) +3 other tests fail
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#1845] / [i915#4098]) +29 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#5286]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([fdo#111615] / [i915#5286])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][196] -> [FAIL][197] ([i915#5138])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#4538] / [i915#5286]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][199] ([i915#5138])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([fdo#111614] / [i915#3638]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([fdo#111614]) +5 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([fdo#111614]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([fdo#111614])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([fdo#111615]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#5190]) +20 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [PASS][206] -> [FAIL][207] ([i915#3743])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#4538] / [i915#5190]) +10 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([fdo#111615])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#4538]) +4 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([fdo#111615])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([fdo#110723]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#4087] / [i915#7213]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#3742])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#4087]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([fdo#111827])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([fdo#111827])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([fdo#111827])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([fdo#111827]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#7828]) +10 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#7828]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#7828]) +12 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#7828]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#7828]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma:
    - shard-rkl:          NOTRUN -> [FAIL][225] ([i915#6892]) +1 other test fail
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma.html

  * igt@kms_color@degamma@pipe-a:
    - shard-rkl:          [PASS][226] -> [SKIP][227] ([i915#4098]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-6/igt@kms_color@degamma@pipe-a.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_color@degamma@pipe-a.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][228] ([i915#7173]) +1 other test timeout
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#3299])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#7116])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#6944] / [i915#7116] / [i915#7118])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@lic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][232] ([i915#7173])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl2/igt@kms_content_protection@lic@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#7118])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#3359])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#3359]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#3555])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3359])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#3359])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#3555] / [i915#8814])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([fdo#111767] / [fdo#111825]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([fdo#111825]) +11 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#4103] / [i915#4213] / [i915#5608])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#4103])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-rkl:          [PASS][244] -> [SKIP][245] ([i915#1845] / [i915#4098]) +16 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#3546]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-apl:          NOTRUN -> [SKIP][247] ([fdo#109271] / [fdo#111767]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([fdo#109274] / [i915#5354]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][250] -> [FAIL][251] ([i915#2346])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#4103] / [i915#4213])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#9226] / [i915#9261]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#9227])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#9227])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#9226] / [i915#9261]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8827])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#8588])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#3555]) +7 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#8812])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#3840])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#3555] / [i915#3840])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#3555] / [i915#3840])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([fdo#110189] / [i915#3955])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([fdo#109274]) +12 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([fdo#111767] / [i915#3637])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-snb:          NOTRUN -> [SKIP][267] ([fdo#109271] / [fdo#111767])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][268] -> [INCOMPLETE][269] ([i915#6035])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#3637]) +5 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#3637] / [i915#4098]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#2587] / [i915#2672]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8810])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#2587] / [i915#2672])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#2672] / [i915#3555]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#2672]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#8810])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#2672]) +6 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#2672]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#2672] / [i915#3555])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#8708]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#5354]) +53 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#8708]) +38 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#1849] / [i915#4098]) +17 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([fdo#111825]) +21 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([fdo#111825] / [i915#1825]) +35 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          [PASS][287] -> [SKIP][288] ([i915#1849] / [i915#4098]) +8 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([fdo#109280]) +9 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#1825]) +18 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([fdo#110189]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#3458]) +30 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#3458]) +10 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#3023]) +20 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#8708]) +8 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][296] ([fdo#109271]) +152 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][297] ([fdo#109271]) +155 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#433])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#3555] / [i915#8228])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#3555] / [i915#8228])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#3555] / [i915#8228]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#3555] / [i915#8228])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#3555] / [i915#4098])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#4816])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#6301])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([fdo#109289]) +10 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#4098] / [i915#8825])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#3555]) +13 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][309] ([i915#8292])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][310] ([i915#8292])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#5235]) +7 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#8152])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#6953] / [i915#8152])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#5235]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#5235]) +11 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#5235]) +11 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#6524]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#6524] / [i915#6805])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_prime@d3hot.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-rkl:          [PASS][320] -> [SKIP][321] ([i915#1849])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-4/igt@kms_properties@crtc-properties-legacy.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([fdo#111068])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([fdo#111068])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([fdo#111068])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#4235]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#4235] / [i915#5190])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#4235])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([fdo#111615] / [i915#5289])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#3555])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#3555] / [i915#4098])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#8623])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#8623])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-tglu:         [PASS][333] -> [FAIL][334] ([i915#9196])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#4098]) +14 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_vrr@flip-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#3555] / [i915#8808])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#2437]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#2437])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#2437]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][340] ([fdo#109271] / [i915#2437])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [PASS][341] -> [SKIP][342] ([i915#2436])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#2434])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#2433])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#8850])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#8850])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          [PASS][347] -> [SKIP][348] ([fdo#109295] / [i915#3291] / [i915#3708])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@prime_vgem@basic-fence-read.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#3708])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-1/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#3708] / [i915#4077])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#3708])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#3708])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@prime_vgem@fence-write-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#4818])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@create-perfmon-0:
    - shard-tglu:         NOTRUN -> [SKIP][354] ([fdo#109315] / [i915#2575]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-4/igt@v3d/v3d_perfmon@create-perfmon-0.html

  * igt@v3d/v3d_perfmon@destroy-valid-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][355] ([i915#2575]) +6 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#2575]) +21 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@v3d/v3d_submit_csd@valid-multisync-submission:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([fdo#109315]) +14 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@v3d/v3d_submit_csd@valid-multisync-submission.html

  * igt@v3d/v3d_wait_bo@bad-bo:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#2575]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@v3d/v3d_wait_bo@bad-bo.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#7711]) +9 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_perfmon@create-perfmon-0:
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#7711]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@vc4/vc4_perfmon@create-perfmon-0.html

  * igt@vc4/vc4_perfmon@get-values-invalid-pointer:
    - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#7711]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-6/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#2575]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html

  * igt@vc4/vc4_wait_bo@used-bo-0ns:
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#7711]) +3 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@vc4/vc4_wait_bo@used-bo-0ns.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries_display_on:
    - shard-mtlp:         [ABORT][364] ([i915#9414]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_on.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-1/igt@debugfs_test@read_all_entries_display_on.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-rkl:          [FAIL][366] ([i915#4778]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][368] ([i915#7297]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * {igt@gem_compute@compute-square}:
    - shard-rkl:          [SKIP][370] ([i915#9310]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@gem_compute@compute-square.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@gem_compute@compute-square.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [ABORT][372] ([i915#7975] / [i915#8213]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-2/igt@gem_eio@hibernate.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-snb:          [INCOMPLETE][374] -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][376] ([i915#3281]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][378] ([i915#8797] / [i915#9275]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - shard-dg1:          [FAIL][380] ([fdo#103375]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-15/igt@gem_exec_suspend@basic-s3@lmem0.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][382] ([i915#3282]) -> [PASS][383] +4 other tests pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [INCOMPLETE][384] ([i915#5566]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [SKIP][386] ([i915#2527]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - shard-rkl:          [SKIP][388] ([i915#9588]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-dg1:          [FAIL][390] ([i915#3591]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-glk:          [DMESG-WARN][392] ([i915#118]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk6/igt@i915_pm_rps@thresholds-idle-park@gt0.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk3/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_selftest@live@hangcheck:
    - shard-dg1:          [ABORT][394] ([i915#9413]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-19/igt@i915_selftest@live@hangcheck.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-mtlp:         [FAIL][396] ([i915#5138]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-4/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [FAIL][398] ([i915#3743]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * {igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs}:
    - shard-rkl:          [SKIP][400] ([i915#4098]) -> [PASS][401] +7 other tests pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * {igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc}:
    - shard-rkl:          [SKIP][402] ([fdo#109315]) -> [PASS][403] +19 other tests pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][404] -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-rkl:          [SKIP][406] ([i915#1845] / [i915#4098]) -> [PASS][407] +16 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][408] ([i915#2346]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-dg2:          [FAIL][410] ([i915#6880]) -> [PASS][411] +2 other tests pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - shard-rkl:          [SKIP][412] ([i915#1849] / [i915#4098]) -> [PASS][413] +6 other tests pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          [ABORT][414] ([i915#180]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_101

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/index.html

--===============6710829266000682194==
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
<tr><td><b>Series:</b></td><td>extend kms_psr test to validate pr (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125379/">https://patchwork.freedesktop.org/series/125379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13873_full -&gt; IGTPW_10183_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10183_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10183_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/index.html</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): shard-tglu0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10183_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_plane_move} (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_psr@pr_cursor_plane_move.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_plane_onoff} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_psr@pr_sprite_plane_onoff.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_suspend} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@kms_psr@pr_suspend.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_mmap_gtt} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_psr@psr_cursor_mmap_gtt.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +5 other tests skip</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +6 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> ([i915#1072]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-2/igt@kms_psr@psr2_dpms.html">SKIP</a> ([i915#1072]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_psr@psr2_dpms.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-16/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([i915#1072] / [i915#4078]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> +18 other tests skip</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-2/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#110189]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-6/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> +17 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#5461] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#5461] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#5461] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#5461] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic}:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-snb5/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb6/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@drm_mm@drm_mm@drm_test_mm_highest}:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-apl1/igt@drm_mm@drm_mm@drm_test_mm_highest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl1/igt@drm_mm@drm_mm@drm_test_mm_highest.html">TIMEOUT</a> +1 other test timeout</p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-6/igt@drm_mm@drm_mm@drm_test_mm_highest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@drm_mm@drm_mm@drm_test_mm_highest.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@drm_mm@drm_mm@drm_test_mm_highest.html">TIMEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-fractional-bpp-with-bpc}:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format@pipe-a}:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_plane@pixel-format@pipe-a.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc3co-vpb-simulation}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc5-psr}:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc6-psr}:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@kms_pm_dc@dc6-psr.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a> +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb4/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-15/igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13873_full and IGTPW_10183_full:</p>
<h3>New IGT tests (69)</h3>
<ul>
<li>
<p>igt@kms_psr@pr_basic:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_blt:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_move:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_render:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_dpms:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_no_drrs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_blt:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_page_flip:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_render:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_blt:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_move:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_suspend:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_blt:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_blt@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_render:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_render@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_dpms:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_dpms@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_no_drrs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_no_drrs@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_blt:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_blt@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_render:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_render@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_blt:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_blt@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_move:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_move@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_render:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_suspend:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_suspend@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10183_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> ([i915#8414]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@drm_fdinfo@busy@ccs0.html">SKIP</a> ([i915#8414]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-2/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@fbdev@pan.html">SKIP</a> ([i915#2582]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-8/igt@gem_ctx_isolation@preservation-s3@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@gem_ctx_isolation@preservation-s3@ccs0.html">ABORT</a> ([i915#8213] / [i915#9414])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb1/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process@render:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html">ABORT</a> ([i915#9414]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-19/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl2/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([fdo#109271] / [i915#6334])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl1/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-3/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@gem_exec_fair@basic-deadline.html">SKIP</a> ([i915#4473] / [i915#4771])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk9/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_exec_fair@basic-pace.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([i915#3539] / [i915#4852]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +2 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283] / [i915#5107])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-read-noreloc.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html">SKIP</a> ([i915#3281]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_gtt_cpu_tlb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@gem_gtt_cpu_tlb.html">SKIP</a> ([i915#4077]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk9/igt@gem_lmem_swapping@verify.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@gem_pread@bench.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk9/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_pwrite@basic-self.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-1/igt@gem_pxp@create-regular-buffer.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +5 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> ([fdo#109271]) +101 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> ([i915#768]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#8411]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_tiled_blits@basic.html">SKIP</a> ([i915#4077]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> ([fdo#109289]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_atomic_transition@modeset-transition-fencing.html">SKIP</a> ([i915#1845] / [i915#4098]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#111615] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#110723]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#4087] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> ([fdo#111827]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> ([i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) +12 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma.html">FAIL</a> ([i915#6892]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-6/igt@kms_color@degamma@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_color@degamma@pipe-a.html">SKIP</a> ([i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html">TIMEOUT</a> ([i915#7173]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_content_protection@lic.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl2/igt@kms_content_protection@lic@pipe-a-dp-1.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#111767] / [fdo#111825]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#111825]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([i915#3546]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#109271] / [fdo#111767]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> ([fdo#109274] / [i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555] / [i915#8827])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([fdo#110189] / [i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#111767] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#109271] / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> ([i915#6035])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html">SKIP</a> ([i915#3637] / [i915#4098]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +38 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#1849] / [i915#4098]) +17 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#111825]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#111825] / [i915#1825]) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> ([i915#1849] / [i915#4098]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#109280]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> ([fdo#110189]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +30 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +10 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#3023]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +152 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> ([i915#3555] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> ([i915#4098] / [i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#5235]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-4/igt@kms_properties@crtc-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-14/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#111068])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#111068])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> ([i915#4235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#4235])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@kms_vblank@wait-forked-busy-hang.html">SKIP</a> ([i915#4098]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-8/igt@kms_vrr@flip-basic.html">SKIP</a> ([i915#3555] / [i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-17/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([fdo#109295] / [i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-1/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-15/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-4/igt@v3d/v3d_perfmon@create-perfmon-0.html">SKIP</a> ([fdo#109315] / [i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-5/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html">SKIP</a> ([i915#2575]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-2/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> ([i915#2575]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@valid-multisync-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@v3d/v3d_submit_csd@valid-multisync-submission.html">SKIP</a> ([fdo#109315]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@bad-bo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@v3d/v3d_wait_bo@bad-bo.html">SKIP</a> ([i915#2575]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> ([i915#7711]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@vc4/vc4_perfmon@create-perfmon-0.html">SKIP</a> ([i915#7711]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@get-values-invalid-pointer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-6/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-0ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-18/igt@vc4/vc4_wait_bo@used-bo-0ns.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries_display_on:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_on.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-1/igt@debugfs_test@read_all_entries_display_on.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html">FAIL</a> ([i915#4778]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_compute@compute-square}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@gem_compute@compute-square.html">SKIP</a> ([i915#9310]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-6/igt@gem_compute@compute-square.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-2/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-11/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-snb2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#8797] / [i915#9275]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-15/igt@gem_exec_suspend@basic-s3@lmem0.html">FAIL</a> ([fdo#103375]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-16/igt@gem_exec_suspend@basic-s3@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-apl4/igt@gen9_exec_parse@allowed-single.html">INCOMPLETE</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP</a> ([i915#9588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk6/igt@i915_pm_rps@thresholds-idle-park@gt0.html">DMESG-WARN</a> ([i915#118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk3/igt@i915_pm_rps@thresholds-idle-park@gt0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg1-19/igt@i915_selftest@live@hangcheck.html">ABORT</a> ([i915#9413]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg1-13/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-4/igt@kms_big_fb@linear-8bpp-rotate-0.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-7/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">PASS</a> +2 other tests pass</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10183/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">PASS</a> +6 other tests pass</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13873/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">ABORT</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_101">PASS</a></li>
</ul>
</li>
</ul>

</body>
</html>

--===============6710829266000682194==--
