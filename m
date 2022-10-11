Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1052065829936826762=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Tue, 11 Oct 2022 04:33:30 -0000
Message-ID: <166546281092.5540.15572880769203118540@emeril.freedesktop.org>
References: <20221010201130.35343-1-mohammed.thasleem@intel.com>
In-Reply-To: <20221010201130.35343-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fproperties=3A_IGT_test_Cleanup?=
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

--===============1052065829936826762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_properties: IGT test Cleanup
URL   : https://patchwork.freedesktop.org/series/109555/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12231_full -> IGTPW_7942_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7942_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7942_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/index.html

Participating hosts (9 -> 6)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7942_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-tglb1/igt@i915_suspend@debugfs-reader.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@i915_suspend@debugfs-reader.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12231_full and IGTPW_7942_full:

### New IGT tests (93) ###

  * igt@kms_properties@connector-properties-atomic@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.52, 8.58] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.28, 9.41] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_properties@connector-properties-atomic@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_properties@connector-properties-atomic@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.27, 9.41] s

  * igt@kms_properties@connector-properties-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_properties@connector-properties-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.29] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.49, 8.70] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.28, 9.39] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_properties@connector-properties-legacy@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_properties@connector-properties-legacy@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.36, 9.41] s

  * igt@kms_properties@connector-properties-legacy@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_properties@connector-properties-legacy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.36] s

  * igt@kms_properties@crtc-properties-atomic@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_properties@crtc-properties-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_properties@crtc-properties-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_properties@crtc-properties-atomic@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_properties@crtc-properties-atomic@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_properties@crtc-properties-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_properties@crtc-properties-atomic@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_properties@crtc-properties-atomic@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_properties@crtc-properties-atomic@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_properties@crtc-properties-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.84] s

  * igt@kms_properties@crtc-properties-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_properties@crtc-properties-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_properties@invalid-properties-atomic@dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_properties@invalid-properties-atomic@dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@dp-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_properties@invalid-properties-atomic@hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_properties@invalid-properties-atomic@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_properties@invalid-properties-atomic@pipe-a-plane:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@kms_properties@invalid-properties-atomic@pipe-b:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_properties@invalid-properties-atomic@pipe-b-plane:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@kms_properties@invalid-properties-atomic@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@pipe-c-plane:
    - Statuses : 4 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@kms_properties@invalid-properties-atomic@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@pipe-d-plane:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_properties@invalid-properties-atomic@vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@invalid-properties-legacy@dp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_properties@invalid-properties-legacy@dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@dp-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@pipe-a-plane:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@kms_properties@invalid-properties-legacy@pipe-b:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@pipe-b-plane:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@kms_properties@invalid-properties-legacy@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@pipe-c-plane:
    - Statuses : 4 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@kms_properties@invalid-properties-legacy@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@pipe-d-plane:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_properties@invalid-properties-legacy@vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_properties@plane-properties-atomic@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_properties@plane-properties-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_properties@plane-properties-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_properties@plane-properties-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.85] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.48] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.48] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_properties@plane-properties-legacy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  

Known issues
------------

  Here are the changes found in IGTPW_7942_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#5327])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         NOTRUN -> [FAIL][5] ([i915#2410])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#4525])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk8/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2842]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([fdo#109283] / [i915#4877])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@gem_exec_params@no-vebox.html
    - shard-iclb:         NOTRUN -> [SKIP][14] ([fdo#109283])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb1/igt@gem_exec_params@no-vebox.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4613]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl8/igt@gem_lmem_swapping@verify-random.html
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#4613]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@gem_lmem_swapping@verify-random.html
    - shard-glk:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#4270])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#4270]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][21] ([i915#4991])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl1/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#3297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#3297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#2527] / [i915#2856]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#2856]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_hangman@gt-error-state-capture@vcs0:
    - shard-iclb:         [PASS][26] -> [INCOMPLETE][27] ([i915#7057])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb2/igt@i915_hangman@gt-error-state-capture@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb1/igt@i915_hangman@gt-error-state-capture@vcs0.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([i915#4281])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#5286]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#5286]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#111614]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111615])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110723])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#6095]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#3689] / [i915#6095]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3689] / [i915#3886]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [i915#3886]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3886]) +5 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278]) +14 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111615] / [i915#3689])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk5/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3742])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-snb7/igt@kms_chamelium@dp-crc-single.html
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl2/igt@kms_chamelium@dp-crc-single.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@dp-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk9/igt@kms_chamelium@dp-hpd-enable-disable-mode.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_chamelium@dp-hpd-enable-disable-mode.html

  * igt@kms_color@ctm-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][50] ([i915#315] / [i915#6946]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_color@ctm-0-25@pipe-b-edp-1.html

  * igt@kms_color@ctm-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [FAIL][51] ([i915#315]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_color@ctm-0-25@pipe-c-edp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3359]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#3359])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3555]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109274] / [fdo#111825]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#2346])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109274] / [fdo#111825] / [i915#3637]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109274]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-glk:          [PASS][60] -> [FAIL][61] ([i915#79])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][62] -> [DMESG-WARN][63] ([i915#180])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#2587] / [i915#2672]) +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#2587] / [i915#2672])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2672]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#6497]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271]) +136 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109280]) +17 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109280] / [fdo#111825]) +17 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271]) +102 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][72] ([i915#4573]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl7/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][73] ([i915#4573]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk9/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3536]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#5235]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#5235]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271]) +80 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#111068] / [i915#658])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#2920]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#658]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109642] / [fdo#111068] / [i915#658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#7037])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([fdo#109441]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb1/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#3555]) +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2437])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109289])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - shard-glk:          [PASS][90] -> [FAIL][91] ([i915#1731])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk2/igt@sysfs_heartbeat_interval@mixed@vecs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk5/igt@sysfs_heartbeat_interval@mixed@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][92] ([i915#4525]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][94] ([i915#2846]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk2/igt@gem_exec_fair@basic-deadline.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][96] ([i915#2842]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][98] ([i915#2842]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-tglb:         [INCOMPLETE][100] ([i915#6987]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-tglb3/igt@kms_addfb_basic@legacy-format.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [DMESG-WARN][102] ([i915#180]) -> [PASS][103] +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][104] ([fdo#109441]) -> [PASS][105] +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][106] ([i915#6117]) -> [SKIP][107] ([i915#4525])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-apl:          [INCOMPLETE][108] ([i915#7121]) -> [INCOMPLETE][109] ([i915#1319] / [i915#7121])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-apl6/igt@kms_content_protection@legacy@pipe-a-dp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl2/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][110] ([fdo#111068] / [i915#658]) -> [SKIP][111] ([i915#2920])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][112] ([i915#2920]) -> [SKIP][113] ([fdo#111068] / [i915#658])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6987]: https://gitlab.freedesktop.org/drm/intel/issues/6987
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7057]: https://gitlab.freedesktop.org/drm/intel/issues/7057
  [i915#7121]: https://gitlab.freedesktop.org/drm/intel/issues/7121
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7007 -> IGTPW_7942
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12231: bb84c1baa34eed834400e9a3cf9642840be002e1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7942: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/index.html
  IGT_7007: 39a979fb4453c557022f0477c609afe10a049e48 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/index.html

--===============1052065829936826762==
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
<tr><td><b>Series:</b></td><td>tests/kms_properties: IGT test Cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109555/">https://patchwork.freedesktop.org/series/109555/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12231_full -&gt; IGTPW_7942_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7942_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7942_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/index.html</p>
<h2>Participating hosts (9 -&gt; 6)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7942_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_suspend@debugfs-reader:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-tglb1/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12231_full and IGTPW_7942_full:</p>
<h3>New IGT tests (93)</h3>
<ul>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.52, 8.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.28, 9.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.27, 9.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.49, 8.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.28, 9.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.36, 9.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@dp-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-a-plane:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-b-plane:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-c-plane:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-d-plane:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@dp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@dp-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-a-plane:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-b-plane:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-c-plane:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-d-plane:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7942_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@gem_ccs@block-copy-uncompressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5327">i915#5327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk8/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@gem_exec_params@no-vebox.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4877">i915#4877</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb1/igt@gem_exec_params@no-vebox.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb7/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-error-state-capture@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb2/igt@i915_hangman@gt-error-state-capture@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb1/igt@i915_hangman@gt-error-state-capture@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7057">i915#7057</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110725">fdo#110725</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk5/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-snb7/igt@kms_chamelium@dp-crc-single.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl2/igt@kms_chamelium@dp-crc-single.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_chamelium@dp-crc-single.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk9/igt@kms_chamelium@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_chamelium@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_color@ctm-0-25@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/315">i915#315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6946">i915#6946</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/315">i915#315</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6497">i915#6497</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +136 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl7/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk9/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +80 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7037">i915#7037</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb1/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl7/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk2/igt@sysfs_heartbeat_interval@mixed@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk5/igt@sysfs_heartbeat_interval@mixed@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-glk2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-tglb3/igt@kms_addfb_basic@legacy-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6987">i915#6987</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-tglb7/igt@kms_addfb_basic@legacy-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-apl6/igt@kms_content_protection@legacy@pipe-a-dp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7121">i915#7121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-apl2/igt@kms_content_protection@legacy@pipe-a-dp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7121">i915#7121</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12231/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7007 -&gt; IGTPW_7942</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12231: bb84c1baa34eed834400e9a3cf9642840be002e1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7942: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7942/index.html<br />
  IGT_7007: 39a979fb4453c557022f0477c609afe10a049e48 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1052065829936826762==--
