Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1165061379512434603=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Fri, 10 Nov 2023 08:11:43 -0000
Message-ID: <169960390325.31677.7803586804089059995@emeril.freedesktop.org>
References: <20231110071624.1365998-1-kunal1.joshi@intel.com>
In-Reply-To: <20231110071624.1365998-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZXh0ZW5k?=
 =?utf-8?q?_kms=5Fpsr_test_to_validate_pr_=28rev6=29?=
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

--===============1165061379512434603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend kms_psr test to validate pr (rev6)
URL   : https://patchwork.freedesktop.org/series/125379/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7582 -> IGTPW_10158
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10158 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10158, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/index.html

Participating hosts (34 -> 33)
------------------------------

  Missing    (1): fi-hsw-4770 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10158:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - bat-adls-5:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adls-5/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adls-5/igt@i915_selftest@live@gt_pm.html

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][3] +41 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-jsl-3/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][4] +20 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_primary_mmap_cpu} (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][5] +20 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adls-5/igt@kms_psr@pr_primary_mmap_cpu.html
    - bat-adln-1:         NOTRUN -> [SKIP][6] +20 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adln-1/igt@kms_psr@pr_primary_mmap_cpu.html

  * {igt@kms_psr@pr_primary_mmap_gtt} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][7] +62 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rplp-1/igt@kms_psr@pr_primary_mmap_gtt.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][8] +62 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][9] +41 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-14/igt@kms_psr@pr_sprite_blt.html

  * {igt@kms_psr@pr_sprite_render} (NEW):
    - bat-adlp-11:        NOTRUN -> [SKIP][10] +62 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-11/igt@kms_psr@pr_sprite_render.html

  * igt@kms_psr@primary_page_flip:
    - bat-adls-5:         [PASS][11] -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adls-5/igt@kms_psr@primary_page_flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adls-5/igt@kms_psr@primary_page_flip.html

  * {igt@kms_psr@psr2_cursor_plane_move@edp-1} (NEW):
    - bat-adlp-6:         NOTRUN -> [FAIL][13] +20 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-6/igt@kms_psr@psr2_cursor_plane_move@edp-1.html

  * {igt@kms_psr@psr2_cursor_plane_onoff@edp-1} (NEW):
    - bat-adln-1:         NOTRUN -> [FAIL][14] +20 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adln-1/igt@kms_psr@psr2_cursor_plane_onoff@edp-1.html

  * igt@kms_psr@psr2_primary_blt:
    - bat-dg2-9:          NOTRUN -> [SKIP][15] +62 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-9/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][16] +62 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_primary_render:
    - bat-mtlp-6:         NOTRUN -> [SKIP][17] +62 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-mtlp-6/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - bat-adlp-9:         NOTRUN -> [SKIP][18] +62 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html

  * {igt@kms_psr@psr_primary_blt} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][19] +62 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html

  * {igt@kms_psr@psr_primary_mmap_cpu} (NEW):
    - bat-rpls-1:         NOTRUN -> [SKIP][20] +62 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rpls-1/igt@kms_psr@psr_primary_mmap_cpu.html

  * {igt@kms_psr@psr_suspend} (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][21] +62 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlm-1/igt@kms_psr@psr_suspend.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-adlm-1:         [SKIP][22] ([i915#1072]) -> [SKIP][23] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
    - bat-rpls-1:         [SKIP][24] ([i915#1072]) -> [SKIP][25] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rpls-1/igt@kms_psr@cursor_plane_move.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rpls-1/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-9:         [SKIP][26] ([i915#1072]) -> [SKIP][27] +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adlp-9/igt@kms_psr@primary_page_flip.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-9/igt@kms_psr@primary_page_flip.html
    - fi-rkl-11600:       [SKIP][28] ([i915#1072]) -> [SKIP][29] +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
    - bat-dg2-9:          [SKIP][30] ([i915#1072]) -> [SKIP][31] +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-dg2-9/igt@kms_psr@primary_page_flip.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-9/igt@kms_psr@primary_page_flip.html
    - fi-tgl-1115g4:      [SKIP][32] ([fdo#110189]) -> [SKIP][33] +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
    - bat-mtlp-6:         [SKIP][34] ([i915#1072]) -> [SKIP][35] +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-mtlp-6/igt@kms_psr@primary_page_flip.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-mtlp-6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg2-11:         [SKIP][36] ([i915#1072]) -> [SKIP][37] +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - {bat-dg2-14}:       NOTRUN -> [SKIP][38] +20 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
New tests
---------

  New tests have been introduced between IGT_7582 and IGTPW_10158:

### New IGT tests (84) ###

  * igt@kms_psr@pr_basic:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_blt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_cpu:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_move:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_onoff:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_render:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_dpms:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_no_drrs:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_blt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_cpu:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_page_flip:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_render:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_blt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_cpu:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_move:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_onoff:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_render:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_suspend:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_basic@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_blt@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_mmap_cpu@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_mmap_gtt@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_plane_move@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_plane_onoff@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_cursor_render@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_dpms@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_no_drrs@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_blt@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_mmap_cpu@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_mmap_gtt@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_page_flip@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_primary_render@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_blt@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_mmap_cpu@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_mmap_gtt@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_plane_move@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_plane_onoff@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_sprite_render@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2_suspend@edp-1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_basic:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_basic@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_move:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_move@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_gtt:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_gtt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_page_flip:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_page_flip@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_onoff:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_onoff@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10158 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         [PASS][39] -> [ABORT][40] ([i915#7978])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][41] ([i915#6078]) +62 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][42] ([fdo#109271]) +41 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-skl-6600u/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][43] ([fdo#109271]) +62 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-cfl-8700k/igt@kms_psr@pr_sprite_blt.html

  * {igt@kms_psr@pr_sprite_render} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][44] ([fdo#109271]) +62 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html

  * {igt@kms_psr@pr_suspend} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][45] ([fdo#109271]) +62 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-skl-guc/igt@kms_psr@pr_suspend.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][46] -> [SKIP][47] ([fdo#109271]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_dpms:
    - fi-blb-e6850:       NOTRUN -> [SKIP][48] ([fdo#109271]) +62 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-blb-e6850/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_render:
    - fi-cfl-guc:         NOTRUN -> [SKIP][49] ([fdo#109271]) +62 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-cfl-guc/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - fi-elk-e7500:       NOTRUN -> [SKIP][50] ([fdo#109271]) +62 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][51] ([fdo#109271]) +62 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][52] ([fdo#109271]) +62 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - fi-apl-guc:         NOTRUN -> [SKIP][53] ([fdo#109271]) +62 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-apl-guc/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_suspend:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][54] ([fdo#109271]) +62 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][55] ([fdo#109271]) +62 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html

  * {igt@kms_psr@psr_cursor_blt} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][56] ([fdo#109271]) +62 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-ivb-3770/igt@kms_psr@psr_cursor_blt.html

  * {igt@kms_psr@psr_cursor_render} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][57] ([fdo#109271]) +62 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-ilk-650/igt@kms_psr@psr_cursor_render.html

  * {igt@kms_psr@psr_dpms} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][58] ([fdo#109271]) +62 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-glk-j4005/igt@kms_psr@psr_dpms.html

  * {igt@kms_psr@psr_sprite_blt} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][59] ([fdo#109271]) +62 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-pnv-d510/igt@kms_psr@psr_sprite_blt.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-3:          [PASS][60] -> [SKIP][61] ([fdo#112080]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][62] ([IGT#3]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][64] ([i915#8668]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
#### Warnings ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-atsm-1:         [SKIP][66] ([i915#1072]) -> [SKIP][67] ([i915#6078]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7582 -> IGTPW_10158

  CI-20190529: 20190529
  CI_DRM_13859: 9155ae0ae05f320d84eaf2c4e81413bf937a5f3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10158: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/index.html
  IGT_7582: 453b9df12fbc9fff561bdb4eb97992983e74c3d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/index.html

--===============1165061379512434603==
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
<tr><td><b>Series:</b></td><td>extend kms_psr test to validate pr (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125379/">https://patchwork.freedesktop.org/series/125379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7582 -&gt; IGTPW_10158</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10158 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10158, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/index.html</p>
<h2>Participating hosts (34 -&gt; 33)</h2>
<p>Missing    (1): fi-hsw-4770 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10158:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adls-5/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adls-5/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-jsl-3/igt@kms_psr@pr_cursor_blt.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_mmap_cpu} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adls-5/igt@kms_psr@pr_primary_mmap_cpu.html">SKIP</a> +20 other tests skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adln-1/igt@kms_psr@pr_primary_mmap_cpu.html">SKIP</a> +20 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_mmap_gtt} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rplp-1/igt@kms_psr@pr_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +62 other tests skip</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-14/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +41 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_render} (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-11/igt@kms_psr@pr_sprite_render.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adls-5/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adls-5/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr2_cursor_plane_move@edp-1} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-6/igt@kms_psr@psr2_cursor_plane_move@edp-1.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr2_cursor_plane_onoff@edp-1} (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adln-1/igt@kms_psr@psr2_cursor_plane_onoff@edp-1.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-9/igt@kms_psr@psr2_primary_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-mtlp-6/igt@kms_psr@psr2_primary_render.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_blt} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_mmap_cpu} (NEW):</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rpls-1/igt@kms_psr@psr_primary_mmap_cpu.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_suspend} (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlm-1/igt@kms_psr@psr_suspend.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adlp-9/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-adlp-9/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-dg2-9/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-9/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-mtlp-6/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-mtlp-6/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_psr@psr2_sprite_mmap_cpu:<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7582 and IGTPW_10158:</p>
<h3>New IGT tests (84)</h3>
<ul>
<li>
<p>igt@kms_psr@pr_basic:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_blt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_move:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_render:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_dpms:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_no_drrs:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_blt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_page_flip:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_render:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_blt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_move:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_render:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_suspend:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend@edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_basic:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_basic@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_blt:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_blt@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_move:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_move@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_render:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_render@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_dpms:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_dpms@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_no_drrs:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_no_drrs@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_blt:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_blt@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_page_flip:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_page_flip@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_render:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_render@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_blt:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_blt@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_move:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_move@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_render:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_render@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_suspend:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_suspend@edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10158 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-skl-6600u/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-cfl-8700k/igt@kms_psr@pr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_render} (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_suspend} (NEW):</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-skl-guc/igt@kms_psr@pr_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-blb-e6850/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-cfl-guc/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-apl-guc/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_blt} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-ivb-3770/igt@kms_psr@psr_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_render} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-ilk-650/igt@kms_psr@psr_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_dpms} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-glk-j4005/igt@kms_psr@psr_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_blt} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-pnv-d510/igt@kms_psr@psr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@sprite_plane_onoff:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7582 -&gt; IGTPW_10158</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13859: 9155ae0ae05f320d84eaf2c4e81413bf937a5f3c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10158: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10158/index.html<br />
  IGT_7582: 453b9df12fbc9fff561bdb4eb97992983e74c3d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============1165061379512434603==--
