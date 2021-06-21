Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 21 Jun 2021 12:10:39 -0000
Message-ID: <162427743907.19771.5504703415552080007@emeril.freedesktop.org>
References: <20210621105922.48408-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210621105922.48408-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVHdvIGZp?=
 =?utf-8?q?xes_for_spinner?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0794046418=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0794046418==
Content-Type: multipart/alternative;
 boundary="===============0107181835093098660=="

--===============0107181835093098660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Two fixes for spinner
URL   : https://patchwork.freedesktop.org/series/91721/
State : success

== Summary ==

CI Bug Log - changes from IGT_6115 -> IGTPW_5946
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/index.html

Known issues
------------

  Here are the changes found in IGTPW_5946 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-kbl-soraka:      [DMESG-WARN][2] ([i915#1982]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6115/fi-kbl-soraka/igt@i915_module_load@reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/fi-kbl-soraka/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cml-u2:          [DMESG-FAIL][4] ([i915#2291] / [i915#541]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6115/fi-cml-u2/igt@i915_selftest@live@gt_heartbeat.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/fi-cml-u2/igt@i915_selftest@live@gt_heartbeat.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6115 -> IGTPW_5946

  CI-20190529: 20190529
  CI_DRM_10252: b6c631d4b0b55b47b95763da2df57e40ba55f283 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5946: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/index.html
  IGT_6115: 4ef420186b82f1a6d9c9b69d2f8de4fd100a2af3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/index.html

--===============0107181835093098660==
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
<tr><td><b>Series:</b></td><td>Two fixes for spinner</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91721/">https://patchwork.freedesktop.org/series/91721/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6115 -&gt; IGTPW_5946</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5946 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@amdgpu/amd_basic@cs-gfx:<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6115/fi-kbl-soraka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/fi-kbl-soraka/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6115/fi-cml-u2/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/fi-cml-u2/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6115 -&gt; IGTPW_5946</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10252: b6c631d4b0b55b47b95763da2df57e40ba55f283 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5946: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5946/index.html<br />
  IGT_6115: 4ef420186b82f1a6d9c9b69d2f8de4fd100a2af3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0107181835093098660==--

--===============0794046418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0794046418==--
