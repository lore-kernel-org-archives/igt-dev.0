Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8466690640153632084=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Nov 2023 12:45:28 -0000
Message-ID: <169892912811.28157.14306759794920682312@emeril.freedesktop.org>
References: <20231102114256.297063-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20231102114256.297063-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaW50ZWwv?=
 =?utf-8?q?intel=5Fhwmon=2Ec=3A_Fix_test_documentation_=28rev2=29?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8466690640153632084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel/intel_hwmon.c: Fix test documentation (rev2)
URL   : https://patchwork.freedesktop.org/series/125891/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13829 -> IGTPW_10102
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): bat-dg2-8 fi-snb-2520m fi-hsw-4770 

Known issues
------------

  Here are the changes found in IGTPW_10102 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hugepages:
    - bat-mtlp-8:         [PASS][1] -> [DMESG-WARN][2] ([i915#8962])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13829/bat-mtlp-8/igt@i915_selftest@live@hugepages.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/bat-mtlp-8/igt@i915_selftest@live@hugepages.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][3] ([i915#1845] / [i915#9197])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7568 -> IGTPW_10102

  CI-20190529: 20190529
  CI_DRM_13829: ac4ea9d671758af5b1d06a2a22d163d6d44531ca @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10102: 10102
  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_exec_store@cachelines
-igt@xe_exec_store@page-sized

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/index.html

--===============8466690640153632084==
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
<tr><td><b>Series:</b></td><td>intel/intel_hwmon.c: Fix test documentation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125891/">https://patchwork.freedesktop.org/series/125891/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13829 -&gt; IGTPW_10102</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): bat-dg2-8 fi-snb-2520m fi-hsw-4770 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10102 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13829/bat-mtlp-8/igt@i915_selftest@live@hugepages.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/bat-mtlp-8/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8962">i915#8962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10102/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7568 -&gt; IGTPW_10102</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13829: ac4ea9d671758af5b1d06a2a22d163d6d44531ca @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10102: 10102<br />
  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_exec_store@cachelines<br />
-igt@xe_exec_store@page-sized</p>

</body>
</html>

--===============8466690640153632084==--

