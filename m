Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2196867823410125238=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Fri, 23 Sep 2022 14:50:56 -0000
Message-ID: <166394465680.30120.8787970827268540546@emeril.freedesktop.org>
References: <20220921152044.26196-1-karthik.b.s@intel.com>
In-Reply-To: <20220921152044.26196-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Falpha=5Fblend=3A_Convert_test_to_dynamic_=28rev3?=
 =?utf-8?q?=29?=
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

--===============2196867823410125238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_alpha_blend: Convert test to dynamic (rev3)
URL   : https://patchwork.freedesktop.org/series/108500/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6660_full -> IGTPW_7813_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7813_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7813_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/index.html

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): shard-rkl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7813_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][1] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1.html

  * {igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][2] +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb5/igt@kms_vblank@pipe-b-accuracy-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb6/igt@kms_vblank@pipe-b-accuracy-idle.html

  
New tests
---------

  New tests have been introduced between IGT_6660_full and IGTPW_7813_full:

### New IGT tests (111) ###

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.50] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.91, 2.28] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.91, 2.29] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_plane_alpha_blend@alpha-basic:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.33] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.88] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.47, 4.25] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.38] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.74] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.26] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.46] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.38] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.73] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.47, 4.27] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.71] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.27] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.35] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.24, 1.75] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.39, 0.74] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.08, 2.58] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.04, 2.54] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.43, 0.76] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.40] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.23, 1.71] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.53, 0.76] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.55] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.44] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.11, 2.56] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.44, 0.75] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.39] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 3.13] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.48] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.97, 3.95] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.43] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.39] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.00, 3.96] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.01] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.69, 2.41] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.09, 1.58] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.51, 3.21] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.56, 3.26] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.12, 1.45] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.70, 2.41] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.08, 1.54] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.58, 3.22] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.53, 3.27] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.11, 1.41] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.48] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.89, 2.29] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.91, 2.29] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.08, 1.48] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 1.04] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.90, 2.31] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.92, 2.31] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.94] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  

Known issues
------------

  Here are the changes found in IGTPW_7813_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#280])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#4525]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#2842]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][10] ([i915#2842]) +4 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb1/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2842]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842]) +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_lmem_swapping@basic:
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl6/igt@gem_lmem_swapping@basic.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#4270])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb7/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#4270]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#768])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#109289]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#109289]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@gen9_exec_parse@bb-start-param.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#2527] / [i915#2856])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#111644] / [i915#1397] / [i915#2411])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#5286])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#5286])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#110723])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#111615]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3689]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#3886]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl3/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109278] / [i915#3886]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#3689] / [i915#3886])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3886]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111615] / [i915#3689]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk1/igt@kms_chamelium@hdmi-crc-fast.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb1/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-snb5/igt@kms_chamelium@vga-hpd-fast.html
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl7/igt@kms_chamelium@vga-hpd-fast.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb2/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_color@ctm-0-25@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][41] ([i915#315]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl1/igt@kms_color@ctm-0-25@pipe-b-dp-1.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3116] / [i915#3299])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#3555]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109274] / [fdo#111825])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#2346]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109274]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271]) +105 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#2672]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#3555]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([i915#3555])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#2587] / [i915#2672])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#2587] / [i915#2672]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#6497]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271]) +80 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109280] / [fdo#111825]) +8 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271]) +38 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109280]) +6 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#6524])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb2/igt@kms_prime@basic-modeset-hybrid.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#6524])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb7/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#658]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#2920])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk3/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#111068] / [i915#658])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][69] -> [SKIP][70] ([fdo#109642] / [fdo#111068] / [i915#658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][71] ([i915#132] / [i915#3467]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@kms_psr@psr2_cursor_mmap_gtt.html
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109441])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][73] -> [SKIP][74] ([fdo#109441]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278]) +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#2437])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#2530])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-detection.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2530]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109291]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109291]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109295])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@prime_vgem@fence-write-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109295])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@busy:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#2994])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb3/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@split-50:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2994])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][85] ([i915#6268]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [FAIL][87] ([i915#5784]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb3/igt@gem_eio@reset-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb6/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][89] ([i915#4525]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][91] ([i915#2842]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][93] ([i915#433]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
    - {shard-tglu}:       [SKIP][95] ([i915#433]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][97] ([i915#5235]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [SKIP][99] ([i915#5519]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@perf_pmu@rc6-suspend:
    - shard-apl:          [DMESG-WARN][101] ([i915#180]) -> [PASS][102] +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl8/igt@perf_pmu@rc6-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-iclb:         [WARN][103] ([i915#2684]) -> [FAIL][104] ([i915#2684])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][105] ([i915#2920]) -> [SKIP][106] ([i915#658])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][107] ([fdo#111068] / [i915#658]) -> [SKIP][108] ([i915#2920]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6660 -> IGTPW_7813

  CI-20190529: 20190529
  CI_DRM_12166: 3e89f6dc5d22dcc4f56bed3abade8107c95815b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7813: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/index.html
  IGT_6660: 129bea58b9424f0a0da995311a219fdf57732594 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/index.html

--===============2196867823410125238==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_alpha_blend: Convert test to dynamic (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108500/">https://patchwork.freedesktop.org/series/108500/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6660_full -&gt; IGTPW_7813_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7813_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7813_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/index.html</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): shard-rkl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7813_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb5/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb6/igt@kms_vblank@pipe-b-accuracy-idle.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6660_full and IGTPW_7813_full:</p>
<h3>New IGT tests (111)</h3>
<ul>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.91, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.91, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.47, 4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.47, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.39, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.08, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.04, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.43, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.23, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.53, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.11, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.44, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.97, 3.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.00, 3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.69, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.09, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.51, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.56, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.12, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.70, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.08, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.58, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.53, 3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.11, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.89, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.91, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.08, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.90, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.92, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7813_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb1/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl6/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb7/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl3/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk1/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb1/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-snb5/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl7/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb2/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl1/igt@kms_color@ctm-0-25@pipe-b-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/315">i915#315</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +105 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6497">i915#6497</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +80 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb2/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb7/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-glk3/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb8/igt@kms_psr@psr2_cursor_mmap_gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/132">i915#132</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3467">i915#3467</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb3/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@prime_nv_test@i915_import_pread_pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb3/igt@sysfs_clients@busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@sysfs_clients@split-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb3/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb6/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5519">i915#5519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl8/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-apl2/igt@perf_pmu@rc6-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6660 -&gt; IGTPW_7813</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12166: 3e89f6dc5d22dcc4f56bed3abade8107c95815b3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7813: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7813/index.html<br />
  IGT_6660: 129bea58b9424f0a0da995311a219fdf57732594 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2196867823410125238==--
