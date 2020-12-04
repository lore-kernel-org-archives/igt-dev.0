Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 04 Dec 2020 20:54:05 -0000
Message-ID: <160711524557.27539.6055212499884853390@emeril.freedesktop.org>
References: <20201204195007.10215-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20201204195007.10215-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Don=27t_kill_a_test_on_taint_if_watching_timeouts_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1078531044=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1078531044==
Content-Type: multipart/alternative;
 boundary="===============7077600648617068070=="

--===============7077600648617068070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Don't kill a test on taint if watching timeouts (rev2)
URL   : https://patchwork.freedesktop.org/series/84577/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9444 -> IGTPW_5250
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html

Known issues
------------

  Here are the changes found in IGTPW_5250 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][1] -> [FAIL][2] ([i915#1888])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [PASS][3] -> [INCOMPLETE][4] ([i915#1037] / [i915#2276])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-icl-y/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-icl-y/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-8109u:       [PASS][5] -> [DMESG-FAIL][6] ([i915#2291] / [i915#541])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-tgl-y/igt@prime_vgem@basic-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-tgl-y/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [INCOMPLETE][9] ([i915#2405]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][11] ([i915#402]) -> [PASS][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2276]: https://gitlab.freedesktop.org/drm/intel/issues/2276
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5881 -> IGTPW_5250

  CI-20190529: 20190529
  CI_DRM_9444: cee8f6ace633b555c64b14938577e6da02710a0b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5250: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html
  IGT_5881: 10d4e2e9177eb747b9f2ab9122e3ab60e91654fb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html

--===============7077600648617068070==
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
<tr><td><b>Series:</b></td><td>runner: Don&#39;t kill a test on taint if watching timeouts (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84577/">https://patchwork.freedesktop.org/series/84577/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9444 -&gt; IGTPW_5250</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5250 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-icl-y/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-icl-y/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2276">i915#2276</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-tgl-y/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-tgl-y/igt@prime_vgem@basic-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5881 -&gt; IGTPW_5250</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9444: cee8f6ace633b555c64b14938577e6da02710a0b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5250: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html<br />
  IGT_5881: 10d4e2e9177eb747b9f2ab9122e3ab60e91654fb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7077600648617068070==--

--===============1078531044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1078531044==--
