Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4930151220563375847=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 20 Jul 2022 15:33:22 -0000
Message-ID: <165833120282.27272.14857153495219152292@emeril.freedesktop.org>
References: <20220719115141.35236-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220719115141.35236-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHBp?=
 =?utf-8?q?nned_to_perf=5Fpmu_and_remove_store_dword_=28rev3=29?=
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

--===============4930151220563375847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add pinned to perf_pmu and remove store dword (rev3)
URL   : https://patchwork.freedesktop.org/series/106467/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11922 -> IGTPW_7541
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html

Participating hosts (37 -> 35)
------------------------------

  Additional (1): bat-jsl-3 
  Missing    (3): fi-rkl-11600 fi-icl-u2 bat-adlp-4 

Known issues
------------

  Here are the changes found in IGTPW_7541 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-skl-6600u:       [PASS][1] -> [DMESG-WARN][2] ([i915#5122])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/fi-skl-6600u/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-skl-6600u/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@gem:
    - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][3] ([i915#4528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-blb-e6850/igt@i915_selftest@live@gem.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@runner@aborted:
    - fi-skl-6600u:       NOTRUN -> [FAIL][5] ([i915#4312] / [i915#5257])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-skl-6600u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hugepages:
    - {bat-rpls-1}:       [DMESG-WARN][6] ([i915#5278]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/bat-rpls-1/igt@i915_selftest@live@hugepages.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/bat-rpls-1/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][8] ([i915#4528]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-blb-e6850/igt@i915_selftest@live@requests.html
    - {bat-rpls-1}:       [DMESG-FAIL][10] ([i915#5087] / [i915#6257]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/bat-rpls-1/igt@i915_selftest@live@requests.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/bat-rpls-1/igt@i915_selftest@live@requests.html
    - fi-pnv-d510:        [DMESG-FAIL][12] ([i915#4528]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-pnv-d510/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5087]: https://gitlab.freedesktop.org/drm/intel/issues/5087
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5950]: https://gitlab.freedesktop.org/drm/intel/issues/5950
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6297]: https://gitlab.freedesktop.org/drm/intel/issues/6297


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6592 -> IGTPW_7541

  CI-20190529: 20190529
  CI_DRM_11922: 778142c0a2a41283658704530b41ac65c4844ad3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7541: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html
  IGT_6592: d7c0659613199a5dcf535ed3add68ed1991ead7e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html

--===============4930151220563375847==
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
<tr><td><b>Series:</b></td><td>Add pinned to perf_pmu and remove store dword (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106467/">https://patchwork.freedesktop.org/series/106467/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11922 -&gt; IGTPW_7541</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Additional (1): bat-jsl-3 <br />
  Missing    (3): fi-rkl-11600 fi-icl-u2 bat-adlp-4 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7541 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/fi-skl-6600u/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-skl-6600u/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-blb-e6850/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/bat-rpls-1/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5278">i915#5278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/bat-rpls-1/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/bat-rpls-1/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5087">i915#5087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6257">i915#6257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11922/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6592 -&gt; IGTPW_7541</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11922: 778142c0a2a41283658704530b41ac65c4844ad3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7541: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html<br />
  IGT_6592: d7c0659613199a5dcf535ed3add68ed1991ead7e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4930151220563375847==--
