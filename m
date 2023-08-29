Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8687522767280506827=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 29 Aug 2023 06:04:55 -0000
Message-ID: <169328909581.16746.9004572239597186221@emeril.freedesktop.org>
References: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHRp?=
 =?utf-8?q?ling_support_for_display_tests_=28rev3=29?=
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

--===============8687522767280506827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tiling support for display tests (rev3)
URL   : https://patchwork.freedesktop.org/series/122822/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13572 -> IGTPW_9675
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/index.html

Participating hosts (39 -> 27)
------------------------------

  Missing    (12): fi-kbl-soraka bat-adlp-11 fi-skl-guc bat-adlm-1 fi-snb-2520m bat-adlp-6 fi-ilk-650 fi-hsw-4770 bat-adln-1 fi-kbl-8809g bat-dg2-13 bat-rpls-2 

Known issues
------------

  Here are the changes found in IGTPW_9675 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-jsl-3:          [PASS][1] -> [ABORT][2] ([i915#5122])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
    - bat-dg2-9:          [PASS][3] -> [INCOMPLETE][4] ([i915#6311])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-jsl-3:          [PASS][5] -> [FAIL][6] ([fdo#103375])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html

  
#### Warnings ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][7] ([i915#7982]) -> [ABORT][8] ([i915#7982] / [i915#8865])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         [SKIP][9] ([i915#1072]) -> [ABORT][10] ([i915#8442] / [i915#8469] / [i915#8668])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7454 -> IGTPW_9675

  CI-20190529: 20190529
  CI_DRM_13572: f2dfaec0582a995d5e74e5b1896dd6772f5ca9e6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9675: 9675
  IGT_7454: 7454

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/index.html

--===============8687522767280506827==
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
<tr><td><b>Series:</b></td><td>Add tiling support for display tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122822/">https://patchwork.freedesktop.org/series/122822/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13572 -&gt; IGTPW_9675</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/index.html</p>
<h2>Participating hosts (39 -&gt; 27)</h2>
<p>Missing    (12): fi-kbl-soraka bat-adlp-11 fi-skl-guc bat-adlm-1 fi-snb-2520m bat-adlp-6 fi-ilk-650 fi-hsw-4770 bat-adln-1 fi-kbl-8809g bat-dg2-13 bat-rpls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9675 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>)</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6311">i915#6311</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8865">i915#8865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13572/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9675/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7454 -&gt; IGTPW_9675</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13572: f2dfaec0582a995d5e74e5b1896dd6772f5ca9e6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9675: 9675<br />
  IGT_7454: 7454</p>

</body>
</html>

--===============8687522767280506827==--
