Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jul 2020 01:08:16 -0000
Message-ID: <159607129692.11112.8352158567311084504@emeril.freedesktop.org>
References: <20200730004603.8171-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200730004603.8171-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_i915/perf=3A_add_tests_for_triggered_O?=
 =?utf-8?q?A_reports?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0710567490=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0710567490==
Content-Type: multipart/alternative;
 boundary="===============4525780789505843951=="

--===============4525780789505843951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] i915/perf: add tests for triggered OA reports
URL   : https://patchwork.freedesktop.org/series/80059/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5751 -> IGTPW_4822
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4822 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4822, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4822:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_gttfill@basic:
    - fi-tgl-u2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-tgl-u2/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-tgl-u2/igt@gem_exec_gttfill@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4822 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-n3050:       [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-byt-j1900:       [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-kefka:       [DMESG-WARN][9] ([i915#1982]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [FAIL][11] ([i915#262]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - fi-icl-u2:          [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - {fi-tgl-dsi}:       [DMESG-WARN][15] ([i915#1982]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-tgl-dsi/igt@kms_force_connector_basic@force-connector-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-tgl-dsi/igt@kms_force_connector_basic@force-connector-state.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][18] ([i915#62] / [i915#92]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92]) -> [DMESG-WARN][20] ([i915#62] / [i915#92] / [i915#95]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2175]: https://gitlab.freedesktop.org/drm/intel/issues/2175
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (43 -> 36)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5751 -> IGTPW_4822

  CI-20190529: 20190529
  CI_DRM_8814: c3d46022808ab0325db29918a829ac7fa02a4314 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4822: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/index.html
  IGT_5751: d47bb767757b2e64ced4a5bb95de6397e8dc709c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf@closed-fd-and-unmapped-access
+igt@perf@invalid-map-oa-buffer
+igt@perf@map-oa-buffer
+igt@perf@non-privileged-access-vaddr
+igt@perf@non-privileged-map-oa-buffer
+igt@perf@oa-regs-not-whitelisted
+igt@perf@oa-regs-whitelisted
+igt@perf@triggered-oa-reports-paranoid-0
+igt@perf@triggered-oa-reports-paranoid-1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/index.html

--===============4525780789505843951==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] i915/perf: add tests for triggered OA reports</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80059/">https://patchwork.freedesktop.org/series/80059/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5751 -&gt; IGTPW_4822</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4822 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4822, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4822:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-tgl-u2/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-tgl-u2/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4822 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-tgl-dsi/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-tgl-dsi/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp1:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5751/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 36)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5751 -&gt; IGTPW_4822</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8814: c3d46022808ab0325db29918a829ac7fa02a4314 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4822: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4822/index.html<br />
  IGT_5751: d47bb767757b2e64ced4a5bb95de6397e8dc709c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@perf@closed-fd-and-unmapped-access<br />
+igt@perf@invalid-map-oa-buffer<br />
+igt@perf@map-oa-buffer<br />
+igt@perf@non-privileged-access-vaddr<br />
+igt@perf@non-privileged-map-oa-buffer<br />
+igt@perf@oa-regs-not-whitelisted<br />
+igt@perf@oa-regs-whitelisted<br />
+igt@perf@triggered-oa-reports-paranoid-0<br />
+igt@perf@triggered-oa-reports-paranoid-1</p>

</body>
</html>

--===============4525780789505843951==--

--===============0710567490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0710567490==--
