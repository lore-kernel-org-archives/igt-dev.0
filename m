Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1986884498751675032=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 07 Dec 2023 07:59:48 -0000
Message-ID: <170193598873.28720.9980719464285826148@emeril.freedesktop.org>
References: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvrr=3A_Add_new_subtest_to_switch_RR_without_modeset_=28re?=
 =?utf-8?b?djcp?=
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

--===============1986884498751675032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Add new subtest to switch RR without modeset (rev7)
URL   : https://patchwork.freedesktop.org/series/127047/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13990 -> IGTPW_10364
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10364 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10364, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/index.html

Participating hosts (37 -> 36)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (2): bat-atsm-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10364:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@flip-basic-fastset (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html
    - bat-jsl-3:          NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-jsl-3/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg2-11:         NOTRUN -> [SKIP][3] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-11/igt@kms_vrr@flip-basic-fastset.html
    - bat-adln-1:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adln-1/igt@kms_vrr@flip-basic-fastset.html
    - bat-rplp-1:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-rplp-1/igt@kms_vrr@flip-basic-fastset.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-tgl-1115g4/igt@kms_vrr@flip-basic-fastset.html

  * {igt@kms_vrr@seamless-rr-switch-drrs} (NEW):
    - {bat-dg2-14}:       NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][8] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-adls-5:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adls-5/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-dg1-5:          NOTRUN -> [SKIP][10] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg1-5/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-dg2-9:          NOTRUN -> [SKIP][11] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-adlp-11:        NOTRUN -> [SKIP][12] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][13] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html
    - bat-dg2-8:          NOTRUN -> [SKIP][14] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * {igt@kms_vrr@seamless-rr-switch-vrr} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-jsl-1:          NOTRUN -> [SKIP][16] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-adlp-6:         NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13990 and IGTPW_10364:

### New IGT tests (7) ###

  * igt@kms_vrr@flip-basic-fastset:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@flip-basic-fastset@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.40] s

  * igt@kms_vrr@flip-basic-fastset@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [10.90] s

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.39] s

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@seamless-rr-switch-drrs@pipe-a-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [15.17, 16.34] s

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10364 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([i915#3555]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-rkl-11600/igt@kms_vrr@flip-basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][19] ([fdo#109271]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-cfl-guc/igt@kms_vrr@flip-basic.html
    - bat-jsl-3:          NOTRUN -> [SKIP][20] ([i915#3555]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-jsl-3/igt@kms_vrr@flip-basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][21] ([i915#3555]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-9/igt@kms_vrr@flip-basic.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][22] ([fdo#109271]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-kbl-x1275/igt@kms_vrr@flip-basic.html
    - bat-adlp-11:        NOTRUN -> [SKIP][23] ([i915#3555]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-11/igt@kms_vrr@flip-basic.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][24] ([fdo#109271]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-cfl-8109u/igt@kms_vrr@flip-basic.html
    - bat-adln-1:         NOTRUN -> [SKIP][25] ([i915#3555]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adln-1/igt@kms_vrr@flip-basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][26] ([i915#3555] / [i915#8808]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-mtlp-8/igt@kms_vrr@flip-basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][27] ([i915#3555]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-8/igt@kms_vrr@flip-basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][28] ([fdo#109271]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-kbl-guc/igt@kms_vrr@flip-basic.html
    - fi-ilk-650:         NOTRUN -> [SKIP][29] ([fdo#109271]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-ilk-650/igt@kms_vrr@flip-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][30] ([i915#3555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-jsl-1/igt@kms_vrr@flip-basic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][31] ([i915#3555]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][32] ([fdo#109271]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-pnv-d510/igt@kms_vrr@flip-basic-fastset.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][33] ([fdo#109271]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-glk-j4005/igt@kms_vrr@flip-basic-fastset.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-kbl-7567u/igt@kms_vrr@flip-basic-fastset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][35] ([fdo#109271]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-ivb-3770/igt@kms_vrr@flip-basic-fastset.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][36] ([fdo#109271]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-elk-e7500/igt@kms_vrr@flip-basic-fastset.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][37] ([i915#9792]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-mtlp-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - fi-skl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-skl-guc/igt@kms_vrr@flipline.html
    - bat-rplp-1:         NOTRUN -> [SKIP][39] ([i915#3555]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-rplp-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - bat-kbl-2:          NOTRUN -> [SKIP][40] ([fdo#109271]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-kbl-2/igt@kms_vrr@negative-basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][41] ([fdo#109271]) +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-skl-6600u/igt@kms_vrr@negative-basic.html
    - bat-adls-5:         NOTRUN -> [SKIP][42] ([i915#3555])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adls-5/igt@kms_vrr@negative-basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][43] ([fdo#109271]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-apl-guc/igt@kms_vrr@negative-basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][44] ([i915#3555]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg1-5/igt@kms_vrr@negative-basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][45] ([i915#3555]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg1-7/igt@kms_vrr@negative-basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][46] ([i915#3555]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-11/igt@kms_vrr@negative-basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][47] ([i915#3555])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-9/igt@kms_vrr@negative-basic.html

  * {igt@kms_vrr@seamless-rr-switch-drrs} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][48] ([fdo#109271]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][49] ([fdo#109271]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][50] ([fdo#109271]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#8808]: https://gitlab.freedesktop.org/drm/intel/issues/8808
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7626 -> IGTPW_10364

  CI-20190529: 20190529
  CI_DRM_13990: 85d33d0ad82a5c1a71492f14a5ceb67ada6a22d8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10364: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/index.html
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_vrr@flip-basic-fastset
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@seamless-rr-switch-vrr
-igt@xe_exec_basic@zero-execs
-igt@xe_vm@zero-binds

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/index.html

--===============1986884498751675032==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Add new subtest to switch RR without modeset (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127047/">https://patchwork.freedesktop.org/series/127047/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13990 -&gt; IGTPW_10364</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10364 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10364, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (2): bat-atsm-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10364:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic-fastset (NEW):</p>
<ul>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-jsl-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-11/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adln-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-rplp-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-tgl-1115g4/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@seamless-rr-switch-drrs} (NEW):</p>
<ul>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adls-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg1-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@seamless-rr-switch-vrr} (NEW):</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13990 and IGTPW_10364:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [15.17, 16.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10364 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-rkl-11600/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-cfl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-jsl-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-kbl-x1275/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-11/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-cfl-8109u/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adln-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-mtlp-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8808">i915#8808</a>) +1 other test skip</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-kbl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-ilk-650/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-jsl-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset (NEW):</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-pnv-d510/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-glk-j4005/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-kbl-7567u/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-ivb-3770/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-elk-e7500/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-mtlp-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +5 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-skl-guc/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-rplp-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-kbl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-skl-6600u/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adls-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-apl-guc/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg1-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg1-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-dg2-11/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/bat-adlp-9/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@seamless-rr-switch-drrs} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7626 -&gt; IGTPW_10364</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13990: 85d33d0ad82a5c1a71492f14a5ceb67ada6a22d8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10364: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10364/index.html<br />
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_vrr@flip-basic-fastset<br />
+igt@kms_vrr@seamless-rr-switch-drrs<br />
+igt@kms_vrr@seamless-rr-switch-vrr<br />
-igt@xe_exec_basic@zero-execs<br />
-igt@xe_vm@zero-binds</p>

</body>
</html>

--===============1986884498751675032==--
