Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5111214507217779394=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Tue, 10 Oct 2023 19:11:03 -0000
Message-ID: <169696506301.28097.5103811173377671198@emeril.freedesktop.org>
References: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgS3VuaXQg?=
 =?utf-8?q?fixes_and_improvements_=28rev2=29?=
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

--===============5111214507217779394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Kunit fixes and improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/124554/
State : success

== Summary ==

CI Bug Log - changes from IGT_7522_full -> IGTPW_9951_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between IGT_7522_full and IGTPW_9951_full:

### New IGT tests (114) ###

  * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_optimistic:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_range:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_smoke:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_align:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_align32:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_align64:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_bottomup:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_color:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_color_evict:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_color_evict_range:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_debug:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_evict:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_evict_range:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_frag:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_highest:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_init:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_insert:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_insert_range:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_lowest:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_replace:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_reserve:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@drm_mm@drm_mm@drm_test_mm_topdown:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_extra_and_option:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_dvi:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_hdmi:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_not_digital:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_e_only:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_freestanding_force_e_and_options:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_freestanding_options:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_hmirror:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_margin_options:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_multiple_options:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_bpp:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_bpp_option:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_option:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_panel_orientation:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_off:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on_analog:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on_digital:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_interlaced:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_margins:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_margins_force_on:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_rblank:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_refresh:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa_margins:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa_rblank:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_0:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_180:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_270:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_90:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_vmirror:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_one_intersect:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_one_outside:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_src_moved:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_fractional_src:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_fractional_src_moved:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_not_visible:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_src_moved:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_fractional_src:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_fractional_src_moved:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_fractional_src:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_outside_fractional_src:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_outside_src:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_dp_mst_helper:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_calc_pbn_mode:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_height_invalid:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_height_one_plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_height_three_plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_height_tiled:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_height_two_plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_width_invalid:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_width_one_plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_width_three_plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_width_tiled:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_block_width_two_plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_min_pitch_invalid:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_16bpp:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_32bpp:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_8bpp:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_framebuffer:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_plane_helper:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9951_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][1] ([i915#8411]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8414]) +11 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][3] -> [FAIL][4] ([i915#7742])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#9323])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][6] -> [INCOMPLETE][7] ([i915#7297])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#7697])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8562])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([fdo#109314])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-5/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - shard-mtlp:         [PASS][11] -> [FAIL][12] ([i915#2410]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8555])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#280])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@suspend:
    - shard-mtlp:         [PASS][16] -> [FAIL][17] ([i915#7052])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-3/igt@gem_eio@suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@gem_eio@suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][18] -> [FAIL][19] ([i915#5784]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-18/igt@gem_eio@unwedge-stress.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-16/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#4525])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3539] / [i915#4852])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-15/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#3539]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [PASS][24] -> [FAIL][25] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3281]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#3281]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3281]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4537] / [i915#4812]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [PASS][30] -> [INCOMPLETE][31] ([i915#9275])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][32] ([i915#7975] / [i915#8213])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
    - shard-dg1:          [PASS][33] -> [ABORT][34] ([i915#7975] / [i915#8213])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-17/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4860]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_gtt_cpu_tlb:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4077]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@gem_gtt_cpu_tlb.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4613])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#4613]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3282])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-17/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#8289])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4077]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-15/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-snb:          [PASS][42] -> [INCOMPLETE][43] ([i915#5161])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-snb7/igt@gem_mmap_gtt@fault-concurrent-x.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4083]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4083]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3282])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][47] ([i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-2/igt@gem_pread@exhaustion.html

  * igt@gem_pread@uncached:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3282])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@gem_pread@uncached.html

  * igt@gem_pwrite_snooped:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3282]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4270]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#4270]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4270])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4270]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#8428])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4077]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@gem_tiled_blits@basic.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3323])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3297]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@huge-split:
    - shard-rkl:          [PASS][58] -> [FAIL][59] ([i915#3318])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-2/igt@gem_userptr_blits@huge-split.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@gem_userptr_blits@huge-split.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> [FAIL][60] ([i915#3318])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_mixed_blits:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([fdo#109289]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([fdo#109289])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-16/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#2527])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#2856]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#2856]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@gen9_exec_parse@secure-batches.html
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#2527])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [PASS][67] -> [FAIL][68] ([i915#8456]) +2 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-8/igt@i915_hangman@detector@vcs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#8399])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#1397])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [PASS][71] -> [SKIP][72] ([i915#1397])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][73] -> [SKIP][74] ([i915#1397])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#6188])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [PASS][76] -> [DMESG-FAIL][77] ([i915#5334])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][78] -> [FAIL][79] ([fdo#103375])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-dg2:          [PASS][80] -> [FAIL][81] ([fdo#103375]) +2 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-6/igt@i915_suspend@forcewake.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-5/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4212])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [FAIL][83] ([i915#8247]) +3 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#404])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([fdo#111614])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#5286]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#5286])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][88] -> [FAIL][89] ([i915#5138]) +2 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([fdo#111614] / [i915#3638])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([fdo#111614]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-9/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([fdo#111614]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [PASS][93] -> [FAIL][94] ([i915#3743])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#5190]) +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([fdo#111615]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4538])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4538] / [i915#5190]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([fdo#110723])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#6187])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#2705])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#5354] / [i915#6095]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3734] / [i915#5354] / [i915#6095])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#5354] / [i915#6095]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3689] / [i915#5354]) +16 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#5354] / [i915#6095]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-19/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-yf_tiled_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3689] / [i915#5354] / [i915#6095]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-15/igt@kms_ccs@pipe-b-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3689] / [i915#3886] / [i915#5354]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#5354] / [i915#6095]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#3886] / [i915#5354] / [i915#6095]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-9/igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#5354]) +10 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#3742])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-10/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([fdo#111827]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([fdo#111827])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#7828]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#7828]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#7828]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#7828]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#6944] / [i915#7116] / [i915#7118])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][122] ([i915#7173])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#3299])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#3299])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#3116] / [i915#3299])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#7118])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([fdo#109279] / [i915#3359])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#3555] / [i915#8814])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#3359])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#3359])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#3555])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#3359])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][134] ([fdo#103375])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4103] / [i915#4213] / [i915#5608])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([fdo#111825]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#3546])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([fdo#109274] / [i915#5354]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@forked-move@all-pipes:
    - shard-mtlp:         [PASS][139] -> [DMESG-WARN][140] ([i915#2017])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-5/igt@kms_cursor_legacy@forked-move@all-pipes.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_cursor_legacy@forked-move@all-pipes.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#8588])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#3555]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#8812])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3555] / [i915#3840])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-19/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][145] ([i915#8912])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4881])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([fdo#109274]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-snb:          NOTRUN -> [SKIP][148] ([fdo#109271] / [fdo#111767])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-snb6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-snb:          NOTRUN -> [SKIP][149] ([fdo#109271]) +17 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-snb2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#2672]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#2672]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#2672] / [i915#3555])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([fdo#109285])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#8708]) +12 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          [PASS][155] -> [FAIL][156] ([i915#6880])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#8708]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#5354]) +27 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#1825]) +12 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#3458]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3023]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([fdo#110189])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#8708]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#3458]) +11 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([fdo#111825] / [i915#1825]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([fdo#111825]) +7 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([fdo#109280]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3555] / [i915#8228])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3555] / [i915#8228])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3555] / [i915#8228]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6301])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([fdo#109289]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][173] ([i915#8841]) +1 other test dmesg-warn
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-snb1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - shard-apl:          [PASS][174] -> [INCOMPLETE][175] ([i915#180] / [i915#9392])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#3555])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-4/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][177] ([i915#8292])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#5176] / [i915#9423]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#5176] / [i915#9423]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#5235]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#5235]) +15 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#5235]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#5235]) +19 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-15/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#658]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#658])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr@cursor_blt:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1072]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_psr@cursor_blt.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#1072] / [i915#4078])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-14/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#1072]) +6 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#4235])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([fdo#111615] / [i915#5289])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([fdo#111615] / [i915#5289])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#4098])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#4098])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#8623])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1:
    - shard-apl:          [PASS][195] -> [FAIL][196] ([i915#9196])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-apl7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-apl2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][197] ([i915#9196])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@pipe-c-wait-forked-busy-hang:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#4070] / [i915#6768])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#4070] / [i915#533] / [i915#6768])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.html

  * igt@kms_vrr@flip-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#3555] / [i915#8808])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#2437])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#7387])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@perf@global-sseu-config.html

  * igt@perf_pmu@faulting-read@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#8440])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@perf_pmu@faulting-read@gtt.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#3708])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3708] / [i915#4077])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#3708] / [i915#4077])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3708])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([fdo#109295] / [i915#3708])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#4818])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@create-perfmon-exceed:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#2575]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@v3d/v3d_perfmon@create-perfmon-exceed.html

  * igt@v3d/v3d_perfmon@create-single-perfmon:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([fdo#109315])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@v3d/v3d_perfmon@create-single-perfmon.html

  * igt@v3d/v3d_submit_csd@bad-multisync-extension:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#2575]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-16/igt@v3d/v3d_submit_csd@bad-multisync-extension.html

  * igt@v3d/v3d_submit_csd@valid-multisync-submission:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#2575]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@v3d/v3d_submit_csd@valid-multisync-submission.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#7711]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_tiling@get-after-free:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#2575])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-2/igt@vc4/vc4_tiling@get-after-free.html

  * igt@vc4/vc4_tiling@get-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#7711])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@vc4/vc4_tiling@get-bad-handle.html

  * igt@vc4/vc4_wait_bo@used-bo-0ns:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#7711]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@vc4/vc4_wait_bo@used-bo-0ns.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#7711]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][219] ([i915#7742]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ctx_persistence@engines-hang@ccs0:
    - shard-mtlp:         [ABORT][221] ([i915#9414]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@ccs0.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@ccs0.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [ABORT][223] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-tglu-10/igt@gem_eio@hibernate.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-2/igt@gem_eio@hibernate.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][225] ([i915#2846]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][227] ([i915#2842]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [FAIL][229] ([i915#2842]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@invalid-fence-array:
    - shard-mtlp:         [ABORT][231] ([i915#9262]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-4/igt@gem_exec_fence@invalid-fence-array.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@gem_exec_fence@invalid-fence-array.html

  * igt@gem_exec_fence@parallel@bcs0:
    - shard-mtlp:         [TIMEOUT][233] ([i915#9137]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-4/igt@gem_exec_fence@parallel@bcs0.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@gem_exec_fence@parallel@bcs0.html

  * igt@gem_exec_fence@parallel@rcs0:
    - shard-mtlp:         [DMESG-FAIL][235] ([i915#8962]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-4/igt@gem_exec_fence@parallel@rcs0.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@gem_exec_fence@parallel@rcs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][237] ([i915#5493]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_hangman@engine-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][239] ([i915#7069]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-7/igt@i915_hangman@engine-engine-hang@vcs0.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@i915_hangman@engine-engine-hang@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][241] ([i915#8489] / [i915#8668]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][243] ([i915#1397]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][245] ([i915#1397]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [FAIL][247] ([i915#3743]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][249] ([i915#79]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][251] ([i915#6880]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-planes:
    - shard-mtlp:         [DMESG-WARN][253] ([i915#1982]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-planes.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-a-planes.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
    - shard-glk:          [DMESG-FAIL][255] ([i915#118]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-glk7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-glk4/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html

  * {igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2}:
    - shard-rkl:          [INCOMPLETE][257] -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][259] ([i915#9196]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-dg2:          [FAIL][261] ([fdo#103375]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][263] ([fdo#110189] / [i915#3955]) -> [SKIP][264] ([i915#3955]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg1:          [SKIP][265] ([fdo#111825] / [i915#4423]) -> [SKIP][266] ([fdo#111825])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5161]: https://gitlab.freedesktop.org/drm/intel/issues/5161
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
  [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
  [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8289]: https://gitlab.freedesktop.org/drm/intel/issues/8289
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8398]: https://gitlab.freedesktop.org/drm/intel/issues/8398
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8440]: https://gitlab.freedesktop.org/drm/intel/issues/8440
  [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
  [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/intel/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8912]: https://gitlab.freedesktop.org/drm/intel/issues/8912
  [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
  [i915#9137]: https://gitlab.freedesktop.org/drm/intel/issues/9137
  [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
  [i915#9226]: https://gitlab.freedesktop.org/drm/intel/issues/9226
  [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
  [i915#9261]: https://gitlab.freedesktop.org/drm/intel/issues/9261
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
  [i915#9392]: https://gitlab.freedesktop.org/drm/intel/issues/9392
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
  [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7522 -> IGTPW_9951

  CI-20190529: 20190529
  CI_DRM_13729: fe7c35e5be39964f7c0b83899b9d5d9355848544 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9951: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/index.html
  IGT_7522: 334a1178a36a1327dc7fbba43ab16d1f3a7d887b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/index.html

--===============5111214507217779394==
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
<tr><td><b>Series:</b></td><td>Kunit fixes and improvements (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124554/">https://patchwork.freedesktop.org/series/124554/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7522_full -&gt; IGTPW_9951_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7522_full and IGTPW_9951_full:</p>
<h3>New IGT tests (114)</h3>
<ul>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_optimistic:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_range:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_smoke:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_align:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_align32:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_align64:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_bottomup:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_color:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_color_evict:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_color_evict_range:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_debug:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_evict:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_evict_range:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_frag:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_highest:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_init:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_insert:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_insert_range:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_lowest:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_replace:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_reserve:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm@drm_test_mm_topdown:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_bpp_extra_and_option:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_extra_and_option:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_dvi:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_hdmi:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_d_only_not_digital:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_force_e_only:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_freestanding_force_e_and_options:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_freestanding_options:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_hmirror:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_margin_options:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_multiple_options:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_bpp:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_bpp_option:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_name_option:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_panel_orientation:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_off:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on_analog:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on_digital:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_interlaced:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_margins:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_margins_force_on:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_rblank:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_refresh:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa_margins:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_vesa_rblank:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_180:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_270:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_rotate_90:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_vmirror:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_not_visible:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_one_intersect:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_one_outside:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_damage_src_moved:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_fractional_src:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_fractional_src_moved:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_fb:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_not_visible:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_src_moved:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_fractional_src:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_fractional_src_moved:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_fractional_src:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_outside_fractional_src:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_outside_src:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_dp_mst_helper:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_calc_pbn_mode:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_height_invalid:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_height_one_plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_height_three_plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_height_tiled:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_height_two_plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_width_invalid:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_width_one_plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_width_three_plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_width_tiled:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_block_width_two_plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_min_pitch_invalid:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_16bpp:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_32bpp:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_8bpp:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_min_pitch_tiled:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane_helper:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9951_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7297">i915#7297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-3/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@gem_eio@suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7052">i915#7052</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-18/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-16/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-15/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@gem_exec_fair@basic-pace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-17/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_gtt_cpu_tlb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@gem_gtt_cpu_tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-17/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-15/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-snb7/igt@gem_mmap_gtt@fault-concurrent-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5161">i915#5161</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@gem_mmap_wc@write-gtt-read-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-2/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@gem_pread@uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@gem_pwrite_snooped.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-2/igt@gem_userptr_blits@huge-split.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@gem_userptr_blits@huge-split.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@gen3_render_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-16/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-8/igt@i915_hangman@detector@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8456">i915#8456</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-6/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-5/igt@i915_suspend@forcewake.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/404">i915#404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-9/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_ccs@pipe-a-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-19/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-15/igt@kms_ccs@pipe-b-ccs-on-another-bo-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-9/igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-10/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-5/igt@kms_cursor_legacy@forked-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_cursor_legacy@forked-move@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8588">i915#8588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-19/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8912">i915#8912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-3/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-snb6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-snb2/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-18/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-snb1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9392">i915#9392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-4/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-15/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_psr@cursor_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-14/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-apl7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-apl2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-1/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@faulting-read@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-4/igt@perf_pmu@faulting-read@gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8440">i915#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@v3d/v3d_perfmon@create-perfmon-exceed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@v3d/v3d_perfmon@create-single-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-extension:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-16/igt@v3d/v3d_submit_csd@bad-multisync-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@valid-multisync-submission:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-6/igt@v3d/v3d_submit_csd@valid-multisync-submission.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-2/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-after-free:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-2/igt@vc4/vc4_tiling@get-after-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@vc4/vc4_tiling@get-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-0ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-12/igt@vc4/vc4_wait_bo@used-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@ccs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8398">i915#8398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-2/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@invalid-fence-array:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-4/igt@gem_exec_fence@invalid-fence-array.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@gem_exec_fence@invalid-fence-array.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-4/igt@gem_exec_fence@parallel@bcs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9137">i915#9137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@gem_exec_fence@parallel@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-4/igt@gem_exec_fence@parallel@rcs0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8962">i915#8962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-2/igt@gem_exec_fence@parallel@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-7/igt@i915_hangman@engine-engine-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@i915_hangman@engine-engine-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8489">i915#8489</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-planes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-glk7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-glk4/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg2-5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg2-1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7522/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7522 -&gt; IGTPW_9951</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13729: fe7c35e5be39964f7c0b83899b9d5d9355848544 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9951: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9951/index.html<br />
  IGT_7522: 334a1178a36a1327dc7fbba43ab16d1f3a7d887b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5111214507217779394==--
