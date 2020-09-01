Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 01 Sep 2020 18:14:23 -0000
Message-ID: <159898406394.31089.8902895460714462327@emeril.freedesktop.org>
References: <20200901173414.15012-1-jose.souza@intel.com>
In-Reply-To: <20200901173414.15012-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?psr=3A_Check_for_DRRS_enabled_in_no=5Fdrrs_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0458495709=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0458495709==
Content-Type: multipart/alternative;
 boundary="===============3068164247589052466=="

--===============3068164247589052466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/psr: Check for DRRS enabled in no_drrs test
URL   : https://patchwork.freedesktop.org/series/81234/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5776 -> IGTPW_4936
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4936 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4936, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4936:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_store@basic:
    - fi-skl-6600u:       [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-skl-6600u/igt@gem_exec_store@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-skl-6600u/igt@gem_exec_store@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4936 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@contexts:
    - fi-skl-guc:         [PASS][3] -> [INCOMPLETE][4] ([i915#2398])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-skl-guc/igt@gem_exec_parallel@engines@contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-skl-guc/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_exec_parallel@engines@fds:
    - fi-cml-s:           [PASS][5] -> [INCOMPLETE][6] ([i915#2398])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-cml-s/igt@gem_exec_parallel@engines@fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-cml-s/igt@gem_exec_parallel@engines@fds.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-byt-j1900:       [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bsw-kefka:       [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-cml-s:           [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-cml-s/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-cml-s/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [TIMEOUT][13] ([i915#1418] / [i915#1635]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-apl-guc/igt@i915_module_load@reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-n3050:       [DMESG-WARN][15] ([i915#1982]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-apl-guc:         [SKIP][17] ([fdo#109271] / [i915#1635]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-apl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-icl-u2:          [DMESG-WARN][19] ([i915#1982]) -> [PASS][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1418]: https://gitlab.freedesktop.org/drm/intel/issues/1418
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398


Participating hosts (38 -> 33)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5776 -> IGTPW_4936

  CI-20190529: 20190529
  CI_DRM_8951: 5f8c53e35ef01a1d5e97db6005d3c308d3734bac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4936: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/index.html
  IGT_5776: 46e4315096bcaa2465c82c547274627365b1a69e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/index.html

--===============3068164247589052466==
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
<tr><td><b>Series:</b></td><td>tests/psr: Check for DRRS enabled in no_drrs test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81234/">https://patchwork.freedesktop.org/series/81234/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5776 -&gt; IGTPW_4936</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4936 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4936, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4936:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_store@basic:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-skl-6600u/igt@gem_exec_store@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-skl-6600u/igt@gem_exec_store@basic.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4936 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-skl-guc/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-skl-guc/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-cml-s/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-cml-s/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-cml-s/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-cml-s/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-apl-guc/igt@i915_module_load@reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1418">i915#1418</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-bsw-n3050/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5776/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (38 -&gt; 33)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5776 -&gt; IGTPW_4936</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8951: 5f8c53e35ef01a1d5e97db6005d3c308d3734bac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4936: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4936/index.html<br />
  IGT_5776: 46e4315096bcaa2465c82c547274627365b1a69e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3068164247589052466==--

--===============0458495709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0458495709==--
