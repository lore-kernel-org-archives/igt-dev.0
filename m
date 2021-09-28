Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7824541424060555797=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Sep 2021 19:34:36 -0000
Message-ID: <163285767671.3950.8587153858342499000@emeril.freedesktop.org>
References: <20210928184705.45927-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210928184705.45927-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUmV0dXJu?=
 =?utf-8?q?_allocated_size_in_gem=5Fcreate=5Fin=5Fmemory=5Fregions=28=29_a?=
 =?utf-8?q?nd_friends_=28rev2=29?=
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7824541424060555797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Return allocated size in gem_create_in_memory_regions() and friends (rev2)
URL   : https://patchwork.freedesktop.org/series/95137/
State : success

== Summary ==

CI Bug Log - changes from IGT_6227 -> IGTPW_6268
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/index.html

Known issues
------------

  Here are the changes found in IGTPW_6268 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-bsw-kefka:       [PASS][1] -> [INCOMPLETE][2] ([i915#2539])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6227/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [FAIL][3] ([i915#1888]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6227/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-bsw-n3050:       [DMESG-FAIL][5] ([i915#2373]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6227/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html

  
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2539]: https://gitlab.freedesktop.org/drm/intel/issues/2539


Participating hosts (41 -> 37)
------------------------------

  Missing    (4): fi-ctg-p8600 fi-ilk-m540 fi-bsw-cyan fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6227 -> IGTPW_6268

  CI-20190529: 20190529
  CI_DRM_10655: 88d6ecae86a7bb32e8bf2bd233f7f9f9c8bd7abc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6268: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/index.html
  IGT_6227: 6ac2da7fd6b13f04f9aa0ec10f86b831d2756946 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/index.html

--===============7824541424060555797==
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
<tr><td><b>Series:</b></td><td>Return allocated size in gem_create_in_memory_regions() and friends (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95137/">https://patchwork.freedesktop.org/series/95137/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6227 -&gt; IGTPW_6268</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6268 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6227/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/fi-bsw-kefka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2539">i915#2539</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6227/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6227/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): fi-ctg-p8600 fi-ilk-m540 fi-bsw-cyan fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6227 -&gt; IGTPW_6268</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10655: 88d6ecae86a7bb32e8bf2bd233f7f9f9c8bd7abc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6268: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6268/index.html<br />
  IGT_6227: 6ac2da7fd6b13f04f9aa0ec10f86b831d2756946 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7824541424060555797==--
