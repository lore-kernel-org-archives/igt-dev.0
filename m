Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8374813521848867640=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Fri, 07 Oct 2022 06:48:09 -0000
Message-ID: <166512528971.15727.3959133864885156794@emeril.freedesktop.org>
References: <20220918172906.1567759-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220918172906.1567759-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fproperties=3A_Create_dynamic_subtests_=28rev5=29?=
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

--===============8374813521848867640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_properties: Create dynamic subtests (rev5)
URL   : https://patchwork.freedesktop.org/series/108695/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12223_full -> IGTPW_7920_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/index.html

Participating hosts (12 -> 9)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7920_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_color_chamelium@ctm-limited-range:
    - {shard-rkl}:        [SKIP][1] ([fdo#111827]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-5/igt@kms_color_chamelium@ctm-limited-range.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-5/igt@kms_color_chamelium@ctm-limited-range.html

  * igt@kms_properties@connector-properties-atomic:
    - {shard-rkl}:        [PASS][3] -> [SKIP][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-5/igt@kms_properties@connector-properties-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-4/igt@kms_properties@connector-properties-atomic.html

  * igt@kms_properties@plane-properties-atomic:
    - {shard-rkl}:        NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-3/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_properties@plane-properties-legacy:
    - {shard-rkl}:        [SKIP][6] ([i915#4098]) -> [SKIP][7] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html

  * igt@perf@stress-open-close:
    - {shard-rkl}:        [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-5/igt@perf@stress-open-close.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-1/igt@perf@stress-open-close.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12223_full and IGTPW_7920_full:

### New IGT tests (97) ###

  * igt@kms_properties@connector-properties-atomic@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.54, 8.57] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 1.48] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_properties@connector-properties-atomic@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.34, 9.41] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 1.27] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_properties@connector-properties-atomic@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_properties@connector-properties-atomic@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_properties@connector-properties-atomic@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.28, 9.39] s

  * igt@kms_properties@connector-properties-atomic@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 1.27] s

  * igt@kms_properties@connector-properties-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_properties@connector-properties-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.28] s

  * igt@kms_properties@connector-properties-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_properties@connector-properties-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.49, 8.55] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 1.56] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_properties@connector-properties-legacy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.29, 9.39] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 1.41] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_properties@connector-properties-legacy@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_properties@connector-properties-legacy@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_properties@connector-properties-legacy@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.33, 9.43] s

  * igt@kms_properties@connector-properties-legacy@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 1.34] s

  * igt@kms_properties@connector-properties-legacy@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_properties@connector-properties-legacy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.28] s

  * igt@kms_properties@connector-properties-legacy@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_properties@connector-properties-legacy@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_properties@invalid-properties-atomic@edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_properties@invalid-properties-atomic@hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_properties@invalid-properties-atomic@hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_properties@invalid-properties-atomic@hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-atomic@pipe-a-plane:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.12] s

  * igt@kms_properties@invalid-properties-atomic@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-atomic@pipe-b-plane:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.12] s

  * igt@kms_properties@invalid-properties-atomic@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-atomic@pipe-c-plane:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.12] s

  * igt@kms_properties@invalid-properties-atomic@pipe-d:
    - Statuses : 3 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-atomic@pipe-d-plane:
    - Statuses : 3 pass(s)
    - Exec time: [0.06, 0.11] s

  * igt@kms_properties@invalid-properties-atomic@vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@invalid-properties-legacy@dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_properties@invalid-properties-legacy@hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@pipe-a:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@pipe-a-plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.11] s

  * igt@kms_properties@invalid-properties-legacy@pipe-b:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@pipe-b-plane:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.11] s

  * igt@kms_properties@invalid-properties-legacy@pipe-c:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_properties@invalid-properties-legacy@pipe-c-plane:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.11] s

  * igt@kms_properties@invalid-properties-legacy@pipe-d:
    - Statuses : 3 pass(s)
    - Exec time: [0.01] s

  * igt@kms_properties@invalid-properties-legacy@pipe-d-plane:
    - Statuses : 3 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@kms_properties@invalid-properties-legacy@vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.65] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.72] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_properties@plane-properties-atomic@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.50] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_properties@plane-properties-atomic@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_properties@plane-properties-atomic@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_properties@plane-properties-atomic@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.45] s

  * igt@kms_properties@plane-properties-atomic@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.57] s

  * igt@kms_properties@plane-properties-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_properties@plane-properties-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_properties@plane-properties-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_properties@plane-properties-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.65] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.73] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_properties@plane-properties-legacy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.50] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_properties@plane-properties-legacy@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.45] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.59] s

  * igt@kms_properties@plane-properties-legacy@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_properties@plane-properties-legacy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  

Known issues
------------

  Here are the changes found in IGTPW_7920_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-snb2/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#5784])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglb8/igt@gem_eio@reset-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#4525]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb7/igt@gem_exec_fair@basic-pace@bcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][22] -> [SKIP][23] ([i915#2190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl2/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk7/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109289]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@gen7_exec_parse@basic-allowed.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109289]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb7/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#2527] / [i915#2856])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb2/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#2856])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [PASS][30] -> [DMESG-FAIL][31] ([i915#5334])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#6987])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglb5/igt@kms_addfb_basic@legacy-format.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb7/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#5286])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#5286])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110725] / [fdo#111614])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb7/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111614])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111615]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110723]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#6095]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278] / [i915#3886]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278]) +10 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3689] / [i915#6095]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615] / [i915#3689])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb8/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271]) +74 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl1/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb7/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl2/igt@kms_chamelium@dp-hpd-after-suspend.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb2/igt@kms_chamelium@dp-hpd-after-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk7/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-snb4/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][54] ([i915#1319]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271]) +55 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk3/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109300] / [fdo#111066])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb7/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#1063])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_content_protection@lic.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#2346])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][60] -> [FAIL][61] ([i915#4767])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb2/igt@kms_flip@2x-flip-vs-fences.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [PASS][64] -> [FAIL][65] ([i915#79])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2587] / [i915#2672]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#2587] / [i915#2672])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#2672] / [i915#3555])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#2672]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109280] / [fdo#111825]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109280]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#112054] / [i915#5288])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#3536]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb4/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#5235]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#5235]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#111068] / [i915#658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2920])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][80] -> [SKIP][81] ([fdo#109441]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb5/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][82] ([i915#132] / [i915#3467])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109441])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#5289])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#5289])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][86] ([fdo#109271]) +128 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-snb4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][87] -> [DMESG-WARN][88] ([i915#180]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2437])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb2/igt@kms_writeback@writeback-fb-id.html
    - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2437])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk3/igt@kms_writeback@writeback-fb-id.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2437])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@kms_writeback@writeback-fb-id.html
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2437])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl6/igt@kms_writeback@writeback-fb-id.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - {shard-rkl}:        [TIMEOUT][93] ([i915#5748]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-5/igt@gem_busy@close-race.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-3/igt@gem_busy@close-race.html

  * igt@gem_create@create-clear@smem0:
    - {shard-rkl}:        [INCOMPLETE][95] -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-3/igt@gem_create@create-clear@smem0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-1/igt@gem_create@create-clear@smem0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-rkl}:        [FAIL][97] ([i915#6268]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-tglb:         [FAIL][99] ([i915#6268]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html
    - {shard-tglu}:       [FAIL][101] ([i915#6268]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-tglb:         [FAIL][103] ([i915#5099]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglb2/igt@gem_ctx_persistence@smoketest.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb5/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@unwedge-stress:
    - {shard-dg1}:        [FAIL][105] ([i915#5784]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-dg1-16/igt@gem_eio@unwedge-stress.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][107] ([i915#4525]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][111] ([i915#2842]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_reloc@basic-write-read:
    - {shard-rkl}:        [SKIP][115] ([i915#3281]) -> [PASS][116] +4 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - {shard-dg1}:        [DMESG-WARN][117] ([i915#4936]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pread@uncached:
    - {shard-rkl}:        [SKIP][119] ([i915#3282]) -> [PASS][120] +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-4/igt@gem_pread@uncached.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-5/igt@gem_pread@uncached.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][121] ([i915#5566] / [i915#716]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-glk3/igt@gen9_exec_parse@allowed-all.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@shadow-peek:
    - {shard-rkl}:        [SKIP][123] ([i915#2527]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][125] ([i915#6258]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-3/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [FAIL][127] ([i915#3989]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb7/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][129] ([i915#3989] / [i915#454]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - {shard-rkl}:        [FAIL][131] ([i915#4016]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-1/igt@i915_pm_rps@waitboost.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-1/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - {shard-tglu}:       [FAIL][133] ([i915#3743]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - {shard-rkl}:        [SKIP][135] ([i915#1845] / [i915#4098]) -> [PASS][136] +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][137] ([i915#2346]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor@varying-size:
    - shard-iclb:         [FAIL][139] ([i915#2346]) -> [PASS][140] +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor@varying-size.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         [SKIP][141] ([i915#3555]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - {shard-rkl}:        [SKIP][143] ([i915#1849] / [i915#4098]) -> [PASS][144] +4 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][145] ([i915#433]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
    - {shard-tglu}:       [SKIP][147] ([i915#433]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][149] ([fdo#109441]) -> [PASS][150] +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - {shard-dg1}:        [FAIL][151] ([i915#4349]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-dg1-17/igt@perf_pmu@busy-double-start@rcs0.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-dg1-16/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@prime_vgem@basic-write:
    - {shard-rkl}:        [SKIP][153] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-rkl-6/igt@prime_vgem@basic-write.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-5/igt@prime_vgem@basic-write.html

  
#### Warnings ####

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][155] ([i915#2920]) -> [SKIP][156] ([i915#658])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][157] ([i915#658]) -> [SKIP][158] ([i915#2920])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][159] ([i915#2920]) -> [SKIP][160] ([fdo#111068] / [i915#658]) +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][161], [FAIL][162]) ([i915#3002] / [i915#4312]) -> ([FAIL][163], [FAIL][164], [FAIL][165], [FAIL][166]) ([i915#180] / [i915#3002] / [i915#4312])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl8/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl8/igt@runner@aborted.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl2/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl6/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl7/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4778]: https://gitlab.freedesktop.org/drm/intel/issues/4778
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5748]: https://gitlab.freedesktop.org/drm/intel/issues/5748
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6987]: https://gitlab.freedesktop.org/drm/intel/issues/6987
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7002 -> IGTPW_7920
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12223: c53a5e48e0405a63cda64682304cd8b391025be3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7920: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/index.html
  IGT_7002: 523844c74e7da6b39d856596c28a92f04172035f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/index.html

--===============8374813521848867640==
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
<tr><td><b>Series:</b></td><td>tests/kms_properties: Create dynamic subtest=
s (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/108695/">https://patchwork.freedesktop.org/series/108695/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7920/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12223_full -&gt; IGTPW_7920_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/index.=
html</p>
<h2>Participating hosts (12 -&gt; 9)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7920=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_color_chamelium@ctm-limited-range:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-5/igt@kms_color_chamelium@ctm-limited-range.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7920/shard-rkl-5/igt@kms_color_chamelium@ctm-limited-range.html">SKIP<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-5/igt@kms_properties@connector-properties-atomic.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7920/shard-rkl-4/igt@kms_properties@connector-properties-atomic.html">SKI=
P</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-rkl-3/igt@kms_properties@plane-properties-at=
omic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">=
i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7920/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html">SKIP<=
/a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-5/igt@perf@stress-open-close.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-1/i=
gt@perf@stress-open-close.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12223_full and IGTPW_7920_=
full:</p>
<h3>New IGT tests (97)</h3>
<ul>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.54, 8.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.34, 9.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
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
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.28, 9.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.49, 8.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
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
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.29, 9.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
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
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.33, 9.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
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
<p>igt@kms_properties@invalid-properties-atomic@hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-a-plane:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-b-plane:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-c-plane:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-atomic@pipe-d-plane:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.06, 0.11] s</li>
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
<li>Statuses : 1 pass(s)</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-a:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-a-plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-b:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-b-plane:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-c:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-c-plane:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.02, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy@pipe-d-plane:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
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
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
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
<li>Exec time: [1.34, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7920_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-snb2/igt@gem_ctx_persistence@engines-cleanup=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-tglb8/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb1/igt=
@gem_eio@reset-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/=
shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/s=
hard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/s=
hard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb7/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-=
iclb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb7/ig=
t@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-apl2/igt@gem_lmem_swapping@parallel-random-en=
gines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-glk7/igt@gem_lmem_swapping@parallel-random-en=
gines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb3/igt@gen7_exec_parse@basic-allowed.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb7/igt@gen7_exec_parse@basic-allowed.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb2/igt@gen9_exec_parse@cmd-crossing-page.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb8/igt@gen9_exec_parse@cmd-crossing-page.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard=
-apl1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-tglb5/igt@kms_addfb_basic@legacy-format.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-=
tglb7/igt@kms_addfb_basic@legacy-format.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/6987">i915#6987</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb7/igt@kms_big_fb@linear-16bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111615">fdo#111615</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D110723">fdo#110723</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb1/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_ccs@pipe-c-bad-pixel-format-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_ccs@pipe-c-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-tglb8/igt@kms_ccs@pipe-c-crc-primary-basic-y=
f_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-apl1/igt@kms_ccs@pipe-d-bad-pixel-format-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +74 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb7/igt@kms_ccs@pipe-d-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-apl2/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb2/igt@kms_chamelium@dp-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-glk7/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-iclb2/igt@kms_chamelium@vga-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-snb4/igt@kms_chamelium@vga-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-apl3/igt@kms_content_protection@atomic.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-glk3/igt@kms_content_protection@lic.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a>) +55 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb7/igt@kms_content_protection@lic.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">f=
do#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_content_protection@lic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i9=
15#1063</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7920/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl6/=
igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb2/igt@kms_flip@2x-flip-vs-fences.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">f=
do#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3637">i915#3637</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb2/igt@kms_flip@2x-flip-vs-fences.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">f=
do#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-dp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7920/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@a-dp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) =
+4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#35=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +3 similar iss=
ues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-tglb3/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-iclb4/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-=
edp-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb7/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issu=
es</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb7/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issu=
es</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-glk6/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb5/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_cpu.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i=
915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/34=
67">i915#3467</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441"=
>fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb5/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-snb4/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +128 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7920/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-tglb2/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437"=
>i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-glk3/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-iclb2/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437"=
>i915#2437</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7920/shard-apl6/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-5/igt@gem_busy@close-race.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5748">i915#5748</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-r=
kl-3/igt@gem_busy@close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear@smem0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-3/igt@gem_create@create-clear@smem0.html">INCOMPLET=
E</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/=
shard-rkl-1/igt@gem_create@create-clear@smem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12223/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/=
shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12223/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/=
shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12223/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920=
/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-tglb2/igt@gem_ctx_persistence@smoketest.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5099">i915#5099=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/=
shard-tglb5/igt@gem_ctx_persistence@smoketest.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-dg1-16/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-=
dg1-12/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7920/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7920/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7920/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
920/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#32=
81</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_792=
0/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">PASS</a> +4 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4936"=
>i915#4936</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7920/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-4/igt@gem_pread@uncached.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-5=
/igt@gem_pread@uncached.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-glk3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7920/shard-glk9/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/sh=
ard-rkl-5/igt@gen9_exec_parse@shadow-peek.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6258">i=
915#6258</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7920/shard-rkl-3/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-tglb7/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-tglb7=
/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-i=
clb2/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-1/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-rk=
l-1/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotat=
e-0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7920/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen=
12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7920/shard-rkl-6/igt@kms_ccs@pipe-b-missing-cc=
s-buffer-y_tiled_gen12_rc_ccs_cc.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7920/shard-glk8/igt@kms_cursor_legacy@flip-vs-=
cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@varying-size=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7920/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor@varying-si=
ze.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-iclb3/igt@km=
s_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-def=
ault-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7920/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb=
-scaledprimary.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12223/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shar=
d-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12223/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/sha=
rd-tglu-5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_792=
0/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-dg1-17/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_79=
20/shard-dg1-16/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#329=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708">i9=
15#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7920/shard-rkl-5/igt@prime_vgem@basic-write.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7920/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7920/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/292=
0">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12223/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915=
#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7920/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12223/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12223/shard-apl8/igt@runner@ab=
orted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4312">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7920/shard-apl2/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl6/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7920/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/shard-apl2/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7002 -&gt; IGTPW_7920</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12223: c53a5e48e0405a63cda64682304cd8b391025be3 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7920: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7920/index.htm=
l<br />
  IGT_7002: 523844c74e7da6b39d856596c28a92f04172035f @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8374813521848867640==--
