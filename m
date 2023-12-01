Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8173587563103064062=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 01 Dec 2023 17:36:02 -0000
Message-ID: <170145216278.19685.14764088232509259819@emeril.freedesktop.org>
References: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvrr=3A_Add_new_subtest_to_switch_RR_without_modeset_=28re?=
 =?utf-8?b?djUp?=
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

--===============8173587563103064062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Add new subtest to switch RR without modeset (rev5)
URL   : https://patchwork.freedesktop.org/series/127047/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13960 -> IGTPW_10320
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (2): bat-dg2-8 fi-pnv-d510 
  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10320:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_vrr@seamless-rr-switch} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch.html
    - bat-adls-5:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adls-5/igt@kms_vrr@seamless-rr-switch.html
    - bat-dg1-5:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg1-5/igt@kms_vrr@seamless-rr-switch.html
    - bat-adlp-9:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-9/igt@kms_vrr@seamless-rr-switch.html
    - bat-dg2-11:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-11/igt@kms_vrr@seamless-rr-switch.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-14/igt@kms_vrr@seamless-rr-switch.html
    - bat-dg2-8:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-8/igt@kms_vrr@seamless-rr-switch.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch.html
    - bat-dg2-9:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-9/igt@kms_vrr@seamless-rr-switch.html
    - bat-adlp-11:        NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-11/igt@kms_vrr@seamless-rr-switch.html

  * {igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1} (NEW):
    - bat-jsl-3:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-jsl-3/igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1.html
    - bat-jsl-1:          NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-jsl-1/igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13960 and IGTPW_10320:

### New IGT tests (2) ###

  * igt@kms_vrr@seamless-rr-switch:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10320 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] ([i915#3555]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-rkl-11600/igt@kms_vrr@flip-basic.html
    - bat-atsm-1:         NOTRUN -> [SKIP][14] ([i915#6078]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-atsm-1/igt@kms_vrr@flip-basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][15] ([fdo#109271]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-cfl-guc/igt@kms_vrr@flip-basic.html
    - bat-jsl-3:          NOTRUN -> [SKIP][16] ([i915#3555]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-jsl-3/igt@kms_vrr@flip-basic.html
    - bat-dg2-9:          NOTRUN -> [SKIP][17] ([i915#3555]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-9/igt@kms_vrr@flip-basic.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#1845]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-x1275/igt@kms_vrr@flip-basic.html
    - bat-adlp-11:        NOTRUN -> [SKIP][19] ([i915#3555]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-11/igt@kms_vrr@flip-basic.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][20] ([fdo#109271]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-cfl-8109u/igt@kms_vrr@flip-basic.html
    - bat-adln-1:         NOTRUN -> [SKIP][21] ([i915#3555]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adln-1/igt@kms_vrr@flip-basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][22] ([fdo#109271]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-ivb-3770/igt@kms_vrr@flip-basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][23] ([fdo#109271]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-elk-e7500/igt@kms_vrr@flip-basic.html
    - bat-dg2-8:          NOTRUN -> [SKIP][24] ([i915#3555]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-8/igt@kms_vrr@flip-basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#1845]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-guc/igt@kms_vrr@flip-basic.html
    - bat-adlm-1:         NOTRUN -> [SKIP][26] ([i915#1845]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlm-1/igt@kms_vrr@flip-basic.html
    - fi-ilk-650:         NOTRUN -> [SKIP][27] ([fdo#109271]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-ilk-650/igt@kms_vrr@flip-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][28] ([i915#3555]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-jsl-1/igt@kms_vrr@flip-basic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][29] ([i915#3555]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][30] ([i915#1845]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-mtlp-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - fi-skl-guc:         NOTRUN -> [SKIP][31] ([fdo#109271]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-skl-guc/igt@kms_vrr@flipline.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][32] ([fdo#109271]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-cfl-8700k/igt@kms_vrr@flipline.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][33] ([fdo#109271]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-blb-e6850/igt@kms_vrr@flipline.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][34] ([fdo#109271]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-bsw-nick/igt@kms_vrr@flipline.html
    - bat-adlp-6:         NOTRUN -> [SKIP][35] ([i915#3555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-6/igt@kms_vrr@flipline.html
    - bat-rplp-1:         NOTRUN -> [SKIP][36] ([i915#3555]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-rplp-1/igt@kms_vrr@flipline.html
    - bat-dg1-7:          NOTRUN -> [SKIP][37] ([i915#1845]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg1-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - bat-kbl-2:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#1845]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-kbl-2/igt@kms_vrr@negative-basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][39] ([fdo#109271]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-skl-6600u/igt@kms_vrr@negative-basic.html
    - bat-adls-5:         NOTRUN -> [SKIP][40] ([i915#3555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adls-5/igt@kms_vrr@negative-basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][41] ([fdo#109271]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-apl-guc/igt@kms_vrr@negative-basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][42] ([i915#3555]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg1-5/igt@kms_vrr@negative-basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][43] ([fdo#109271]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-pnv-d510/igt@kms_vrr@negative-basic.html
    - bat-dg1-7:          NOTRUN -> [SKIP][44] ([i915#1845] / [i915#4078])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg1-7/igt@kms_vrr@negative-basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][45] ([i915#3555]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-11/igt@kms_vrr@negative-basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][46] ([fdo#109271]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-7567u/igt@kms_vrr@negative-basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][47] ([i915#3555])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-9/igt@kms_vrr@negative-basic.html

  * {igt@kms_vrr@seamless-rr-switch} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][48] ([fdo#109271]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-bsw-n3050/igt@kms_vrr@seamless-rr-switch.html
    - bat-kbl-2:          NOTRUN -> [SKIP][49] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-kbl-2/igt@kms_vrr@seamless-rr-switch.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][50] ([fdo#109271]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-glk-j4005/igt@kms_vrr@seamless-rr-switch.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][51] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-guc/igt@kms_vrr@seamless-rr-switch.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][52] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7614 -> IGTPW_10320

  CI-20190529: 20190529
  CI_DRM_13960: 9adc1aba5de6959c54a990b92594c2364366e8db @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10320: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/index.html
  IGT_7614: c7298ec108dc1c861c9a2593e973648ad9b420b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_vrr@seamless-rr-switch

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/index.html

--===============8173587563103064062==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Add new subtest to switch RR without modeset (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127047/">https://patchwork.freedesktop.org/series/127047/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13960 -&gt; IGTPW_10320</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (2): bat-dg2-8 fi-pnv-d510 <br />
  Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10320:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_vrr@seamless-rr-switch} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adls-5/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg1-5/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-9/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-11/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-14/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-8/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-9/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-11/igt@kms_vrr@seamless-rr-switch.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-jsl-3/igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-jsl-1/igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13960 and IGTPW_10320:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_vrr@seamless-rr-switch:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10320 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-rkl-11600/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-atsm-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-cfl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-jsl-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-x1275/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-11/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-cfl-8109u/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adln-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-ivb-3770/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-elk-e7500/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-guc/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlm-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-ilk-650/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-jsl-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-tgl-1115g4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-mtlp-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-skl-guc/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-cfl-8700k/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-blb-e6850/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-bsw-nick/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-rplp-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg1-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-kbl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-skl-6600u/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adls-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-apl-guc/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg1-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-pnv-d510/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg1-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-dg2-11/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-7567u/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-adlp-9/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_vrr@seamless-rr-switch} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-bsw-n3050/igt@kms_vrr@seamless-rr-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/bat-kbl-2/igt@kms_vrr@seamless-rr-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-glk-j4005/igt@kms_vrr@seamless-rr-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-guc/igt@kms_vrr@seamless-rr-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7614 -&gt; IGTPW_10320</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13960: 9adc1aba5de6959c54a990b92594c2364366e8db @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10320: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10320/index.html<br />
  IGT_7614: c7298ec108dc1c861c9a2593e973648ad9b420b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_vrr@seamless-rr-switch</p>

</body>
</html>

--===============8173587563103064062==--
