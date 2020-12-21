Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 21 Dec 2020 14:13:25 -0000
Message-ID: <160856000585.418.14158898260971688061@emeril.freedesktop.org>
References: <160855440202.420.10229954069606095978@emeril.freedesktop.org>
In-Reply-To: <160855440202.420.10229954069606095978@emeril.freedesktop.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Ffair=3A_Try_to_spot_unfairness_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1166871437=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1166871437==
Content-Type: multipart/alternative;
 boundary="===============8404565175412594942=="

--===============8404565175412594942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_fair: Try to spot unfairness (rev2)
URL   : https://patchwork.freedesktop.org/series/85139/
State : success

== Summary ==

CI Bug Log - changes from IGT_5914 -> IGTPW_5319
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/index.html

Known issues
------------

  Here are the changes found in IGTPW_5319 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-snb-2600:        [PASS][1] -> [DMESG-WARN][2] ([i915#2772])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7500u:       [PASS][3] -> [DMESG-WARN][4] ([i915#2605])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [PASS][5] -> [DMESG-FAIL][6] ([i915#165])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([i915#402])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  * igt@runner@aborted:
    - fi-snb-2600:        NOTRUN -> [FAIL][9] ([i915#698])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-snb-2600/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][10] ([i915#402]) -> [PASS][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [FAIL][12] ([i915#1888]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [DMESG-WARN][14] ([i915#2411] / [i915#402]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@coherency:
    - fi-gdg-551:         [DMESG-FAIL][16] ([i915#1748]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-gdg-551/igt@i915_selftest@live@coherency.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-gdg-551/igt@i915_selftest@live@coherency.html

  
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1748]: https://gitlab.freedesktop.org/drm/intel/issues/1748
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#2772]: https://gitlab.freedesktop.org/drm/intel/issues/2772
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698


Participating hosts (41 -> 37)
------------------------------

  Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bsw-cyan fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5914 -> IGTPW_5319

  CI-20190529: 20190529
  CI_DRM_9509: 66ecfb1df07b703dc4e83e8c520b186dffe6d2b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5319: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/index.html
  IGT_5914: 897202f912b006abf7c62134cbf3fbdb89aade40 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_fair@basic-flow
+igt@gem_exec_fair@basic-none
+igt@gem_exec_fair@basic-none-rrul
+igt@gem_exec_fair@basic-none-share
+igt@gem_exec_fair@basic-none-solo
+igt@gem_exec_fair@basic-none-vip
+igt@gem_exec_fair@basic-pace
+igt@gem_exec_fair@basic-pace-share
+igt@gem_exec_fair@basic-pace-solo
+igt@gem_exec_fair@basic-sync
+igt@gem_exec_fair@basic-throttle
+igt@gem_exec_fair@fair-flow
+igt@gem_exec_fair@fair-flow-ping
+igt@gem_exec_fair@fair-flow-share
+igt@gem_exec_fair@fair-flow-solo
+igt@gem_exec_fair@fair-half
+igt@gem_exec_fair@fair-half-solo
+igt@gem_exec_fair@fair-next
+igt@gem_exec_fair@fair-next-ping
+igt@gem_exec_fair@fair-next-share
+igt@gem_exec_fair@fair-next-solo
+igt@gem_exec_fair@fair-none
+igt@gem_exec_fair@fair-none-ping
+igt@gem_exec_fair@fair-none-rrul
+igt@gem_exec_fair@fair-none-share
+igt@gem_exec_fair@fair-none-solo
+igt@gem_exec_fair@fair-none-vip
+igt@gem_exec_fair@fair-pace
+igt@gem_exec_fair@fair-pace-ping
+igt@gem_exec_fair@fair-pace-share
+igt@gem_exec_fair@fair-pace-solo
+igt@gem_exec_fair@fair-spare
+igt@gem_exec_fair@fair-spare-solo
+igt@gem_exec_fair@fair-sync
+igt@gem_exec_fair@fair-sync-solo
+igt@gem_exec_fair@fair-sync-vip
+igt@gem_exec_fair@fair-throttle
+igt@gem_exec_fair@fair-throttle-rrul
+igt@gem_exec_fair@fair-throttle-share
+igt@gem_exec_fair@fair-throttle-solo
+igt@gem_exec_fair@fair-throttle-vip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/index.html

--===============8404565175412594942==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_fair: Try to spot unfairness (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85139/">https://patchwork.freedesktop.org/series/85139/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5914 -&gt; IGTPW_5319</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5319 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-snb-2600/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2772">i915#2772</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-snb-2600/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/698">i915#698</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5914/fi-gdg-551/igt@i915_selftest@live@coherency.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1748">i915#1748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/fi-gdg-551/igt@i915_selftest@live@coherency.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bsw-cyan fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5914 -&gt; IGTPW_5319</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9509: 66ecfb1df07b703dc4e83e8c520b186dffe6d2b3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5319: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5319/index.html<br />
  IGT_5914: 897202f912b006abf7c62134cbf3fbdb89aade40 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_fair@basic-flow<br />
+igt@gem_exec_fair@basic-none<br />
+igt@gem_exec_fair@basic-none-rrul<br />
+igt@gem_exec_fair@basic-none-share<br />
+igt@gem_exec_fair@basic-none-solo<br />
+igt@gem_exec_fair@basic-none-vip<br />
+igt@gem_exec_fair@basic-pace<br />
+igt@gem_exec_fair@basic-pace-share<br />
+igt@gem_exec_fair@basic-pace-solo<br />
+igt@gem_exec_fair@basic-sync<br />
+igt@gem_exec_fair@basic-throttle<br />
+igt@gem_exec_fair@fair-flow<br />
+igt@gem_exec_fair@fair-flow-ping<br />
+igt@gem_exec_fair@fair-flow-share<br />
+igt@gem_exec_fair@fair-flow-solo<br />
+igt@gem_exec_fair@fair-half<br />
+igt@gem_exec_fair@fair-half-solo<br />
+igt@gem_exec_fair@fair-next<br />
+igt@gem_exec_fair@fair-next-ping<br />
+igt@gem_exec_fair@fair-next-share<br />
+igt@gem_exec_fair@fair-next-solo<br />
+igt@gem_exec_fair@fair-none<br />
+igt@gem_exec_fair@fair-none-ping<br />
+igt@gem_exec_fair@fair-none-rrul<br />
+igt@gem_exec_fair@fair-none-share<br />
+igt@gem_exec_fair@fair-none-solo<br />
+igt@gem_exec_fair@fair-none-vip<br />
+igt@gem_exec_fair@fair-pace<br />
+igt@gem_exec_fair@fair-pace-ping<br />
+igt@gem_exec_fair@fair-pace-share<br />
+igt@gem_exec_fair@fair-pace-solo<br />
+igt@gem_exec_fair@fair-spare<br />
+igt@gem_exec_fair@fair-spare-solo<br />
+igt@gem_exec_fair@fair-sync<br />
+igt@gem_exec_fair@fair-sync-solo<br />
+igt@gem_exec_fair@fair-sync-vip<br />
+igt@gem_exec_fair@fair-throttle<br />
+igt@gem_exec_fair@fair-throttle-rrul<br />
+igt@gem_exec_fair@fair-throttle-share<br />
+igt@gem_exec_fair@fair-throttle-solo<br />
+igt@gem_exec_fair@fair-throttle-vip</p>

</body>
</html>

--===============8404565175412594942==--

--===============1166871437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1166871437==--
