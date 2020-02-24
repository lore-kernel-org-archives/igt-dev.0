Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 01:23:25 -0000
Message-ID: <158250740545.28362.1759226908859104732@emeril.freedesktop.org>
References: <20200220125207.16423-1-petri.latvala@intel.com>
In-Reply-To: <20200220125207.16423-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib=3A_Update_selftests_to_use?=
 =?utf-8?q?_dynamic_subtests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib: Update selftests to use dynamic subtests
URL   : https://patchwork.freedesktop.org/series/73710/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7973_full -> IGTPW_4193_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4193_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4193_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4193_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_selftest@live@gt_lrc} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-tglb6/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live_coherency:
    - shard-tglb:         [PASS][2] -> [SKIP][3] +101 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb2/igt@i915_selftest@live_coherency.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-tglb3/igt@i915_selftest@live_coherency.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-apl:          [PASS][4] -> [DMESG-WARN][5] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl7/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-apl3/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-kbl:          [PASS][6] -> [DMESG-WARN][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_selftest@drm_rect_clip_scaled_signed_vs_unsigned:
    - shard-iclb:         [PASS][8] -> [SKIP][9] +101 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb7/igt@kms_selftest@drm_rect_clip_scaled_signed_vs_unsigned.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb6/igt@kms_selftest@drm_rect_clip_scaled_signed_vs_unsigned.html

  
#### Warnings ####

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [DMESG-FAIL][10] ([i915#1233]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb2/igt@i915_selftest@live_gt_lrc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-tglb3/igt@i915_selftest@live_gt_lrc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_whisper@basic-contexts-forked}:
    - shard-iclb:         [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb5/igt@gem_exec_whisper@basic-contexts-forked.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb1/igt@gem_exec_whisper@basic-contexts-forked.html

  * {igt@i915_selftest@perf_region}:
    - shard-tglb:         [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb2/igt@i915_selftest@perf_region.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-tglb3/igt@i915_selftest@perf_region.html
    - shard-iclb:         [PASS][16] -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb7/igt@i915_selftest@perf_region.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb6/igt@i915_selftest@perf_region.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7973_full and IGTPW_4193_full:

### New IGT tests (110) ###

  * igt@dmabuf@all:
    - Statuses :
    - Exec time: [None] s

  * igt@dmabuf@all@dma_fence:
    - Statuses : 5 pass(s)
    - Exec time: [0.14, 0.18] s

  * igt@dmabuf@all@sanitycheck:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@drm_mm@all:
    - Statuses :
    - Exec time: [None] s

  * igt@drm_mm@all@align:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@drm_mm@all@align32:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@drm_mm@all@align64:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@drm_mm@all@bottomup:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.29] s

  * igt@drm_mm@all@color:
    - Statuses : 7 pass(s)
    - Exec time: [0.54, 4.24] s

  * igt@drm_mm@all@color_evict:
    - Statuses : 7 pass(s)
    - Exec time: [0.62, 4.41] s

  * igt@drm_mm@all@color_evict_range:
    - Statuses : 7 pass(s)
    - Exec time: [0.46, 3.85] s

  * igt@drm_mm@all@debug:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@drm_mm@all@evict:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 2.22] s

  * igt@drm_mm@all@evict_range:
    - Statuses : 7 pass(s)
    - Exec time: [0.34, 1.28] s

  * igt@drm_mm@all@highest:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@drm_mm@all@init:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@drm_mm@all@insert:
    - Statuses : 7 pass(s)
    - Exec time: [8.28, 19.36] s

  * igt@drm_mm@all@insert_range:
    - Statuses : 7 pass(s)
    - Exec time: [4.54, 18.23] s

  * igt@drm_mm@all@lowest:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@drm_mm@all@replace:
    - Statuses : 7 pass(s)
    - Exec time: [8.28, 19.37] s

  * igt@drm_mm@all@reserve:
    - Statuses : 7 pass(s)
    - Exec time: [0.28, 0.86] s

  * igt@drm_mm@all@sanitycheck:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@drm_mm@all@topdown:
    - Statuses : 7 pass(s)
    - Exec time: [0.09, 0.29] s

  * igt@i915_selftest@live:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@live@active:
    - Statuses : 5 pass(s)
    - Exec time: [0.45, 1.17] s

  * igt@i915_selftest@live@blt:
    - Statuses : 5 pass(s)
    - Exec time: [4.46, 8.37] s

  * igt@i915_selftest@live@client:
    - Statuses : 5 pass(s)
    - Exec time: [1.46, 2.51] s

  * igt@i915_selftest@live@coherency:
    - Statuses : 5 pass(s)
    - Exec time: [1.10, 3.92] s

  * igt@i915_selftest@live@dmabuf:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 0.76] s

  * igt@i915_selftest@live@evict:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 6.50] s

  * igt@i915_selftest@live@execlists:
    - Statuses : 5 pass(s)
    - Exec time: [1.10, 36.28] s

  * igt@i915_selftest@live@gem:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 1.17] s

  * igt@i915_selftest@live@gem_contexts:
    - Statuses : 5 pass(s)
    - Exec time: [10.12, 19.55] s

  * igt@i915_selftest@live@gt_contexts:
    - Statuses : 6 pass(s)
    - Exec time: [0.48, 1.21] s

  * igt@i915_selftest@live@gt_engines:
    - Statuses : 6 pass(s)
    - Exec time: [0.40, 1.14] s

  * igt@i915_selftest@live@gt_heartbeat:
    - Statuses : 5 pass(s)
    - Exec time: [0.57, 1.19] s

  * igt@i915_selftest@live@gt_lrc:
    - Statuses : 1 incomplete(s) 5 pass(s)
    - Exec time: [0.0, 3.20] s

  * igt@i915_selftest@live@gt_mocs:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 2.43] s

  * igt@i915_selftest@live@gt_pm:
    - Statuses : 5 pass(s)
    - Exec time: [1.29, 1.93] s

  * igt@i915_selftest@live@gt_timelines:
    - Statuses : 6 pass(s)
    - Exec time: [4.28, 8.28] s

  * igt@i915_selftest@live@gtt:
    - Statuses : 5 pass(s)
    - Exec time: [9.79, 11.05] s

  * igt@i915_selftest@live@hangcheck:
    - Statuses : 5 pass(s)
    - Exec time: [3.77, 26.47] s

  * igt@i915_selftest@live@hugepages:
    - Statuses : 5 pass(s)
    - Exec time: [1.74, 6.04] s

  * igt@i915_selftest@live@late_gt_pm:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 1.10] s

  * igt@i915_selftest@live@memory_region:
    - Statuses : 5 pass(s)
    - Exec time: [0.47, 1.07] s

  * igt@i915_selftest@live@mman:
    - Statuses : 5 pass(s)
    - Exec time: [4.45, 8.69] s

  * igt@i915_selftest@live@objects:
    - Statuses : 5 pass(s)
    - Exec time: [1.07, 3.08] s

  * igt@i915_selftest@live@perf:
    - Statuses : 5 pass(s)
    - Exec time: [0.47, 1.26] s

  * igt@i915_selftest@live@requests:
    - Statuses : 5 pass(s)
    - Exec time: [6.44, 7.51] s

  * igt@i915_selftest@live@reset:
    - Statuses : 5 pass(s)
    - Exec time: [0.40, 1.02] s

  * igt@i915_selftest@live@sanitycheck:
    - Statuses : 6 pass(s)
    - Exec time: [0.57, 1.89] s

  * igt@i915_selftest@live@uncore:
    - Statuses : 6 pass(s)
    - Exec time: [0.50, 1.15] s

  * igt@i915_selftest@live@vma:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 0.78] s

  * igt@i915_selftest@live@workarounds:
    - Statuses : 6 pass(s)
    - Exec time: [0.52, 1.23] s

  * igt@i915_selftest@mock:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@mock@buddy:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 11.04] s

  * igt@i915_selftest@mock@contexts:
    - Statuses : 7 pass(s)
    - Exec time: [0.18, 0.62] s

  * igt@i915_selftest@mock@dmabuf:
    - Statuses : 7 pass(s)
    - Exec time: [0.17, 0.58] s

  * igt@i915_selftest@mock@engine:
    - Statuses : 7 pass(s)
    - Exec time: [0.10, 0.46] s

  * igt@i915_selftest@mock@evict:
    - Statuses : 7 pass(s)
    - Exec time: [0.68, 3.51] s

  * igt@i915_selftest@mock@fence:
    - Statuses : 7 pass(s)
    - Exec time: [7.32, 8.07] s

  * igt@i915_selftest@mock@gtt:
    - Statuses : 7 pass(s)
    - Exec time: [2.49, 4.48] s

  * igt@i915_selftest@mock@hugepages:
    - Statuses : 7 pass(s)
    - Exec time: [0.94, 1.54] s

  * igt@i915_selftest@mock@memory_region:
    - Statuses : 6 pass(s)
    - Exec time: [1.26, 4.57] s

  * igt@i915_selftest@mock@objects:
    - Statuses : 7 pass(s)
    - Exec time: [0.17, 0.58] s

  * igt@i915_selftest@mock@phys:
    - Statuses : 7 pass(s)
    - Exec time: [0.15, 0.58] s

  * igt@i915_selftest@mock@requests:
    - Statuses : 7 pass(s)
    - Exec time: [1.84, 2.66] s

  * igt@i915_selftest@mock@sanitycheck:
    - Statuses : 7 pass(s)
    - Exec time: [0.09, 0.46] s

  * igt@i915_selftest@mock@scatterlist:
    - Statuses : 7 pass(s)
    - Exec time: [1.10, 1.45] s

  * igt@i915_selftest@mock@syncmap:
    - Statuses : 7 pass(s)
    - Exec time: [2.29, 2.49] s

  * igt@i915_selftest@mock@timelines:
    - Statuses : 7 pass(s)
    - Exec time: [1.62, 2.29] s

  * igt@i915_selftest@mock@uncore:
    - Statuses : 7 pass(s)
    - Exec time: [0.10, 0.46] s

  * igt@i915_selftest@mock@vma:
    - Statuses : 7 pass(s)
    - Exec time: [4.44, 25.34] s

  * igt@i915_selftest@perf:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@perf@blt:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 1.01] s

  * igt@i915_selftest@perf@engine_cs:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 0.74] s

  * igt@i915_selftest@perf@region:
    - Statuses : 7 pass(s)
    - Exec time: [1.29, 1.89] s

  * igt@kms_selftest@all:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_selftest@all@check_drm_format_block_height:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@check_drm_format_block_width:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@check_drm_format_min_pitch:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_selftest@all@check_drm_framebuffer_create:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_selftest@all@check_plane_state:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_damage:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_selftest@all@damage_iter_damage_not_visible:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_damage_one_intersect:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_damage_one_outside:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_damage_src_moved:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_selftest@all@damage_iter_no_damage:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_selftest@all@damage_iter_no_damage_fractional_src:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_no_damage_fractional_src_moved:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_selftest@all@damage_iter_no_damage_no_crtc:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_no_damage_no_fb:
    - Statuses : 6 pass(s)
    - Exec time: [0.03] s

  * igt@kms_selftest@all@damage_iter_no_damage_not_visible:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_no_damage_src_moved:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_simple_damage:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_single_damage:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_single_damage_fractional_src:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_single_damage_fractional_src_moved:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_single_damage_intersect_fractional_src:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_single_damage_intersect_src:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_selftest@all@damage_iter_single_damage_outside_fractional_src:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_selftest@all@damage_iter_single_damage_outside_src:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@damage_iter_single_damage_src_moved:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_selftest@all@dp_mst_calc_pbn_mode:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_selftest@all@dp_mst_sideband_msg_req_decode:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@drm_rect_clip_scaled_clipped:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_selftest@all@drm_rect_clip_scaled_div_by_zero:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_selftest@all@drm_rect_clip_scaled_not_clipped:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_selftest@all@drm_rect_clip_scaled_signed_vs_unsigned:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_4193_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_mm@topdown:
    - shard-hsw:          [PASS][18] -> [SKIP][19] ([fdo#109271]) +102 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw1/igt@drm_mm@topdown.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-hsw6/igt@drm_mm@topdown.html

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@gem_ctx_isolation@bcs0-s3.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-apl6/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_shared@exec-shared-gtt-bsd:
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#616])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb5/igt@gem_ctx_shared@exec-shared-gtt-bsd.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-tglb3/igt@gem_ctx_shared@exec-shared-gtt-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([i915#677])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#112146]) +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109276]) +20 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#454])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][32] -> [FAIL][33] ([i915#413])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@i915_pm_rps@reset.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_requests:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109644] / [fdo#110464])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb7/igt@i915_selftest@live_requests.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb6/igt@i915_selftest@live_requests.html

  * igt@i915_selftest@mock_memory_region:
    - shard-apl:          [PASS][36] -> [SKIP][37] ([fdo#109271]) +102 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl4/igt@i915_selftest@mock_memory_region.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-apl2/igt@i915_selftest@mock_memory_region.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-glk:          [PASS][38] -> [SKIP][39] ([fdo#109271]) +102 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk1/igt@i915_selftest@mock_sanitycheck.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-glk8/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_selftest@mock_syncmap:
    - shard-snb:          [PASS][40] -> [SKIP][41] ([fdo#109271]) +102 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-snb1/igt@i915_selftest@mock_syncmap.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-snb1/igt@i915_selftest@mock_syncmap.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#54]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#54])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#54]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][48] -> [DMESG-WARN][49] ([i915#180]) +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-glk:          [PASS][50] -> [TIMEOUT][51] ([fdo#112271]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-glk5/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
    - shard-tglb:         [PASS][52] -> [TIMEOUT][53] ([fdo#112271] / [i915#561]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb3/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-tglb1/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#899])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][56] -> [SKIP][57] ([fdo#109441]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_selftest@drm_rect_clip_scaled_signed_vs_unsigned:
    - shard-kbl:          [PASS][58] -> [SKIP][59] ([fdo#109271]) +102 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl7/igt@kms_selftest@drm_rect_clip_scaled_signed_vs_unsigned.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl2/igt@kms_selftest@drm_rect_clip_scaled_signed_vs_unsigned.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][60] -> [SKIP][61] ([fdo#112080]) +11 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb7/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][62] ([fdo#112080]) -> [PASS][63] +12 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-kbl:          [INCOMPLETE][64] ([fdo#103665]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [FAIL][66] ([i915#1277]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_balancer@hang.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb6/igt@gem_exec_balancer@hang.html
    - shard-tglb:         [FAIL][68] ([i915#1277]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@gem_exec_balancer@hang.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-tglb8/igt@gem_exec_balancer@hang.html

  * {igt@gem_exec_schedule@implicit-both-bsd2}:
    - shard-iclb:         [SKIP][70] ([fdo#109276] / [i915#677]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd2.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html

  * {igt@gem_exec_schedule@implicit-read-write-bsd}:
    - shard-iclb:         [SKIP][72] ([i915#677]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][74] ([fdo#109276]) -> [PASS][75] +21 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][76] ([fdo#112146]) -> [PASS][77] +7 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][78] ([i915#644]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][80] ([i915#644]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][82] ([i915#644]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_render_copy_redux@normal:
    - shard-hsw:          [FAIL][84] ([i915#694]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@gem_render_copy_redux@normal.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-hsw1/igt@gem_render_copy_redux@normal.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [FAIL][86] ([fdo#103375]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][88] ([i915#413]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb5/igt@i915_pm_rps@waitboost.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-tglb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [FAIL][90] ([i915#129]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [FAIL][92] ([i915#129]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-apl7/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-apl:          [FAIL][94] ([i915#54]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][96] ([i915#54]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][98] ([i915#54]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][100] ([i915#61]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-panning:
    - shard-kbl:          [DMESG-WARN][102] -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl4/igt@kms_flip@flip-vs-panning.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/shard-kbl6/igt@kms_flip@flip-vs-panning.html
    - shard-apl:          [DMESG-WARN][104] -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_D

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4193/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
