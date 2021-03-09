Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 09 Mar 2021 09:27:51 -0000
Message-ID: <161528207117.8978.8478549397100995387@emeril.freedesktop.org>
References: <20210308120009.1323272-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210308120009.1323272-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3Aadded_test_description_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1220331823=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1220331823==
Content-Type: multipart/alternative;
 boundary="===============7766661444777247780=="

--===============7766661444777247780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling:added test description (rev7)
URL   : https://patchwork.freedesktop.org/series/85188/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9842 -> IGTPW_5582
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/index.html

Known issues
------------

  Here are the changes found in IGTPW_5582 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][1] ([i915#1602] / [i915#2029] / [i915#2369])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [TIMEOUT][2] ([i915#3145]) -> [PASS][3] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9842/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  * igt@gem_linear_blits@basic:
    - fi-kbl-8809g:       [TIMEOUT][4] ([i915#2502] / [i915#3145]) -> [PASS][5] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9842/fi-kbl-8809g/igt@gem_linear_blits@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/fi-kbl-8809g/igt@gem_linear_blits@basic.html

  
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145


Participating hosts (46 -> 40)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6026 -> IGTPW_5582

  CI-20190529: 20190529
  CI_DRM_9842: 1c2e0e8e88b495547c87064738ef1d13f8bef6ff @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5582: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/index.html
  IGT_6026: 8b8bbecf2f32298544c2f193753a0153f39e7326 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/index.html

--===============7766661444777247780==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling:added test description (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85188/">https://patchwork.freedesktop.org/series/85188/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9842 -&gt; IGTPW_5582</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5582 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9842/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9842/fi-kbl-8809g/igt@gem_linear_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/fi-kbl-8809g/igt@gem_linear_blits@basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (46 -&gt; 40)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6026 -&gt; IGTPW_5582</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9842: 1c2e0e8e88b495547c87064738ef1d13f8bef6ff @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5582: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5582/index.html<br />
  IGT_6026: 8b8bbecf2f32298544c2f193753a0153f39e7326 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7766661444777247780==--

--===============1220331823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1220331823==--
