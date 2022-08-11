Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5934635643330454228=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Thu, 11 Aug 2022 18:22:34 -0000
Message-ID: <166024215465.11994.15020421204785254167@emeril.freedesktop.org>
References: <20220811051920.31077-1-karthik.b.s@intel.com>
In-Reply-To: <20220811051920.31077-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fmultiple=3A_Convert_tests_to_dynamic_=28rev2=29?=
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

--===============5934635643330454228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_multiple: Convert tests to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/107054/
State : success

== Summary ==

CI Bug Log - changes from IGT_6622_full -> IGTPW_7636_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7636_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_multiple@tiling-4} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb6/igt@kms_plane_multiple@tiling-4.html

  * {igt@kms_plane_multiple@tiling-yf} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb2/igt@kms_plane_multiple@tiling-yf.html

  
New tests
---------

  New tests have been introduced between IGT_6622_full and IGTPW_7636_full:

### New IGT tests (60) ###

  * igt@kms_plane_multiple@tiling-4:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_multiple@tiling-none:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_multiple@tiling-none@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.49] s

  * igt@kms_plane_multiple@tiling-none@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.42] s

  * igt@kms_plane_multiple@tiling-none@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_multiple@tiling-none@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_multiple@tiling-none@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_multiple@tiling-none@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.65] s

  * igt@kms_plane_multiple@tiling-none@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.51] s

  * igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_plane_multiple@tiling-none@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_plane_multiple@tiling-none@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.62] s

  * igt@kms_plane_multiple@tiling-none@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.47] s

  * igt@kms_plane_multiple@tiling-none@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_plane_multiple@tiling-none@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_plane_multiple@tiling-none@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_plane_multiple@tiling-x:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.47] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.55] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.65] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.60] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_plane_multiple@tiling-x@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.67] s

  * igt@kms_plane_multiple@tiling-x@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.60] s

  * igt@kms_plane_multiple@tiling-x@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_multiple@tiling-x@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_plane_multiple@tiling-x@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@tiling-y:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_multiple@tiling-y@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.86] s

  * igt@kms_plane_multiple@tiling-y@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.50] s

  * igt@kms_plane_multiple@tiling-y@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_plane_multiple@tiling-y@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_plane_multiple@tiling-y@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 1.04] s

  * igt@kms_plane_multiple@tiling-y@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.56] s

  * igt@kms_plane_multiple@tiling-y@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_multiple@tiling-y@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_multiple@tiling-y@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 0.99] s

  * igt@kms_plane_multiple@tiling-y@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.54] s

  * igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_multiple@tiling-y@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_multiple@tiling-yf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_multiple@tiling-yf@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.88] s

  * igt@kms_plane_multiple@tiling-yf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_plane_multiple@tiling-yf@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_plane_multiple@tiling-yf@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_multiple@tiling-yf@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 1.02] s

  * igt@kms_plane_multiple@tiling-yf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_plane_multiple@tiling-yf@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_plane_multiple@tiling-yf@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_multiple@tiling-yf@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 1.00] s

  * igt@kms_plane_multiple@tiling-yf@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_plane_multiple@tiling-yf@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_plane_multiple@tiling-yf@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  

Known issues
------------

  Here are the changes found in IGTPW_7636_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@block-copy-inplace:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#3555] / [i915#5325])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@gem_ccs@block-copy-inplace.html
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#5327])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb8/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         NOTRUN -> [FAIL][5] ([i915#2410])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb7/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@suspend:
    - shard-iclb:         [PASS][6] -> [DMESG-WARN][7] ([i915#2867])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb8/igt@gem_eio@suspend.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb3/igt@gem_eio@suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][8] -> [TIMEOUT][9] ([i915#3063])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#4525]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2842]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#2842]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-kbl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk6/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#4270])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@gem_pxp@create-protected-buffer.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#4270])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb5/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#3323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][29] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#5566] / [i915#716])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl1/igt@gen9_exec_parse@allowed-single.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#2527] / [i915#2856]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#2856]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271]) +122 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#5591])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-tglb7/igt@i915_selftest@live@hangcheck.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#5286]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#5286]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-snb:          NOTRUN -> [SKIP][41] ([fdo#109271]) +72 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-snb7/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3886]) +7 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3689] / [i915#6095]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk1/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#6095]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111615] / [i915#3689])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb2/igt@kms_ccs@pipe-b-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] / [i915#3886]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb2/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#3886]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb4/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271]) +39 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl1/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3689]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278]) +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-snb2/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb2/igt@kms_chamelium@hdmi-audio-edid.html
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk7/igt@kms_chamelium@hdmi-audio-edid.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb8/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl6/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color_chamelium@ctm-0-25:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@kms_color_chamelium@ctm-0-25.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:
    - shard-kbl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-kbl1/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html

  * igt@kms_cursor_legacy@cursor-vs-flip@varying-size:
    - shard-iclb:         [PASS][61] -> [FAIL][62] ([i915#5072]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#5287])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#5287])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][65] -> [INCOMPLETE][66] ([i915#180] / [i915#4939])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109274]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#2672])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#2672]) +5 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#3555])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#2672] / [i915#3555])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109280]) +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109280] / [fdo#111825]) +7 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271]) +81 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#6497]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([i915#433])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb4/igt@kms_hdmi_inject@inject-audio.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb8/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglb:         [PASS][79] -> [SKIP][80] ([i915#433])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          [PASS][81] -> [DMESG-WARN][82] ([i915#180])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl2/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl2/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
    - shard-kbl:          [PASS][83] -> [FAIL][84] ([i915#1188])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109289]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109289])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-glk:          NOTRUN -> [FAIL][89] ([fdo#108145] / [i915#265])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#5176]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#5176]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-dp-1:
    - shard-apl:          [PASS][92] -> [DMESG-WARN][93] ([i915#5809])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl7/igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-dp-1.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl7/igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-dp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][94] -> [SKIP][95] ([i915#5235]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-kbl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-tglb:         NOTRUN -> [FAIL][98] ([i915#132] / [i915#3467]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109441])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][100] -> [SKIP][101] ([fdo#109441])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb4/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [PASS][102] -> [SKIP][103] ([i915#5519])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-iclb:         [PASS][104] -> [SKIP][105] ([i915#5519])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-glk:          [PASS][106] -> [FAIL][107] ([i915#43])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-glk2/igt@kms_vblank@pipe-b-accuracy-idle.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk5/igt@kms_vblank@pipe-b-accuracy-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2437])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#2530])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#2530])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@sysfs_clients@split-50:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#2994])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@sysfs_clients@split-50.html
    - shard-glk:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2994]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk7/igt@sysfs_clients@split-50.html
    - shard-iclb:         NOTRUN -> [SKIP][114] ([i915#2994])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb8/igt@sysfs_clients@split-50.html
    - shard-kbl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         [TIMEOUT][116] ([i915#3063]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-tglb2/igt@gem_eio@in-flight-1us.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][118] ([i915#4525]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_endless@dispatch@vcs1:
    - shard-tglb:         [INCOMPLETE][120] ([i915#3778]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][122] ([i915#2846]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][124] ([i915#2842]) -> [PASS][125] +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][126] ([i915#2842]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-iclb:         [DMESG-WARN][128] -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb3/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [SKIP][130] ([fdo#109271]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][132] ([i915#454]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][134] ([i915#4281]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html
    - shard-apl:          [FAIL][136] ([i915#4275]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl8/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][138] ([i915#2346]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][140] ([i915#180]) -> [PASS][141] +5 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [DMESG-WARN][142] ([i915#180]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-glk:          [FAIL][144] ([i915#1888] / [i915#2546]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][146] ([fdo#109441]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb4/igt@kms_psr@psr2_primary_blt.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][148] ([i915#4525]) -> [FAIL][149] ([i915#6117])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-glk:          [SKIP][150] ([fdo#109271]) -> [SKIP][151] ([fdo#109271] / [i915#1888])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-glk1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][152] ([i915#658]) -> [SKIP][153] ([i915#2920]) +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][154] ([fdo#111068] / [i915#658]) -> [SKIP][155] ([i915#2920]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [FAIL][156] ([i915#5939]) -> [SKIP][157] ([fdo#109642] / [fdo#111068] / [i915#658])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][158], [FAIL][159], [FAIL][160]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][161], [FAIL][162], [FAIL][163], [FAIL][164], [FAIL][165]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl8/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl6/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl8/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl4/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl2/igt@runner@aborted.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl6/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl6/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4275]: https://gitlab.freedesktop.org/drm/intel/issues/4275
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5809]: https://gitlab.freedesktop.org/drm/intel/issues/5809
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6622 -> IGTPW_7636

  CI-20190529: 20190529
  CI_DRM_11983: be61f160096902ab2f402179c81f6de59b016d82 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7636: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html
  IGT_6622: 12beb569038d43eb2193d3d42e1a213c31c1c2b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html

--===============5934635643330454228==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_plane_multiple: Convert tests to d=
ynamic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107054/">https://patchwork.freedesktop.org/series/107054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7636/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6622_full -&gt; IGTPW_7636_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.=
html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7636=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_multiple@tiling-4} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb6/igt@kms_plane_multiple@tiling-4.html">=
SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_multiple@tiling-yf} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb2/igt@kms_plane_multiple@tiling-yf.html"=
>SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6622_full and IGTPW_7636_full=
:</p>
<h3>New IGT tests (60)</h3>
<ul>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7636_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb3/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/53=
25">i915#5325</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb8/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i9=
15#5327</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb7/igt@gem_ctx_persistence@many-contexts.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb8/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb3/igt@gem_eio@=
suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2867">i915#2867</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb7/igt@g=
em_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/sha=
rd-iclb5/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb=
2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-g=
lk6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4/=
igt@gem_exec_fair@basic-pace@vcs0.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-kbl4=
/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@gem_lmem_swapping@parallel-multi.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-glk6/igt@gem_lmem_swapping@verify-random-ccs=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb3/igt@gem_pxp@create-protected-buffer.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/427=
0">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb5/igt@gem_pxp@create-protected-buffer.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/427=
0">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@gem_workarounds@suspend-resume.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-apl1/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl4=
/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@gen9_exec_parse@bb-large.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i91=
5#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/285=
6">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@gen9_exec_parse@unaligned-jump.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/285=
6">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +122 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-tglb7/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb3=
/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-snb7/igt@kms_ccs@pipe-a-bad-pixel-format-4_t=
iled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a>) +72 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-glk1/igt@kms_ccs@pipe-b-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb2/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb2/igt@kms_ccs@pipe-c-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb4/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-apl1/igt@kms_ccs@pipe-d-bad-pixel-format-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +39 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_ccs@pipe-d-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_ccs@pipe-d-random-ccs-data-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-snb2/igt@kms_chamelium@dp-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb2/igt@kms_chamelium@hdmi-audio-edid.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-glk7/igt@kms_chamelium@hdmi-audio-edid.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb8/igt@kms_chamelium@hdmi-audio-edid.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-apl6/igt@kms_chamelium@vga-frame-dump.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl4/igt@kms_color_chamelium@ctm-0-25.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-kbl1/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636=
/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7636/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072">i=
915#5072</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb210101=
0-mmap-wc-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb210101=
0-mmap-wc-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl6/igt@=
kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb4/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_flip@2x-flip-vs-fences-interru=
ptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +81 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6497">i915#6497</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6622/shard-iclb4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb8/=
igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/433">i915#433</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6622/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tglb5/=
igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/433">i915#433</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6622/shard-apl2/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/sha=
rd-apl2/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6622/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/sha=
rd-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb5/igt@kms_pipe_b_c_ivb@pipe-b-double-mode=
set-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109289">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-double-mode=
set-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb5/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb5/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-75@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-apl7/igt@kms_plane_scaling@plane-upscale-with-modifiers-20x=
20@pipe-a-dp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-apl7/igt@kms_plane_scaling@plane-upscale-with=
-modifiers-20x20@pipe-a-dp-1.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5809">i915#5809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pip=
e-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7636/shard-iclb2/igt@kms_plane_scaling@planes-downscale-facto=
r-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl7/igt@kms_psr2_su@page_flip-p010.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-tglb3/igt@kms_psr@psr2_primary_page_flip.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132=
">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3467">i915#3467</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb4/i=
gt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6622/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overla=
y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7636/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5519">i915#5519</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6622/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overla=
y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7636/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5519">i915#5519</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-glk2/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-glk=
5/igt@kms_vblank@pipe-b-accuracy-idle.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-glk7/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-kbl1/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb7/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb2/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-tglb3/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-glk7/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-iclb8/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7636/shard-kbl1/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-tglb2/igt@gem_eio@in-flight-1us.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-tg=
lb3/igt@gem_eio@in-flight-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
6/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3=
778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
36/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-=
kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636=
/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard=
-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority.html">DM=
ESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7636/shard-iclb3/igt@gem_exec_whisper@basic-contexts-priority.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636=
/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb8/igt@i=
915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6622/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-iclb7/igt=
@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6622/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4275">i915#4275</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl8/igt@i=
915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7636/shard-glk1/igt@kms_cursor_legacy@flip-vs-curs=
or@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/=
shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +5 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/=
shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb=
-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7636/shard-glk8/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb4/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-=
iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
6/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-glk1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-ref=
counted.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7636/shard-glk6/igt@gem_pxp@dmabuf-shared-protected-dst=
-is-context-refcounted.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658"=
>i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7636/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920"=
>i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7636/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continu=
ous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6622/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-i=
clb6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6622/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/shard-apl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/=
shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7636/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7636/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/shard-apl8/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6622 -&gt; IGTPW_7636</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11983: be61f160096902ab2f402179c81f6de59b016d82 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7636: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.htm=
l<br />
  IGT_6622: 12beb569038d43eb2193d3d42e1a213c31c1c2b5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5934635643330454228==--
