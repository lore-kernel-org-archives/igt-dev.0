Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0607761200300344713=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Mon, 19 Sep 2022 13:40:04 -0000
Message-ID: <166359480447.28330.7958452638670305122@emeril.freedesktop.org>
References: <20220919095442.666253-1-ananya.sharma@intel.com>
In-Reply-To: <20220919095442.666253-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSUdUIGNs?=
 =?utf-8?q?ean-up_tasks_=28rev5=29?=
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

--===============0607761200300344713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT clean-up tasks (rev5)
URL   : https://patchwork.freedesktop.org/series/104318/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12154_full -> IGTPW_7798_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7798_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7798_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7798_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor@atomic:
    - shard-apl:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl6/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12154_full and IGTPW_7798_full:

### New IGT tests (73) ###

  * igt@kms_universal_plane@cursor-fb-leak:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.55] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.60] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.29] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.39] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_universal_plane@disable-primary-vs-flip:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.59] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.71] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.28] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 1.29] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.44] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_universal_plane@universal-plane-functional:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.59, 3.28] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.38, 3.85] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.07] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.39, 3.90] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.53, 0.66] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.77] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.33, 1.41] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.34] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.50] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_universal_plane@universal-plane-sanity:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.69] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.75] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.35] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.33] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.51] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  

Known issues
------------

  Here are the changes found in IGTPW_7798_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-snb4/igt@gem_ctx_persistence@process.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#4525]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#4525])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][7] ([i915#2842]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-apl:          [PASS][12] -> [DMESG-FAIL][13] ([i915#6864])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl8/igt@gem_exec_flush@basic-uc-set-default.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([fdo#112283])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@gem_exec_params@secure-non-root.html
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#112283])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#4613]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb6/igt@gem_lmem_swapping@massive-random.html
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl3/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@random:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4613]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb1/igt@gem_lmem_swapping@random.html
    - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4613]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk5/igt@gem_lmem_swapping@random.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#4270]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb4/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#4270]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_softpin@evict-single-offset:
    - shard-apl:          NOTRUN -> [FAIL][22] ([i915#4171])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl7/igt@gem_softpin@evict-single-offset.html

  * igt@gem_spin_batch@legacy@vebox:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#2898])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl3/igt@gem_spin_batch@legacy@vebox.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl3/igt@gem_spin_batch@legacy@vebox.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109290])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb4/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#110542])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#2527] / [i915#2856]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb5/igt@gen9_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#2856]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb4/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_module_load@resize-bar:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#6412])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb6/igt@i915_module_load@resize-bar.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#6412])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@i915_module_load@resize-bar.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#5591])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-tglb1/igt@i915_selftest@live@hangcheck.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@i915_selftest@live@hangcheck.html

  * igt@kms_atomic@plane-immutable-zpos:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#62]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl3/igt@kms_atomic@plane-immutable-zpos.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@kms_atomic@plane-immutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#1769] / [i915#3555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#1769] / [i915#3555])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#5286]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#5286]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110725] / [fdo#111614])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110723])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111615]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#2705])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb5/igt@kms_big_joiner@2x-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#2705])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb4/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#3886]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689] / [i915#3886])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb5/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_chamelium@dp-audio:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb6/igt@kms_chamelium@dp-audio.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-snb:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-snb2/igt@kms_chamelium@dp-hpd-after-suspend.html
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl7/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_color_chamelium@ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb8/igt@kms_color_chamelium@ctm-max.html
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk6/igt@kms_color_chamelium@ctm-max.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
    - shard-apl:          [PASS][56] -> [DMESG-WARN][57] ([i915#180]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl1/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size:
    - shard-apl:          [PASS][58] -> [DMESG-FAIL][59] ([i915#62])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl6/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][60] -> [FAIL][61] ([i915#2346])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][62] -> [DMESG-WARN][63] ([i915#1982] / [i915#62])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb1/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2587] / [i915#2672]) +6 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#2672]) +7 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [PASS][68] -> [INCOMPLETE][69] ([i915#1982])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280]) +10 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#6497]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271]) +46 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +75 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
    - shard-snb:          NOTRUN -> [SKIP][74] ([fdo#109271]) +82 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109280] / [fdo#111825]) +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#112054] / [i915#5288])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3536]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb8/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#111068] / [i915#658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#2920])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109441])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109441]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([i915#5519]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * {igt@kms_universal_plane@universal-plane-sanity} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][87] ([i915#4098]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-1/igt@kms_universal_plane@universal-plane-sanity.html

  * igt@perf@oa-exponents:
    - shard-glk:          [PASS][88] -> [INCOMPLETE][89] ([i915#5213])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-glk8/igt@perf@oa-exponents.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk7/igt@perf@oa-exponents.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109291])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@prime_nv_test@i915_nv_sharing.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109291])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb3/igt@prime_nv_test@i915_nv_sharing.html

  * igt@prime_vgem@fence-read-hang:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109295])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb8/igt@prime_vgem@fence-read-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109295])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb2/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@sema-25:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@sysfs_clients@sema-25.html
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2994])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb8/igt@sysfs_clients@sema-25.html
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk6/igt@sysfs_clients@sema-25.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#2994])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb1/igt@sysfs_clients@sema-25.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-apl:          [PASS][98] -> [FAIL][99] ([i915#1755])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl1/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl2/igt@sysfs_heartbeat_interval@precise@vecs0.html

  
#### Possible fixes ####

  * igt@drm_import_export@prime:
    - shard-apl:          [DMESG-WARN][100] ([i915#6864]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl3/igt@drm_import_export@prime.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl1/igt@drm_import_export@prime.html

  * igt@fbdev@read:
    - {shard-rkl}:        [SKIP][102] ([i915#2582]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-rkl-5/igt@fbdev@read.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-2/igt@fbdev@read.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-apl:          [DMESG-WARN][104] ([i915#180]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - {shard-rkl}:        [FAIL][106] ([i915#2842]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-rkl-6/igt@gem_exec_fair@basic-flow@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-6/igt@gem_exec_fair@basic-flow@rcs0.html
    - shard-tglb:         [FAIL][108] ([i915#2842]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - {shard-tglu}:       [FAIL][110] ([i915#2842]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][112] ([i915#2842]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][114] ([i915#2842]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-glk:          [DMESG-FAIL][116] ([i915#6864]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-glk3/igt@gem_exec_flush@basic-uc-set-default.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk7/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][118] ([i915#2190]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@display:
    - {shard-rkl}:        [SKIP][120] ([i915#3282]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-rkl-6/igt@gem_pread@display.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-5/igt@gem_pread@display.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][122] ([i915#3989]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb3/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-rkl}:        [SKIP][124] ([i915#3361]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][126] ([i915#4281]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - {shard-tglu}:       [WARN][128] ([i915#2681]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs:
    - {shard-rkl}:        [SKIP][130] ([i915#1845] / [i915#4098]) -> [PASS][131] +4 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-rkl-5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor@toggle:
    - shard-iclb:         [FAIL][132] ([i915#2346]) -> [PASS][133] +3 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - {shard-rkl}:        [SKIP][134] ([i915#1849] / [i915#4098]) -> [PASS][135] +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - {shard-rkl}:        [SKIP][136] ([i915#1849] / [i915#3546] / [i915#4098]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2:
    - shard-glk:          [DMESG-FAIL][138] ([i915#118] / [i915#1888]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-glk2/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html

  * igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1:
    - shard-glk:          [FAIL][140] -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-glk2/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [SKIP][142] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][144] ([fdo#109441]) -> [PASS][145] +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@sprite_blt:
    - {shard-rkl}:        [SKIP][146] ([i915#1072]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-rkl-5/igt@kms_psr@sprite_blt.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-6/igt@kms_psr@sprite_blt.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][148] ([i915#6117]) -> [SKIP][149] ([i915#4525])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [FAIL][150] ([i915#2842]) -> [FAIL][151] ([i915#2876])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          [FAIL][152] ([i915#2105]) -> [SKIP][153] ([fdo#109271])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl8/igt@kms_content_protection@uevent.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
    - shard-glk:          [SKIP][154] ([fdo#109271]) -> [SKIP][155] ([fdo#109271] / [i915#1888]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-glk6/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk3/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][156] ([i915#2920]) -> [SKIP][157] ([i915#658])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [SKIP][158] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][159] ([i915#5939])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][160], [FAIL][161], [FAIL][162], [FAIL][163], [FAIL][164]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599]) -> ([FAIL][165], [FAIL][166], [FAIL][167], [FAIL][168]) ([i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl1/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl2/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl3/igt@runner@aborted.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl8/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl1/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@runner@aborted.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@runner@aborted.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
  [i915#2898]: https://gitlab.freedesktop.org/drm/intel/issues/2898
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6778]: https://gitlab.freedesktop.org/drm/intel/issues/6778
  [i915#6864]: https://gitlab.freedesktop.org/drm/intel/issues/6864


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6656 -> IGTPW_7798
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12154: 3525875cb7903ed98c5b99d4f9d8b0b16b1d7f3f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7798: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html
  IGT_6656: 24100c4e181c50e3678aeca9c641b8a43555ad73 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html

--===============0607761200300344713==
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
<tr><td><b>Series:</b></td><td>IGT clean-up tasks (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104318/">https://patchwork.freedesktop.org/series/104318/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7798/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12154_full -&gt; IGTPW_7798_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7798_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7798_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.=
html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7798=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor@atomic:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl6/igt@kms_cursor_legacy@basic-flip-after-cursor@atom=
ic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7798/shard-apl6/igt@kms_cursor_legacy@basic-flip-after-cursor@atomic=
.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12154_full and IGTPW_7798_=
full:</p>
<h3>New IGT tests (73)</h3>
<ul>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.59, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.38, 3.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.39, 3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-dp-1:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-edp-1:<=
/p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.53, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-vga-1:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-dp-1:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-edp-1:<=
/p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.33, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-vga-1:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-dp-1:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-edp-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-d-edp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-d-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7798_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-snb4/igt@gem_ctx_persistence@process.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7798/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb6/igt@gem_exec_balancer@parallel-out-fen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/=
shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb3/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl8/igt@gem_exec_flush@basic-uc-set-default.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/s=
hard-apl8/igt@gem_exec_flush@basic-uc-set-default.html">DMESG-FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6864">i915#6864</a>=
)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb2/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb3/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb6/igt@gem_lmem_swapping@massive-random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/46=
13">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-apl3/igt@gem_lmem_swapping@massive-random.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4613">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb1/igt@gem_lmem_swapping@random.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915=
#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-glk5/igt@gem_lmem_swapping@random.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb4/igt@gem_pxp@protected-raw-src-copy-not=
-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-tglb5/igt@gem_pxp@verify-pxp-key-change-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-apl7/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/417=
1">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@vebox:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl3/igt@gem_spin_batch@legacy@vebox.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl=
3/igt@gem_spin_batch@legacy@vebox.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2898">i915#2898</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb4/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
290">fdo#109290</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb7/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
542">fdo#110542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb5/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb4/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb6/igt@i915_module_load@resize-bar.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">i=
915#6412</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb3/igt@i915_module_load@resize-bar.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">i=
915#6412</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-tglb1/igt@i915_selftest@live@hangcheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-t=
glb3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-immutable-zpos:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl3/igt@kms_atomic@plane-immutable-zpos.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard=
-apl6/igt@kms_atomic@plane-immutable-zpos.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb5/igt@kms_atomic_transition@plane-all-mod=
eset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb8/igt@kms_atomic_transition@plane-all-mod=
eset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb8/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb5/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i91=
5#2705</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb4/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i91=
5#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-apl8/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb5/igt@kms_ccs@pipe-c-bad-aux-stride-y_ti=
led_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-audio:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb6/igt@kms_chamelium@dp-audio.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#=
109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
27">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-snb2/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-apl7/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-max:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb8/igt@kms_color_chamelium@ctm-max.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-glk6/igt@kms_color_chamelium@ctm-max.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl1/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7798/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor@atomic-transitions-varying=
-size:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl6/igt@kms_cursor_legacy@basic-flip-after-cursor@atom=
ic-transitions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@kms_cursor_legacy@basic=
-flip-after-cursor@atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7798/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/=
igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb1/igt@kms_flip@2x-plain-flip-interruptibl=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb1/igt@kms_flip@2x-plain-flip-interruptibl=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) =
+6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +7 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indf=
b-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7798/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-prims=
crn-indfb-plflip-blt.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-mo=
desetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6497">i915#6497</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-glk8/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scnd=
scrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +75 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scnd=
scrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +82 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +9 similar issue=
s</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-tglb3/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb8/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shar=
d-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7798/shard-iclb7/igt@kms_psr_stress_test@flip-primary-invalidate=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_universal_plane@universal-plane-sanity} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7798/shard-rkl-1/igt@kms_universal_plane@universal-plan=
e-sanity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4098">i915#4098</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-glk8/igt@perf@oa-exponents.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk7/igt@perf=
@oa-exponents.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5213">i915#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb3/igt@prime_nv_test@i915_nv_sharing.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb3/igt@prime_nv_test@i915_nv_sharing.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb8/igt@prime_vgem@fence-read-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb2/igt@prime_vgem@fence-read-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-apl6/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-tglb8/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-glk6/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7798/shard-iclb1/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl1/igt@sysfs_heartbeat_interval@precise@vecs0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_779=
8/shard-apl2/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>=
)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_import_export@prime:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl3/igt@drm_import_export@prime.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6864">i915#6864<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/s=
hard-apl1/igt@drm_import_export@prime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-rkl-5/igt@fbdev@read.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-2/igt@fbd=
ev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7798/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PAS=
S</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12154/shard-rkl-6/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/s=
hard-rkl-6/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12154/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/s=
hard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i9=
15#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7798/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
798/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
798/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-glk3/igt@gem_exec_flush@basic-uc-set-default.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6864=
">i915#6864</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7798/shard-glk7/igt@gem_exec_flush@basic-uc-set-default.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-tg=
lb3/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-5/=
igt@gem_pread@display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb3/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-iclb3=
/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rk=
l-6/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-ic=
lb7/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2=
681</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_77=
98/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-rkl-5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_=
rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7798/shard-rkl-6/igt@kms_ccs@pipe-b-random-ccs-data-=
y_tiled_gen12_rc_ccs.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346"=
>i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7798/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html">PAS=
S</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-6/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849=
">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3546">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7798/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-glk2/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-2.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7798/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a=
-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-glk2/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html=
">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7798/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#1=
09642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11106=
8">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7798/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_77=
98/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-rkl-5/igt@kms_psr@sprite_blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-rkl-6=
/igt@kms_psr@sprite_blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7798/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/=
shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2876">i915#2876</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-apl8/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2105<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/s=
hard-apl6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-glk6/igt@kms_plane_scaling@plane-upscale-with-rotation-=
20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-glk3/igt@kms_plane_scaling@pla=
ne-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7798/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-d=
mg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12154/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7798/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12154/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl2/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12154/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12154/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#=
6599</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7798/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/shard-apl8/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/sh=
ard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7798/shard-apl6/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3=
002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">=
i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6599">i915#6599</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6656 -&gt; IGTPW_7798</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12154: 3525875cb7903ed98c5b99d4f9d8b0b16b1d7f3f @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7798: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.htm=
l<br />
  IGT_6656: 24100c4e181c50e3678aeca9c641b8a43555ad73 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0607761200300344713==--
