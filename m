Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7034478337769222183=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Thu, 26 Oct 2023 18:04:51 -0000
Message-ID: <169834349164.20472.10991190621085007550@emeril.freedesktop.org>
References: <20231026120233.1044177-1-kunal1.joshi@intel.com>
In-Reply-To: <20231026120233.1044177-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgYWRkZWQg?=
 =?utf-8?q?new_subtest_simultaneous-modeset?=
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

--===============7034478337769222183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: added new subtest simultaneous-modeset
URL   : https://patchwork.freedesktop.org/series/125631/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13792 -> IGTPW_10074
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/index.html

Participating hosts (39 -> 37)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (3): fi-hsw-4770 fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10074:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_big_joiner@simultaneous-modeset} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [CRASH][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-tgl-1115g4/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-dg2-9:          NOTRUN -> [CRASH][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg2-9/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlp-11:        NOTRUN -> [CRASH][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-adlp-11/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-8109u:       NOTRUN -> [CRASH][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-cfl-8109u/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-ivb-3770:        NOTRUN -> [CRASH][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-ivb-3770/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-mtlp-8:         NOTRUN -> [CRASH][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-mtlp-8/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-ilk-650:         NOTRUN -> [CRASH][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-ilk-650/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-jsl-1:          NOTRUN -> [CRASH][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-jsl-1/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-rpls-1:         NOTRUN -> [CRASH][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-rpls-1/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlp-6:         NOTRUN -> [CRASH][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-adlp-6/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-skl-6600u:       NOTRUN -> [CRASH][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-skl-6600u/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-apl-guc:         NOTRUN -> [CRASH][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-apl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-dg1-5:          NOTRUN -> [CRASH][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg1-5/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-jsl-3:          NOTRUN -> [CRASH][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-jsl-3/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-glk-j4005:       NOTRUN -> [CRASH][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-glk-j4005/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlp-9:         NOTRUN -> [CRASH][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-adlp-9/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-skl-guc:         NOTRUN -> [CRASH][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-skl-guc/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-dg2-11:         NOTRUN -> [CRASH][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg2-11/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-cfl-8700k:       NOTRUN -> [CRASH][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-cfl-8700k/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-elk-e7500:       NOTRUN -> [CRASH][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-elk-e7500/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-bsw-nick:        NOTRUN -> [CRASH][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-bsw-nick/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-kbl-2:          NOTRUN -> [CRASH][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-kbl-2/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-adlm-1:         NOTRUN -> [CRASH][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-adlm-1/igt@kms_big_joiner@simultaneous-modeset.html
    - bat-rplp-1:         NOTRUN -> [CRASH][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-rplp-1/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-rkl-11600:       NOTRUN -> [CRASH][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-rkl-11600/igt@kms_big_joiner@simultaneous-modeset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13792 and IGTPW_10074:

### New IGT tests (1) ###

  * igt@kms_big_joiner@simultaneous-modeset:
    - Statuses : 25 crash(s) 8 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10074 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#1849])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][27] ([fdo#109271]) +39 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * {igt@kms_big_joiner@simultaneous-modeset} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][28] ([i915#6078])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-atsm-1/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-blb-e6850/igt@kms_big_joiner@simultaneous-modeset.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-pnv-d510/igt@kms_big_joiner@simultaneous-modeset.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][31] ([i915#1845] / [i915#9197])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg1-5:          [ABORT][32] ([i915#9413]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/bat-dg1-5/igt@i915_selftest@live@workarounds.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg1-5/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7559 -> IGTPW_10074

  CI-20190529: 20190529
  CI_DRM_13792: 6653204bd711f268e80ea3d84f135a923be6b28e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10074: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/index.html
  IGT_7559: 62ac3d2ddb6005b16df00a36565779848c1390c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_big_joiner@simultaneous-modeset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/index.html

--===============7034478337769222183==
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
<tr><td><b>Series:</b></td><td>added new subtest simultaneous-modeset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125631/">https://patchwork.freedesktop.org/series/125631/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13792 -&gt; IGTPW_10074</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (3): fi-hsw-4770 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10074:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_big_joiner@simultaneous-modeset} (NEW):</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-tgl-1115g4/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg2-9/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-adlp-11/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-cfl-8109u/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-ivb-3770/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-mtlp-8/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-ilk-650/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-jsl-1/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-rpls-1/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-adlp-6/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-skl-6600u/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-apl-guc/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg1-5/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-jsl-3/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-glk-j4005/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-adlp-9/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-skl-guc/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg2-11/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-cfl-8700k/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-elk-e7500/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-bsw-nick/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-kbl-2/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-adlm-1/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-rplp-1/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-rkl-11600/igt@kms_big_joiner@simultaneous-modeset.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13792 and IGTPW_10074:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_big_joiner@simultaneous-modeset:<ul>
<li>Statuses : 25 crash(s) 8 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10074 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@simultaneous-modeset} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-atsm-1/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-blb-e6850/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/fi-pnv-d510/igt@kms_big_joiner@simultaneous-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/bat-dg1-5/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/bat-dg1-5/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7559 -&gt; IGTPW_10074</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13792: 6653204bd711f268e80ea3d84f135a923be6b28e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10074: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10074/index.html<br />
  IGT_7559: 62ac3d2ddb6005b16df00a36565779848c1390c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@simultaneous-modeset</p>

</body>
</html>

--===============7034478337769222183==--
