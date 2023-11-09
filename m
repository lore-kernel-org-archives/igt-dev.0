Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8734186339195398633=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Thu, 09 Nov 2023 04:25:51 -0000
Message-ID: <169950395140.26589.12359043553921685001@emeril.freedesktop.org>
References: <20231109033706.1344465-1-kunal1.joshi@intel.com>
In-Reply-To: <20231109033706.1344465-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZXh0ZW5k?=
 =?utf-8?q?_kms=5Fpsr_test_to_validate_pr_=28rev4=29?=
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

--===============8734186339195398633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend kms_psr test to validate pr (rev4)
URL   : https://patchwork.freedesktop.org/series/125379/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7578 -> IGTPW_10139
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10139 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10139, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/index.html

Participating hosts (34 -> 35)
------------------------------

  Additional (2): fi-kbl-soraka bat-adlp-11 
  Missing    (1): bat-mtlp-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10139:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_sync@basic-all:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@gem_sync@basic-all.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - bat-adlp-9:         [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][4] +41 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-jsl-3/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][5] +41 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_primary_mmap_cpu} (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][6] +41 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adls-5/igt@kms_psr@pr_primary_mmap_cpu.html

  * {igt@kms_psr@pr_primary_mmap_gtt} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][7] +62 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-rplp-1/igt@kms_psr@pr_primary_mmap_gtt.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][8] +62 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][9] +41 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-14/igt@kms_psr@pr_sprite_blt.html

  * {igt@kms_psr@pr_sprite_render} (NEW):
    - bat-adlp-11:        NOTRUN -> [SKIP][10] +62 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_psr@pr_sprite_render.html

  * igt@kms_psr@primary_page_flip:
    - bat-adls-5:         [PASS][11] -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adls-5/igt@kms_psr@primary_page_flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adls-5/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_primary_blt:
    - bat-dg2-9:          NOTRUN -> [SKIP][13] +62 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-9/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][14] +62 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_primary_render:
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] +62 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-mtlp-6/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - bat-adlp-9:         NOTRUN -> [SKIP][16] +62 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr@psr2_suspend:
    - bat-adln-1:         NOTRUN -> [SKIP][17] +41 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adln-1/igt@kms_psr@psr2_suspend.html

  * {igt@kms_psr@psr_cursor_blt@edp-1} (NEW):
    - bat-adls-5:         NOTRUN -> [CRASH][18] +20 other tests crash
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adls-5/igt@kms_psr@psr_cursor_blt@edp-1.html

  * {igt@kms_psr@psr_cursor_mmap_gtt@edp-1} (NEW):
    - bat-adlp-6:         NOTRUN -> [CRASH][19] +20 other tests crash
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-6/igt@kms_psr@psr_cursor_mmap_gtt@edp-1.html

  * {igt@kms_psr@psr_cursor_plane_move@edp-1} (NEW):
    - bat-jsl-3:          NOTRUN -> [CRASH][20] +20 other tests crash
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-jsl-3/igt@kms_psr@psr_cursor_plane_move@edp-1.html

  * {igt@kms_psr@psr_no_drrs@edp-1} (NEW):
    - bat-adln-1:         NOTRUN -> [CRASH][21] +20 other tests crash
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adln-1/igt@kms_psr@psr_no_drrs@edp-1.html

  * {igt@kms_psr@psr_primary_blt} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][22] +62 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html

  * {igt@kms_psr@psr_primary_mmap_cpu} (NEW):
    - bat-rpls-1:         NOTRUN -> [SKIP][23] +62 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-rpls-1/igt@kms_psr@psr_primary_mmap_cpu.html

  * {igt@kms_psr@psr_primary_mmap_gtt@edp-1} (NEW):
    - fi-skl-6600u:       NOTRUN -> [CRASH][24] +20 other tests crash
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-6600u/igt@kms_psr@psr_primary_mmap_gtt@edp-1.html

  * {igt@kms_psr@psr_sprite_render@edp-1} (NEW):
    - fi-kbl-soraka:      NOTRUN -> [CRASH][25] +20 other tests crash
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@kms_psr@psr_sprite_render@edp-1.html

  * {igt@kms_psr@psr_suspend} (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][26] +62 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlm-1/igt@kms_psr@psr_suspend.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-adlm-1:         [SKIP][27] ([i915#1072]) -> [SKIP][28] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
    - bat-rpls-1:         [SKIP][29] ([i915#1072]) -> [SKIP][30] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-rpls-1/igt@kms_psr@cursor_plane_move.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-rpls-1/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-9:         [SKIP][31] ([i915#1072]) -> [SKIP][32] +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adlp-9/igt@kms_psr@primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-9/igt@kms_psr@primary_page_flip.html
    - fi-rkl-11600:       [SKIP][33] ([i915#1072]) -> [SKIP][34] +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
    - bat-dg2-9:          [SKIP][35] ([i915#1072]) -> [SKIP][36] +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-dg2-9/igt@kms_psr@primary_page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-9/igt@kms_psr@primary_page_flip.html
    - fi-tgl-1115g4:      [SKIP][37] ([fdo#110189]) -> [SKIP][38] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
    - bat-mtlp-6:         [SKIP][39] ([i915#1072]) -> [SKIP][40] +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-mtlp-6/igt@kms_psr@primary_page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-mtlp-6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg2-11:         [SKIP][41] ([i915#1072]) -> [SKIP][42] +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - {bat-dg2-14}:       NOTRUN -> [SKIP][43] +20 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
New tests
---------

  New tests have been introduced between IGT_7578 and IGTPW_10139:

### New IGT tests (63) ###

  * igt@kms_psr@pr_basic:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_mmap_gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_move:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_plane_onoff:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_cursor_render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_dpms:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_no_drrs:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_mmap_gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_page_flip:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_primary_render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_mmap_gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_move:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_plane_onoff:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_sprite_render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@pr_suspend:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_basic:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_basic@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_blt@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_cpu@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_mmap_gtt@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_move:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_move@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_plane_onoff@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_cursor_render@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_dpms@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_no_drrs@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_blt@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_cpu@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_gtt:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_mmap_gtt@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_page_flip:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_page_flip@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_primary_render@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_blt@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_cpu@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_mmap_gtt@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_move@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_onoff:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_plane_onoff@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_sprite_render@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr_suspend@edp-1:
    - Statuses : 6 crash(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10139 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-adlp-11:        NOTRUN -> [SKIP][44] ([i915#9318])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@debugfs_test@basic-hwmon.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-hsw-4770:        [PASS][45] -> [INCOMPLETE][46] ([i915#9624])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-hsw-4770/igt@dmabuf@all-tests@dma_fence_chain.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-hsw-4770/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#2190])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-11:        NOTRUN -> [SKIP][49] ([i915#3282])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@gem_tiled_pread_basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][50] ([i915#1886])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adlp-11:        NOTRUN -> [SKIP][51] ([i915#4103] / [i915#5608]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-11:        NOTRUN -> [SKIP][52] ([i915#3555] / [i915#3840])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - bat-adlp-9:         [PASS][53] -> [FAIL][54] ([i915#6121]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-11:        NOTRUN -> [SKIP][55] ([i915#4093]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-11:        NOTRUN -> [SKIP][56] ([i915#4369])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html

  * {igt@kms_psr@pr_cursor_blt} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][57] ([i915#6078]) +62 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html

  * {igt@kms_psr@pr_cursor_mmap_cpu} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][58] ([fdo#109271]) +41 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-6600u/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_sprite_blt} (NEW):
    - fi-kbl-soraka:      NOTRUN -> [SKIP][59] ([fdo#109271]) +55 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@kms_psr@pr_sprite_blt.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][60] ([fdo#109271]) +62 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-cfl-8700k/igt@kms_psr@pr_sprite_blt.html

  * {igt@kms_psr@pr_sprite_render} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][61] ([fdo#109271]) +62 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html

  * {igt@kms_psr@pr_suspend} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][62] ([fdo#109271]) +62 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-guc/igt@kms_psr@pr_suspend.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][63] ([fdo#109271]) +92 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-pnv-d510/igt@kms_psr@primary_page_flip.html
    - fi-skl-6600u:       [PASS][64] -> [SKIP][65] ([fdo#109271]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_dpms:
    - fi-blb-e6850:       NOTRUN -> [SKIP][66] ([fdo#109271]) +62 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-blb-e6850/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_render:
    - fi-cfl-guc:         NOTRUN -> [SKIP][67] ([fdo#109271]) +62 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-cfl-guc/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - fi-elk-e7500:       NOTRUN -> [SKIP][68] ([fdo#109271]) +62 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][69] ([fdo#109271]) +62 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][70] ([fdo#109271]) +62 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - fi-apl-guc:         NOTRUN -> [SKIP][71] ([fdo#109271]) +62 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-apl-guc/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - fi-hsw-4770:        NOTRUN -> [SKIP][72] ([fdo#109271]) +62 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-hsw-4770/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@psr2_suspend:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][73] ([fdo#109271]) +62 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][74] ([fdo#109271]) +62 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html

  * {igt@kms_psr@psr_cursor_blt} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][75] ([fdo#109271]) +62 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-ivb-3770/igt@kms_psr@psr_cursor_blt.html

  * {igt@kms_psr@psr_cursor_render} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][76] ([fdo#109271]) +62 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-ilk-650/igt@kms_psr@psr_cursor_render.html

  * {igt@kms_psr@psr_dpms} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][77] ([fdo#109271]) +62 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-glk-j4005/igt@kms_psr@psr_dpms.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-3:          [PASS][78] -> [SKIP][79] ([fdo#112080]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [DMESG-FAIL][80] ([i915#9549]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][82] ([IGT#3]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-atsm-1:         [SKIP][84] ([i915#1072]) -> [SKIP][85] ([i915#6078]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
    - fi-hsw-4770:        [SKIP][86] ([fdo#109271] / [i915#1072]) -> [SKIP][87] ([fdo#109271]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9549]: https://gitlab.freedesktop.org/drm/intel/issues/9549
  [i915#9624]: https://gitlab.freedesktop.org/drm/intel/issues/9624


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7578 -> IGTPW_10139

  CI-20190529: 20190529
  CI_DRM_13852: 8040e9d346531d98ca164092c860c24c1dd6e845 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10139: 10139
  IGT_7578: 2cf20c8dc5e372674ec3e3dd30b042794e9520ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/index.html

--===============8734186339195398633==
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
<tr><td><b>Series:</b></td><td>extend kms_psr test to validate pr (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125379/">https://patchwork.freedesktop.org/series/125379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7578 -&gt; IGTPW_10139</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10139 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10139, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/index.html</p>
<h2>Participating hosts (34 -&gt; 35)</h2>
<p>Additional (2): fi-kbl-soraka bat-adlp-11 <br />
  Missing    (1): bat-mtlp-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10139:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_sync@basic-all:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@gem_sync@basic-all.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-jsl-3/igt@kms_psr@pr_cursor_blt.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-6/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_mmap_cpu} (NEW):</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adls-5/igt@kms_psr@pr_primary_mmap_cpu.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_mmap_gtt} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-rplp-1/igt@kms_psr@pr_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-11/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +62 other tests skip</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-14/igt@kms_psr@pr_sprite_blt.html">SKIP</a> +41 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_render} (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_psr@pr_sprite_render.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adls-5/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adls-5/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-9/igt@kms_psr@psr2_primary_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-tgl-1115g4/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-mtlp-6/igt@kms_psr@psr2_primary_render.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-9/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adln-1/igt@kms_psr@psr2_suspend.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_blt@edp-1} (NEW):</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adls-5/igt@kms_psr@psr_cursor_blt@edp-1.html">CRASH</a> +20 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_mmap_gtt@edp-1} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-6/igt@kms_psr@psr_cursor_mmap_gtt@edp-1.html">CRASH</a> +20 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_plane_move@edp-1} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-jsl-3/igt@kms_psr@psr_cursor_plane_move@edp-1.html">CRASH</a> +20 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_no_drrs@edp-1} (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adln-1/igt@kms_psr@psr_no_drrs@edp-1.html">CRASH</a> +20 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_blt} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-rkl-11600/igt@kms_psr@psr_primary_blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_mmap_cpu} (NEW):</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-rpls-1/igt@kms_psr@psr_primary_mmap_cpu.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_primary_mmap_gtt@edp-1} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-6600u/igt@kms_psr@psr_primary_mmap_gtt@edp-1.html">CRASH</a> +20 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_render@edp-1} (NEW):</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@kms_psr@psr_sprite_render@edp-1.html">CRASH</a> +20 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_suspend} (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlm-1/igt@kms_psr@psr_suspend.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adlp-9/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-9/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-dg2-9/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-9/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-mtlp-6/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-mtlp-6/igt@kms_psr@primary_page_flip.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_psr@psr2_sprite_mmap_cpu:<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-dg2-14/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7578 and IGTPW_10139:</p>
<h3>New IGT tests (63)</h3>
<ul>
<li>
<p>igt@kms_psr@pr_basic:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_move:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_cursor_render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_dpms:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_no_drrs:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_page_flip:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_primary_render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_move:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_sprite_render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr_suspend:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_basic:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_basic@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_blt:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_blt@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_cpu:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_gtt:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_move:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_move@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_onoff:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_render:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_render@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_dpms:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_dpms@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_no_drrs:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_no_drrs@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_blt:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_blt@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_cpu:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_gtt:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_page_flip:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_page_flip@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_render:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_primary_render@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_blt:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_blt@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_cpu:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_cpu@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_gtt:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_mmap_gtt@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_move:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_move@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_onoff:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_plane_onoff@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_render:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_sprite_render@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_suspend:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_suspend@edp-1:</p>
<ul>
<li>Statuses : 6 crash(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10139 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-hsw-4770/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-hsw-4770/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9624">i915#9624</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4369">i915#4369</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_blt} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-atsm-1/igt@kms_psr@pr_cursor_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-6600u/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_blt} (NEW):</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-soraka/igt@kms_psr@pr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +55 other tests skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-cfl-8700k/igt@kms_psr@pr_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_sprite_render} (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-x1275/igt@kms_psr@pr_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_suspend} (NEW):</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-guc/igt@kms_psr@pr_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +92 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-blb-e6850/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-cfl-guc/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-elk-e7500/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-bsw-nick/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-guc/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-apl-guc/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-hsw-4770/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-cfl-8109u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-7567u/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_blt} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-ivb-3770/igt@kms_psr@psr_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_render} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-ilk-650/igt@kms_psr@psr_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_dpms} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-glk-j4005/igt@kms_psr@psr_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9549">i915#9549</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10139/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7578 -&gt; IGTPW_10139</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13852: 8040e9d346531d98ca164092c860c24c1dd6e845 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10139: 10139<br />
  IGT_7578: 2cf20c8dc5e372674ec3e3dd30b042794e9520ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============8734186339195398633==--
