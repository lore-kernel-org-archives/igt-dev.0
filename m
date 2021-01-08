Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 08 Jan 2021 15:47:19 -0000
Message-ID: <161012083975.334.11683125747541512886@emeril.freedesktop.org>
References: <20210108135845.4096422-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210108135845.4096422-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fscheduler=3A_Check_dependency_chains_around_engines?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0270561426=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0270561426==
Content-Type: multipart/alternative;
 boundary="===============6019686359534874287=="

--===============6019686359534874287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_scheduler: Check dependency chains around engines
URL   : https://patchwork.freedesktop.org/series/85616/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9566 -> IGTPW_5371
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html

Known issues
------------

  Here are the changes found in IGTPW_5371 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [PASS][3] -> [INCOMPLETE][4] ([i915#1037] / [i915#1729] / [i915#794])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][5] ([i915#1436] / [i915#2722])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/fi-kbl-soraka/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#402]) -> [PASS][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1729]: https://gitlab.freedesktop.org/drm/intel/issues/1729
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794


Participating hosts (43 -> 37)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5951 -> IGTPW_5371

  CI-20190529: 20190529
  CI_DRM_9566: 43ca049026a4c8808645c7f21cb0fc34a337c612 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5371: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html
  IGT_5951: fec3b9c7d88357144f0d7a1447b9316a1c81da1a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_schedule@noreorder
+igt@gem_exec_schedule@noreorder-priority

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html

--===============6019686359534874287==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_scheduler: Check dependency chains around engines</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85616/">https://patchwork.freedesktop.org/series/85616/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9566 -&gt; IGTPW_5371</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5371 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1729">i915#1729</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_flink_basic@bad-flink:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 37)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5951 -&gt; IGTPW_5371</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9566: 43ca049026a4c8808645c7f21cb0fc34a337c612 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5371: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html<br />
  IGT_5951: fec3b9c7d88357144f0d7a1447b9316a1c81da1a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_schedule@noreorder<br />
+igt@gem_exec_schedule@noreorder-priority</p>

</body>
</html>

--===============6019686359534874287==--

--===============0270561426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0270561426==--
