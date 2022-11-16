Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2310208518865565596=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Wed, 16 Nov 2022 12:47:46 -0000
Message-ID: <166860286657.29191.8823847873662591971@emeril.freedesktop.org>
References: <20221116082335.1194410-1-anshuman.gupta@intel.com>
In-Reply-To: <20221116082335.1194410-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ29sZCBS?=
 =?utf-8?q?eset_IGT_Test_=28rev2=29?=
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

--===============2310208518865565596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cold Reset IGT Test (rev2)
URL   : https://patchwork.freedesktop.org/series/110600/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12386 -> IGTPW_8114
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/index.html

Participating hosts (38 -> 40)
------------------------------

  Additional (2): bat-kbl-2 bat-jsl-3 

Known issues
------------

  Here are the changes found in IGTPW_8114 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [PASS][1] -> [INCOMPLETE][2] ([i915#4418])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][3] -> [INCOMPLETE][4] ([i915#4785])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - bat-adlp-4:         NOTRUN -> [SKIP][5] ([fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-kbl-7567u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][7] -> [FAIL][8] ([i915#6298])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adlp-4:         NOTRUN -> [SKIP][9] ([i915#3546])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][10] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-kbl-7567u/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][11] ([fdo#109271] / [i915#4312] / [i915#5594])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-hsw-4770/igt@runner@aborted.html
    - bat-dg1-6:          NOTRUN -> [FAIL][12] ([i915#4312])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-dg1-6/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][13] ([i915#2867]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@dmabuf:
    - fi-bxt-dsi:         [DMESG-FAIL][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-bxt-dsi/igt@i915_selftest@live@dmabuf.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-bxt-dsi/igt@i915_selftest@live@dmabuf.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [INCOMPLETE][17] ([i915#7308] / [i915#7348]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlp-4/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - {bat-adlp-6}:       [INCOMPLETE][19] ([i915#6257]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-adlp-6/igt@i915_selftest@live@requests.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - {bat-adlm-1}:       [INCOMPLETE][21] ([i915#4983]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-adlm-1/igt@i915_selftest@live@workarounds.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlm-1/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-kbl-7567u:       [INCOMPLETE][23] ([i915#4817]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [SKIP][25] ([fdo#109271]) -> [FAIL][26] ([i915#7229])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [FAIL][27] ([fdo#103375]) -> [INCOMPLETE][28] ([i915#4817])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7308]: https://gitlab.freedesktop.org/drm/intel/issues/7308
  [i915#7328]: https://gitlab.freedesktop.org/drm/intel/issues/7328
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7061 -> IGTPW_8114

  CI-20190529: 20190529
  CI_DRM_12386: 8686f82d0ad206d538fbf928760e914f108257c1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8114: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/index.html
  IGT_7061: d16e679b99d43643c3a0bcc34ec4c4f001dbbbb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@device_reset@cold-reset-bound
+igt@device_reset@unbind-cold-reset-rebind

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/index.html

--===============2310208518865565596==
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
<tr><td><b>Series:</b></td><td>Cold Reset IGT Test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110600/">https://patchwork.freedesktop.org/series/110600/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12386 -&gt; IGTPW_8114</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/index.html</p>
<h2>Participating hosts (38 -&gt; 40)</h2>
<p>Additional (2): bat-kbl-2 bat-jsl-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8114 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-kbl-7567u/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-kbl-7567u/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-dg1-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-bxt-dsi/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-bxt-dsi/igt@i915_selftest@live@dmabuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7308">i915#7308</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-adlp-6/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6257">i915#6257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlp-6/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/bat-adlm-1/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/bat-adlm-1/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12386/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7061 -&gt; IGTPW_8114</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12386: 8686f82d0ad206d538fbf928760e914f108257c1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8114: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8114/index.html<br />
  IGT_7061: d16e679b99d43643c3a0bcc34ec4c4f001dbbbb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@device_reset@cold-reset-bound<br />
+igt@device_reset@unbind-cold-reset-rebind</p>

</body>
</html>

--===============2310208518865565596==--
