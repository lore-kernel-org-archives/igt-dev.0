Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3849620246138970149=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Dec 2021 20:50:43 -0000
Message-ID: <164037904373.22423.9957377882742077938@emeril.freedesktop.org>
References: <20211224200310.10340-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20211224200310.10340-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=3A_Add_support_for_local_memory_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3849620246138970149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_sync: Add support for local memory (rev2)
URL   : https://patchwork.freedesktop.org/series/95437/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11037 -> IGTPW_6517
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/index.html

Participating hosts (46 -> 34)
------------------------------

  Missing    (12): fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-adlp-4 fi-pnv-d510 bat-rpls-1 bat-jsl-2 fi-bdw-samus 

New tests
---------

  New tests have been introduced between CI_DRM_11037 and IGTPW_6517:

### New IGT tests (2) ###

  * igt@gem_sync@basic-all@smem:
    - Statuses : 33 pass(s)
    - Exec time: [2.03, 4.50] s

  * igt@gem_sync@basic-each@smem:
    - Statuses : 33 pass(s)
    - Exec time: [2.05, 3.87] s

  

Known issues
------------

  Here are the changes found in IGTPW_6517 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - fi-snb-2520m:       [PASS][1] -> [DMESG-FAIL][2] ([i915#4610])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11037/fi-snb-2520m/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/fi-snb-2520m/igt@i915_selftest@live@workarounds.html

  * igt@runner@aborted:
    - fi-snb-2520m:       NOTRUN -> [FAIL][3] ([i915#2426] / [i915#4312])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/fi-snb-2520m/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][4] ([i915#4269]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11037/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4610]: https://gitlab.freedesktop.org/drm/intel/issues/4610


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6319 -> IGTPW_6517

  CI-20190529: 20190529
  CI_DRM_11037: c2c428a5d3232109b94de46042b7980bd50fb436 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6517: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/index.html
  IGT_6319: 15df505835e60dbdb9ddcbd800a4fab3120328f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/index.html

--===============3849620246138970149==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_sync: Add support for local memory (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95437/">https://patchwork.freedesktop.org/series/95437/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11037 -&gt; IGTPW_6517</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/index.html</p>
<h2>Participating hosts (46 -&gt; 34)</h2>
<p>Missing    (12): fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-adlp-4 fi-pnv-d510 bat-rpls-1 bat-jsl-2 fi-bdw-samus </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11037 and IGTPW_6517:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_sync@basic-all@smem:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [2.03, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each@smem:</p>
<ul>
<li>Statuses : 33 pass(s)</li>
<li>Exec time: [2.05, 3.87] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6517 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11037/fi-snb-2520m/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/fi-snb-2520m/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4610">i915#4610</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/fi-snb-2520m/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11037/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6319 -&gt; IGTPW_6517</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11037: c2c428a5d3232109b94de46042b7980bd50fb436 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6517: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6517/index.html<br />
  IGT_6319: 15df505835e60dbdb9ddcbd800a4fab3120328f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3849620246138970149==--
