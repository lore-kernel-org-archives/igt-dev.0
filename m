Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2972587891065831128=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Wed, 25 Oct 2023 17:32:48 -0000
Message-ID: <169825516817.20487.3090113908639697522@emeril.freedesktop.org>
References: <20231025142716.1019749-1-kunal1.joshi@intel.com>
In-Reply-To: <20231025142716.1019749-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZXh0ZW5k?=
 =?utf-8?q?_kms=5Fpsr_test_to_validate_pr_=28rev2=29?=
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

--===============2972587891065831128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend kms_psr test to validate pr (rev2)
URL   : https://patchwork.freedesktop.org/series/125379/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13786 -> IGTPW_10066
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10066 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10066, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html

Participating hosts (38 -> 36)
------------------------------

  Additional (2): fi-kbl-soraka bat-dg2-8 
  Missing    (4): fi-hsw-4770 bat-mtlp-8 fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10066:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][1] +62 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-mtlp-6/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][2] +62 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_primary_mmap_gtt} (NEW):
    - {bat-dg2-14}:       NOTRUN -> [SKIP][3] +41 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-14/igt@kms_psr@pr_primary_mmap_gtt.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][4] +62 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html

  * igt@kms_psr@psr2_dpms:
    - bat-rpls-1:         NOTRUN -> [SKIP][5] +62 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-rpls-1/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_no_drrs:
    - bat-jsl-1:          NOTRUN -> [SKIP][6] +62 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - bat-dg2-9:          NOTRUN -> [SKIP][7] +62 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-9/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][8] +62 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - bat-dg2-8:          NOTRUN -> [SKIP][9] +66 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - bat-adls-5:         NOTRUN -> [SKIP][10] +62 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adls-5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - bat-adlp-9:         NOTRUN -> [SKIP][11] +62 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr@psr2_suspend:
    - bat-adln-1:         NOTRUN -> [SKIP][12] +62 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adln-1/igt@kms_psr@psr2_suspend.html

  * {igt@kms_psr@psr_dpms} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][13] +62 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-3/igt@kms_psr@psr_dpms.html

  * {igt@kms_psr@psr_primary_blt} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][14] +62 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html

  * {igt@kms_psr@psr_sprite_mmap_cpu} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][15] +62 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-rplp-1/igt@kms_psr@psr_sprite_mmap_cpu.html

  * {igt@kms_psr@psr_suspend} (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][16] +62 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlm-1/igt@kms_psr@psr_suspend.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-adlm-1:         [SKIP][17] ([i915#1072]) -> [SKIP][18] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
    - fi-tgl-1115g4:      [SKIP][19] ([fdo#110189]) -> [SKIP][20] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/fi-tgl-1115g4/igt@kms_psr@cursor_plane_move.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-tgl-1115g4/igt@kms_psr@cursor_plane_move.html
    - bat-rpls-1:         [SKIP][21] ([i915#1072]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-rpls-1/igt@kms_psr@cursor_plane_move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-rpls-1/igt@kms_psr@cursor_plane_move.html
    - bat-mtlp-6:         [SKIP][23] ([i915#1072]) -> [SKIP][24] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-adlp-9:         [SKIP][25] ([i915#1072]) -> [SKIP][26] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html
    - fi-rkl-11600:       [SKIP][27] ([i915#1072]) -> [SKIP][28] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html
    - bat-adls-5:         [SKIP][29] ([i915#1072]) -> [SKIP][30] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-adls-5/igt@kms_psr@sprite_plane_onoff.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adls-5/igt@kms_psr@sprite_plane_onoff.html
    - bat-dg2-9:          [SKIP][31] ([i915#1072]) -> [SKIP][32] +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html
    - bat-dg2-11:         [SKIP][33] ([i915#1072]) -> [SKIP][34] +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - {bat-dg2-14}:       NOTRUN -> [SKIP][35] +20 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13786 and IGTPW_10066:

### New IGT tests (42) ###

  * igt@kms_psr@pr_basic:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_move:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_dpms:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_no_drrs:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_page_flip:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_move:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_suspend:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_basic:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_move:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_page_flip:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10066 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][36] ([i915#9318])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][37] ([i915#2190])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#2190])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-jsl-1:          NOTRUN -> [SKIP][40] ([i915#4613]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][41] ([i915#4083])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][42] ([i915#4077]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][43] ([i915#4079]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-8:          NOTRUN -> [SKIP][44] ([i915#6621])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][45] ([i915#1886])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-dg2-8:          NOTRUN -> [SKIP][46] ([i915#6645])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][47] ([i915#5190])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][48] ([i915#4215] / [i915#5190])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-8:          NOTRUN -> [SKIP][49] ([i915#4212]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-8:          NOTRUN -> [SKIP][50] ([i915#4212] / [i915#5608])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][51] ([i915#4103] / [i915#4213] / [i915#5608]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][52] ([i915#4103]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][53] ([i915#3555]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-8:          NOTRUN -> [SKIP][54] ([fdo#109285])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          NOTRUN -> [SKIP][55] ([fdo#109285])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-8:          NOTRUN -> [SKIP][56] ([i915#5274])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][57] -> [ABORT][58] ([i915#8668])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_psr@cursor_plane_move:
    - fi-skl-6600u:       [PASS][59] -> [SKIP][60] ([fdo#109271]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/fi-skl-6600u/igt@kms_psr@cursor_plane_move.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-skl-6600u/igt@kms_psr@cursor_plane_move.html

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][61] ([i915#6078]) +62 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][62] ([fdo#109271]) +62 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-cfl-guc/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_dpms} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][63] ([fdo#109271]) +62 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-ivb-3770/igt@kms_psr@pr_dpms.html

  * {igt@kms_psr@pr_primary_page_flip} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][64] ([fdo#109271]) +62 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-pnv-d510/igt@kms_psr@pr_primary_page_flip.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - fi-kbl-soraka:      NOTRUN -> [SKIP][65] ([fdo#109271]) +76 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-soraka/igt@kms_psr@pr_sprite_blt.html

  * {igt@kms_psr@pr_sprite_render} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][66] ([fdo#109271]) +62 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html

  * {igt@kms_psr@pr_suspend} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][67] ([fdo#109271]) +62 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-skl-guc/igt@kms_psr@pr_suspend.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - bat-kbl-2:          NOTRUN -> [SKIP][68] ([fdo#109271]) +62 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-kbl-2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_dpms:
    - fi-blb-e6850:       NOTRUN -> [SKIP][69] ([fdo#109271]) +62 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-blb-e6850/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_no_drrs:
    - fi-ilk-650:         NOTRUN -> [SKIP][70] ([fdo#109271]) +62 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-ilk-650/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - fi-elk-e7500:       NOTRUN -> [SKIP][71] ([fdo#109271]) +62 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][72] ([fdo#109271]) +62 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][73] ([fdo#109271]) +62 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][74] ([fdo#109271]) +62 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][75] ([fdo#109271]) +62 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][76] ([fdo#109271]) +62 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-cfl-8700k/igt@kms_psr@psr2_suspend.html

  * {igt@kms_psr@psr_dpms} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][77] ([fdo#109271]) +62 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-glk-j4005/igt@kms_psr@psr_dpms.html

  * {igt@kms_psr@psr_primary_blt} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][78] ([fdo#109271]) +62 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-skl-6600u/igt@kms_psr@psr_primary_blt.html

  * {igt@kms_psr@psr_sprite_blt} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][79] ([fdo#109271]) +62 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-apl-guc/igt@kms_psr@psr_sprite_blt.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-1:          NOTRUN -> [SKIP][80] ([fdo#112080]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_psr@sprite_plane_onoff.html
    - bat-jsl-3:          [PASS][81] -> [SKIP][82] ([fdo#112080]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-8:          NOTRUN -> [SKIP][83] ([i915#3555] / [i915#4098])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-8:          NOTRUN -> [SKIP][84] ([i915#3708])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-8:          NOTRUN -> [SKIP][85] ([i915#3708] / [i915#4077]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-8:          NOTRUN -> [SKIP][86] ([i915#3291] / [i915#3708]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][87] ([IGT#3]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-atsm-1:         [SKIP][89] ([i915#1072]) -> [SKIP][90] ([i915#6078]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7557 -> IGTPW_10066

  CI-20190529: 20190529
  CI_DRM_13786: e8d777a5e7e0ec452142ad0073022733f99c1eb7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10066: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html
  IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_psr@pr_basic
+igt@kms_psr@pr_cursor_blt
+igt@kms_psr@pr_cursor_mmap_cpu
+igt@kms_psr@pr_cursor_mmap_gtt
+igt@kms_psr@pr_cursor_plane_move
+igt@kms_psr@pr_cursor_plane_onoff
+igt@kms_psr@pr_cursor_render
+igt@kms_psr@pr_dpms
+igt@kms_psr@pr_no_drrs
+igt@kms_psr@pr_primary_blt
+igt@kms_psr@pr_primary_mmap_cpu
+igt@kms_psr@pr_primary_mmap_gtt
+igt@kms_psr@pr_primary_page_flip
+igt@kms_psr@pr_primary_render
+igt@kms_psr@pr_sprite_blt
+igt@kms_psr@pr_sprite_mmap_cpu
+igt@kms_psr@pr_sprite_mmap_gtt
+igt@kms_psr@pr_sprite_plane_move
+igt@kms_psr@pr_sprite_plane_onoff
+igt@kms_psr@pr_sprite_render
+igt@kms_psr@pr_suspend
+igt@kms_psr@psr_basic
+igt@kms_psr@psr_cursor_blt
+igt@kms_psr@psr_cursor_mmap_cpu
+igt@kms_psr@psr_cursor_mmap_gtt
+igt@kms_psr@psr_cursor_plane_move
+igt@kms_psr@psr_cursor_plane_onoff
+igt@kms_psr@psr_cursor_render
+igt@kms_psr@psr_dpms
+igt@kms_psr@psr_no_drrs
+igt@kms_psr@psr_primary_blt
+igt@kms_psr@psr_primary_mmap_cpu
+igt@kms_psr@psr_primary_mmap_gtt
+igt@kms_psr@psr_primary_page_flip
+igt@kms_psr@psr_primary_render
+igt@kms_psr@psr_sprite_blt
+igt@kms_psr@psr_sprite_mmap_cpu
+igt@kms_psr@psr_sprite_mmap_gtt
+igt@kms_psr@psr_sprite_plane_move
+igt@kms_psr@psr_sprite_plane_onoff
+igt@kms_psr@psr_sprite_render
+igt@kms_psr@psr_suspend
-igt@kms_psr@basic
-igt@kms_psr@cursor_blt
-igt@kms_psr@cursor_mmap_cpu
-igt@kms_psr@cursor_mmap_gtt
-igt@kms_psr@cursor_plane_move
-igt@kms_psr@cursor_plane_onoff
-igt@kms_psr@cursor_render
-igt@kms_psr@dpms
-igt@kms_psr@no_drrs
-igt@kms_psr@primary_blt
-igt@kms_psr@primary_mmap_cpu
-igt@kms_psr@primary_mmap_gtt
-igt@kms_psr@primary_page_flip
-igt@kms_psr@primary_render
-igt@kms_psr@sprite_blt
-igt@kms_psr@sprite_mmap_cpu
-igt@kms_psr@sprite_mmap_gtt
-igt@kms_psr@sprite_plane_move
-igt@kms_psr@sprite_plane_onoff
-igt@kms_psr@sprite_render
-igt@kms_psr@suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html

--===============2972587891065831128==
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
<tr><td><b>Series:</b></td><td>extend kms_psr test to validate pr (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125379/">https://patchwork.freedesktop.org/series/125379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13786 -&gt; IGTPW_10066</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10066 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10066, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Additional (2): fi-kbl-soraka bat-dg2-8 <br />
  Missing    (4): fi-hsw-4770 bat-mtlp-8 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10066:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-mtlp-6/igt@kms_psr@pr_cursor_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_mmap_gtt} (NEW):</p>
<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-14/igt@kms_psr@pr_primary_mmap_gtt.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-rpls-1/igt@kms_psr@psr2_dpms.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_psr@psr2_no_drrs.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-9/igt@kms_psr@psr2_primary_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adls-5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adln-1/igt@kms_psr@psr2_suspend.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_dpms} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-3/igt@kms_psr@psr_dpms.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_blt} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_mmap_cpu} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-rplp-1/igt@kms_psr@psr_sprite_mmap_cpu.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_suspend} (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlm-1/igt@kms_psr@psr_suspend.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/fi-tgl-1115g4/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-tgl-1115g4/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-adls-5/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-adls-5/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_psr@psr2_sprite_mmap_cpu:<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13786 and IGTPW_10066:</p>
<h3>New IGT tests (42)</h3>
<ul>
<li>
<p>igt@kms_psr@pr_basic:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_move:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_dpms:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_no_drrs:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_page_flip:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_move:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_suspend:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_basic:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_move:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_dpms:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_no_drrs:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_page_flip:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_move:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_suspend:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10066 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +1 other test skip</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/fi-skl-6600u/igt@kms_psr@cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-skl-6600u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-cfl-guc/igt@kms_psr@pr_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_dpms} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-ivb-3770/igt@kms_psr@pr_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_page_flip} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-pnv-d510/igt@kms_psr@pr_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-soraka/igt@kms_psr@pr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_render} (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_suspend} (NEW):</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-skl-guc/igt@kms_psr@pr_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-kbl-2/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-blb-e6850/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-ilk-650/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-cfl-8700k/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_dpms} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-glk-j4005/igt@kms_psr@psr_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_blt} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-skl-6600u/igt@kms_psr@psr_primary_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_blt} (NEW):</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-apl-guc/igt@kms_psr@psr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@sprite_plane_onoff:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13786/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7557 -&gt; IGTPW_10066</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13786: e8d777a5e7e0ec452142ad0073022733f99c1eb7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10066: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10066/index.html<br />
  IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_psr@pr_basic<br />
+igt@kms_psr@pr_cursor_blt<br />
+igt@kms_psr@pr_cursor_mmap_cpu<br />
+igt@kms_psr@pr_cursor_mmap_gtt<br />
+igt@kms_psr@pr_cursor_plane_move<br />
+igt@kms_psr@pr_cursor_plane_onoff<br />
+igt@kms_psr@pr_cursor_render<br />
+igt@kms_psr@pr_dpms<br />
+igt@kms_psr@pr_no_drrs<br />
+igt@kms_psr@pr_primary_blt<br />
+igt@kms_psr@pr_primary_mmap_cpu<br />
+igt@kms_psr@pr_primary_mmap_gtt<br />
+igt@kms_psr@pr_primary_page_flip<br />
+igt@kms_psr@pr_primary_render<br />
+igt@kms_psr@pr_sprite_blt<br />
+igt@kms_psr@pr_sprite_mmap_cpu<br />
+igt@kms_psr@pr_sprite_mmap_gtt<br />
+igt@kms_psr@pr_sprite_plane_move<br />
+igt@kms_psr@pr_sprite_plane_onoff<br />
+igt@kms_psr@pr_sprite_render<br />
+igt@kms_psr@pr_suspend<br />
+igt@kms_psr@psr_basic<br />
+igt@kms_psr@psr_cursor_blt<br />
+igt@kms_psr@psr_cursor_mmap_cpu<br />
+igt@kms_psr@psr_cursor_mmap_gtt<br />
+igt@kms_psr@psr_cursor_plane_move<br />
+igt@kms_psr@psr_cursor_plane_onoff<br />
+igt@kms_psr@psr_cursor_render<br />
+igt@kms_psr@psr_dpms<br />
+igt@kms_psr@psr_no_drrs<br />
+igt@kms_psr@psr_primary_blt<br />
+igt@kms_psr@psr_primary_mmap_cpu<br />
+igt@kms_psr@psr_primary_mmap_gtt<br />
+igt@kms_psr@psr_primary_page_flip<br />
+igt@kms_psr@psr_primary_render<br />
+igt@kms_psr@psr_sprite_blt<br />
+igt@kms_psr@psr_sprite_mmap_cpu<br />
+igt@kms_psr@psr_sprite_mmap_gtt<br />
+igt@kms_psr@psr_sprite_plane_move<br />
+igt@kms_psr@psr_sprite_plane_onoff<br />
+igt@kms_psr@psr_sprite_render<br />
+igt@kms_psr@psr_suspend<br />
-igt@kms_psr@basic<br />
-igt@kms_psr@cursor_blt<br />
-igt@kms_psr@cursor_mmap_cpu<br />
-igt@kms_psr@cursor_mmap_gtt<br />
-igt@kms_psr@cursor_plane_move<br />
-igt@kms_psr@cursor_plane_onoff<br />
-igt@kms_psr@cursor_render<br />
-igt@kms_psr@dpms<br />
-igt@kms_psr@no_drrs<br />
-igt@kms_psr@primary_blt<br />
-igt@kms_psr@primary_mmap_cpu<br />
-igt@kms_psr@primary_mmap_gtt<br />
-igt@kms_psr@primary_page_flip<br />
-igt@kms_psr@primary_render<br />
-igt@kms_psr@sprite_blt<br />
-igt@kms_psr@sprite_mmap_cpu<br />
-igt@kms_psr@sprite_mmap_gtt<br />
-igt@kms_psr@sprite_plane_move<br />
-igt@kms_psr@sprite_plane_onoff<br />
-igt@kms_psr@sprite_render<br />
-igt@kms_psr@suspend</p>

</body>
</html>

--===============2972587891065831128==--
