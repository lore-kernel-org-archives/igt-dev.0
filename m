Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0975163942159002963=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Date: Fri, 10 Nov 2023 09:25:50 -0000
Message-ID: <169960835061.31678.5793352585371925549@emeril.freedesktop.org>
References: <20231110081544.1377420-1-kunal1.joshi@intel.com>
In-Reply-To: <20231110081544.1377420-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZXh0ZW5k?=
 =?utf-8?q?_kms=5Fpsr_test_to_validate_pr_=28rev7=29?=
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

--===============0975163942159002963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend kms_psr test to validate pr (rev7)
URL   : https://patchwork.freedesktop.org/series/125379/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7582 -> IGTPW_10159
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10159 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10159, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/index.html

Participating hosts (34 -> 32)
------------------------------

  Missing    (2): bat-dg2-9 bat-adlp-11 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10159:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - bat-adls-5:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adls-5/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adls-5/igt@i915_selftest@live@gt_pm.html

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][3] +41 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-jsl-3/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][4] +20 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_primary_mmap_cpu} (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][5] +20 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adls-5/igt@kms_psr@pr_primary_mmap_cpu.html
    - bat-adln-1:         NOTRUN -> [SKIP][6] +20 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adln-1/igt@kms_psr@pr_primary_mmap_cpu.html

  * {igt@kms_psr@pr_primary_mmap_gtt} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][7] +62 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-rplp-1/igt@kms_psr@pr_primary_mmap_gtt.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][8] +62 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][9] +41 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-14/igt@kms_psr@pr_sprite_blt.html

  * igt@kms_psr@primary_page_flip:
    - bat-adls-5:         [PASS][10] -> [SKIP][11] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adls-5/igt@kms_psr@primary_page_flip.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adls-5/igt@kms_psr@primary_page_flip.html

  * {igt@kms_psr@psr2_cursor_plane_move@edp-1} (NEW):
    - bat-adlp-6:         NOTRUN -> [FAIL][12] +20 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlp-6/igt@kms_psr@psr2_cursor_plane_move@edp-1.html

  * {igt@kms_psr@psr2_cursor_plane_onoff@edp-1} (NEW):
    - bat-adln-1:         NOTRUN -> [FAIL][13] +20 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adln-1/igt@kms_psr@psr2_cursor_plane_onoff@edp-1.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][14] +62 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_primary_render:
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] +62 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-mtlp-6/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - bat-adlp-9:         NOTRUN -> [SKIP][16] +62 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html

  * {igt@kms_psr@psr_primary_blt} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] +62 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html

  * {igt@kms_psr@psr_primary_mmap_cpu} (NEW):
    - bat-rpls-1:         NOTRUN -> [SKIP][18] +62 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-rpls-1/igt@kms_psr@psr_primary_mmap_cpu.html

  * {igt@kms_psr@psr_suspend} (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][19] +62 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlm-1/igt@kms_psr@psr_suspend.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-adlm-1:         [SKIP][20] ([i915#1072]) -> [SKIP][21] +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
    - bat-rpls-1:         [SKIP][22] ([i915#1072]) -> [SKIP][23] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rpls-1/igt@kms_psr@cursor_plane_move.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-rpls-1/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-9:         [SKIP][24] ([i915#1072]) -> [SKIP][25] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adlp-9/igt@kms_psr@primary_page_flip.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlp-9/igt@kms_psr@primary_page_flip.html
    - fi-rkl-11600:       [SKIP][26] ([i915#1072]) -> [SKIP][27] +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
    - fi-tgl-1115g4:      [SKIP][28] ([fdo#110189]) -> [SKIP][29] +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
    - bat-mtlp-6:         [SKIP][30] ([i915#1072]) -> [SKIP][31] +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-mtlp-6/igt@kms_psr@primary_page_flip.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-mtlp-6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg2-11:         [SKIP][32] ([i915#1072]) -> [SKIP][33] +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - {bat-dg2-14}:       NOTRUN -> [SKIP][34] +20 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
New tests
---------

  New tests have been introduced between IGT_7582 and IGTPW_10159:

### New IGT tests (84) ###

  * igt@kms_psr@pr_basic:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_blt:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_cpu:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_gtt:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_move:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_onoff:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_render:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_dpms:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_no_drrs:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_blt:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_cpu:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_gtt:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_page_flip:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_render:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_blt:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_cpu:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_gtt:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_move:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_onoff:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_render:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_suspend:
    - Statuses : 31 skip(s)
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
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_basic@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_move:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_move@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_gtt:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_gtt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_page_flip:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_page_flip@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_onoff:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_onoff@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend:
    - Statuses : 26 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend@edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10159 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-jsl-3:          [PASS][35] -> [INCOMPLETE][36] ([i915#9275])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-jsl-3:          [PASS][37] -> [FAIL][38] ([fdo#103375])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#5190])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][40] ([i915#1845] / [i915#9197]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][41] ([i915#6078]) +62 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][42] ([fdo#109271]) +41 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-skl-6600u/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][43] ([fdo#109271]) +62 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-cfl-8700k/igt@kms_psr@pr_sprite_blt.html

  * {igt@kms_psr@pr_sprite_render} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][44] ([fdo#109271]) +62 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html

  * {igt@kms_psr@pr_suspend} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][45] ([fdo#109271]) +62 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-skl-guc/igt@kms_psr@pr_suspend.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][46] -> [SKIP][47] ([fdo#109271]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_dpms:
    - fi-blb-e6850:       NOTRUN -> [SKIP][48] ([fdo#109271]) +62 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-blb-e6850/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_render:
    - fi-cfl-guc:         NOTRUN -> [SKIP][49] ([fdo#109271]) +62 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-cfl-guc/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - fi-elk-e7500:       NOTRUN -> [SKIP][50] ([fdo#109271]) +62 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][51] ([fdo#109271]) +62 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][52] ([fdo#109271]) +62 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - fi-apl-guc:         NOTRUN -> [SKIP][53] ([fdo#109271]) +62 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-apl-guc/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - fi-hsw-4770:        NOTRUN -> [SKIP][54] ([fdo#109271]) +79 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-hsw-4770/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@psr2_suspend:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][55] ([fdo#109271]) +62 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][56] ([fdo#109271]) +62 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html

  * {igt@kms_psr@psr_cursor_blt} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][57] ([fdo#109271]) +62 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-ivb-3770/igt@kms_psr@psr_cursor_blt.html

  * {igt@kms_psr@psr_cursor_render} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][58] ([fdo#109271]) +62 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-ilk-650/igt@kms_psr@psr_cursor_render.html

  * {igt@kms_psr@psr_dpms} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][59] ([fdo#109271]) +62 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-glk-j4005/igt@kms_psr@psr_dpms.html

  * {igt@kms_psr@psr_sprite_blt} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][60] ([fdo#109271]) +62 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-pnv-d510/igt@kms_psr@psr_sprite_blt.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-3:          [PASS][61] -> [SKIP][62] ([fdo#112080]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][63] ([i915#8668]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
#### Warnings ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-atsm-1:         [SKIP][65] ([i915#1072]) -> [SKIP][66] ([i915#6078]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7582 -> IGTPW_10159

  CI-20190529: 20190529
  CI_DRM_13859: 9155ae0ae05f320d84eaf2c4e81413bf937a5f3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10159: 10159
  IGT_7582: 453b9df12fbc9fff561bdb4eb97992983e74c3d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/index.html

--===============0975163942159002963==
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
<tr><td><b>Series:</b></td><td>extend kms_psr test to validate pr (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125379/">https://patchwork.freedesktop.org/series/125379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7582 -&gt; IGTPW_10159</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10159 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10159, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/index.html</p>
<h2>Participating hosts (34 -&gt; 32)</h2>
<p>Missing    (2): bat-dg2-9 bat-adlp-11 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10159:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adls-5/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adls-5/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-jsl-3/igt@kms_psr@pr_cursor_blt.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_mmap_cpu} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adls-5/igt@kms_psr@pr_primary_mmap_cpu.html">SKIP</a> +20 other tests skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adln-1/igt@kms_psr@pr_primary_mmap_cpu.html">SKIP</a> +20 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_mmap_gtt} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-rplp-1/igt@kms_psr@pr_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +62 other tests skip</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-14/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +41 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adls-5/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adls-5/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr2_cursor_plane_move@edp-1} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlp-6/igt@kms_psr@psr2_cursor_plane_move@edp-1.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr2_cursor_plane_onoff@edp-1} (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adln-1/igt@kms_psr@psr2_cursor_plane_onoff@edp-1.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-mtlp-6/igt@kms_psr@psr2_primary_render.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_blt} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_mmap_cpu} (NEW):</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-rpls-1/igt@kms_psr@psr_primary_mmap_cpu.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_suspend} (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlm-1/igt@kms_psr@psr_suspend.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-adlp-9/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-adlp-9/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-mtlp-6/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-mtlp-6/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_psr@psr2_sprite_mmap_cpu:<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7582 and IGTPW_10159:</p>
<h3>New IGT tests (84)</h3>
<ul>
<li>
<p>igt@kms_psr@pr_basic:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_blt:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_move:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_render:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_dpms:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_no_drrs:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_blt:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_page_flip:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_render:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_blt:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_move:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_render:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_suspend:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<li>Statuses : 26 skip(s)</li>
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
<p>Here are the changes found in IGTPW_10159 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-skl-6600u/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-cfl-8700k/igt@kms_psr@pr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_render} (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_suspend} (NEW):</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-skl-guc/igt@kms_psr@pr_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-blb-e6850/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-cfl-guc/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-apl-guc/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-hsw-4770/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_blt} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-ivb-3770/igt@kms_psr@psr_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_render} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-ilk-650/igt@kms_psr@psr_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_dpms} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-glk-j4005/igt@kms_psr@psr_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_blt} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/fi-pnv-d510/igt@kms_psr@psr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@sprite_plane_onoff:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7582/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10159/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7582 -&gt; IGTPW_10159</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13859: 9155ae0ae05f320d84eaf2c4e81413bf937a5f3c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10159: 10159<br />
  IGT_7582: 453b9df12fbc9fff561bdb4eb97992983e74c3d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0975163942159002963==--
