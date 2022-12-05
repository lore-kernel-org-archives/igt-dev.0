Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2607640706100302803=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Mon, 05 Dec 2022 19:06:02 -0000
Message-ID: <167026716284.24403.7061046643413857291@emeril.freedesktop.org>
References: <20221205170114.946594-1-vikas.srivastava@intel.com>
In-Reply-To: <20221205170114.946594-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fblits=3A_Added_XY=5FFAST=5FCOPY=5FBLT_support_for_ge?=
 =?utf-8?q?m=5Fblits?=
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

--===============2607640706100302803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_blits: Added XY_FAST_COPY_BLT support for gem_blits
URL   : https://patchwork.freedesktop.org/series/111635/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12468 -> IGTPW_8194
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8194 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8194, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/index.html

Participating hosts (44 -> 44)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (1): bat-adlp-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8194:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_8194 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][3] -> [INCOMPLETE][4] ([i915#4785])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - fi-rkl-guc:         [PASS][5] -> [INCOMPLETE][6] ([i915#4983])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-ivb-3770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][8] ([fdo#109271] / [i915#4312] / [i915#5594])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][9] ([i915#7229]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_pm_rpm@module-reload:
    - {bat-rpls-2}:       [WARN][11] ([i915#7346]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/bat-rpls-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - fi-ivb-3770:        [INCOMPLETE][13] ([i915#3303] / [i915#7122]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3:
    - {bat-dg2-9}:        [FAIL][15] ([fdo#103375]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6949]: https://gitlab.freedesktop.org/drm/intel/issues/6949
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7058]: https://gitlab.freedesktop.org/drm/intel/issues/7058
  [i915#7122]: https://gitlab.freedesktop.org/drm/intel/issues/7122
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7083 -> IGTPW_8194

  CI-20190529: 20190529
  CI_DRM_12468: af29385be15ff0c030e00e8d9e48cebab385d7a0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8194: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/index.html
  IGT_7083: c001793d5f22deb01918b6ba52af829794582df1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/index.html

--===============2607640706100302803==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_blits: Added XY_FAST_COPY_BLT support for gem_blits</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111635/">https://patchwork.freedesktop.org/series/111635/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12468 -&gt; IGTPW_8194</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8194 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8194, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/index.html</p>
<h2>Participating hosts (44 -&gt; 44)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (1): bat-adlp-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8194:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8194 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7346">i915#7346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7122">i915#7122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12468/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7083 -&gt; IGTPW_8194</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12468: af29385be15ff0c030e00e8d9e48cebab385d7a0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8194: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8194/index.html<br />
  IGT_7083: c001793d5f22deb01918b6ba52af829794582df1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2607640706100302803==--
