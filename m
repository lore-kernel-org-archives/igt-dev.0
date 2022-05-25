Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3097540693243939866=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Date: Wed, 25 May 2022 20:04:37 -0000
Message-ID: <165350907749.16576.7582735496288869101@emeril.freedesktop.org>
References: <20220525170939.141509-1-mwen@igalia.com>
In-Reply-To: <20220525170939.141509-1-mwen@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdC9r?=
 =?utf-8?q?ms=5Fplane=5Falpha=5Fblend=3A_clearer_validation_for_coverage-7?=
 =?utf-8?q?efc?=
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

--===============3097540693243939866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/kms_plane_alpha_blend: clearer validation for coverage-7efc
URL   : https://patchwork.freedesktop.org/series/104366/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11700 -> IGTPW_7173
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7173 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7173, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/index.html

Participating hosts (46 -> 45)
------------------------------

  Additional (1): bat-adls-5 
  Missing    (2): fi-hsw-4770 bat-dg2-9 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7173:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@client:
    - fi-bdw-5557u:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-bdw-5557u/igt@i915_selftest@live@client.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-bdw-5557u/igt@i915_selftest@live@client.html

  
Known issues
------------

  Here are the changes found in IGTPW_7173 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem:
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][3] ([i915#4528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-pnv-d510/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][4] -> [INCOMPLETE][5] ([i915#4785])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [PASS][6] -> [DMESG-FAIL][7] ([i915#4494] / [i915#4957])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-4:         [PASS][8] -> [DMESG-WARN][9] ([i915#3576]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-4/igt@kms_busy@basic@modeset.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adlp-4/igt@kms_busy@basic@modeset.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-blb-e6850:       NOTRUN -> [SKIP][10] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-blb-e6850/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [PASS][11] -> [DMESG-WARN][12] ([i915#402]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@runner@aborted:
    - fi-hsw-g3258:       NOTRUN -> [FAIL][13] ([fdo#109271] / [i915#4312])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][14] ([i915#5122]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@hugepages:
    - {bat-adln-1}:       [DMESG-WARN][16] -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adln-1/igt@i915_selftest@live@hugepages.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adln-1/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][18] ([i915#4528]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-blb-e6850/igt@i915_selftest@live@requests.html
    - bat-adlp-4:         [DMESG-FAIL][20] -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-4/igt@i915_selftest@live@requests.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adlp-4/igt@i915_selftest@live@requests.html
    - fi-pnv-d510:        [DMESG-FAIL][22] ([i915#4528]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][24] ([i915#3576]) -> [PASS][25] +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
    - bat-adlp-4:         [DMESG-WARN][26] ([i915#3576]) -> [PASS][27] +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - fi-tgl-u2:          [DMESG-WARN][28] ([i915#402]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-tgl-u2/igt@kms_flip@basic-plain-flip@a-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-tgl-u2/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6492 -> IGTPW_7173

  CI-20190529: 20190529
  CI_DRM_11700: f5895776c32b7fc5c196fafef3f5dab7e5ad19c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7173: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/index.html
  IGT_6492: ef18e59c374472e961a3a145724e7381eb4800aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/index.html

--===============3097540693243939866==
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
<tr><td><b>Series:</b></td><td>test/kms_plane_alpha_blend: clearer validation for coverage-7efc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104366/">https://patchwork.freedesktop.org/series/104366/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11700 -&gt; IGTPW_7173</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7173 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7173, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Additional (1): bat-adls-5 <br />
  Missing    (2): fi-hsw-4770 bat-dg2-9 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7173:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@client:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-bdw-5557u/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-bdw-5557u/igt@i915_selftest@live@client.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7173 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-4/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adlp-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-blb-e6850/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adln-1/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adln-1/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-4/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adlp-4/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-tgl-u2/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/fi-tgl-u2/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6492 -&gt; IGTPW_7173</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11700: f5895776c32b7fc5c196fafef3f5dab7e5ad19c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7173: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7173/index.html<br />
  IGT_6492: ef18e59c374472e961a3a145724e7381eb4800aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3097540693243939866==--
