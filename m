Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0939577532722680425=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Date: Thu, 18 Aug 2022 05:11:16 -0000
Message-ID: <166079947619.16677.17111567297457078462@emeril.freedesktop.org>
References: <20220818041528.751930-1-khaled.almahallawy@intel.com>
In-Reply-To: <20220818041528.751930-1-khaled.almahallawy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZG9jcy9j?=
 =?utf-8?q?hamelium=3A_Document_debugging_network_issues?=
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

--===============0939577532722680425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: docs/chamelium: Document debugging network issues
URL   : https://patchwork.freedesktop.org/series/107431/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11996 -> IGTPW_7656
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/index.html

Participating hosts (31 -> 32)
------------------------------

  Additional (1): bat-adls-5 

Known issues
------------

  Here are the changes found in IGTPW_7656 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][1] -> [DMESG-FAIL][2] ([i915#4528])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][3] ([i915#4817])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][4] ([fdo#109271]) +19 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][5] ([fdo#109271] / [i915#2403] / [i915#4312])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-bdw-gvtdvm:      [DMESG-WARN][6] ([i915#6540]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-bdw-gvtdvm/igt@i915_module_load@load.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-bdw-gvtdvm:      [DMESG-WARN][8] ([i915#5922]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-cfl-8109u:       [FAIL][10] ([i915#4312]) -> [FAIL][11] ([i915#4312] / [i915#6599])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-cfl-8109u/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-cfl-8109u/igt@runner@aborted.html
    - fi-adl-ddr5:        [FAIL][12] ([i915#4312]) -> [FAIL][13] ([i915#4312] / [i915#6599])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-adl-ddr5/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-adl-ddr5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#5922]: https://gitlab.freedesktop.org/drm/intel/issues/5922
  [i915#6540]: https://gitlab.freedesktop.org/drm/intel/issues/6540
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6630 -> IGTPW_7656

  CI-20190529: 20190529
  CI_DRM_11996: 79088b3740cb8192a131fae2c0d335b456557088 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7656: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/index.html
  IGT_6630: b5e2222c9a988015bdf237e6ebb9f5b6d87ac7e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/index.html

--===============0939577532722680425==
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
<tr><td><b>Series:</b></td><td>docs/chamelium: Document debugging network issues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107431/">https://patchwork.freedesktop.org/series/107431/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11996 -&gt; IGTPW_7656</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/index.html</p>
<h2>Participating hosts (31 -&gt; 32)</h2>
<p>Additional (1): bat-adls-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7656 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6540">i915#6540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-bdw-gvtdvm/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5922">i915#5922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-adl-ddr5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/fi-adl-ddr5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6630 -&gt; IGTPW_7656</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11996: 79088b3740cb8192a131fae2c0d335b456557088 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7656: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7656/index.html<br />
  IGT_6630: b5e2222c9a988015bdf237e6ebb9f5b6d87ac7e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0939577532722680425==--
