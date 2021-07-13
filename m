Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 13 Jul 2021 13:20:37 -0000
Message-ID: <162618243743.711.16938975666349202531@emeril.freedesktop.org>
References: <20210713120016.463320-1-stylon.wang@amd.com>
In-Reply-To: <20210713120016.463320-1-stylon.wang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTmV3IHRl?=
 =?utf-8?q?sts_for_ASSR_Content_Protection_on_DP/eDP?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0221473671=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0221473671==
Content-Type: multipart/alternative;
 boundary="===============6755910835952450529=="

--===============6755910835952450529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New tests for ASSR Content Protection on DP/eDP
URL   : https://patchwork.freedesktop.org/series/92472/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10339 -> IGTPW_6017
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/index.html

Known issues
------------

  Here are the changes found in IGTPW_6017 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +27 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-kbl-soraka/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][3] ([i915#3718])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][4] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][5] ([fdo#109271]) +48 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@userptr:
    - fi-pnv-d510:        [INCOMPLETE][6] ([i915#299]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10339/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html

  * igt@i915_selftest@live@gt_pm:
    - fi-icl-y:           [DMESG-FAIL][8] ([i915#2291]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10339/fi-icl-y/igt@i915_selftest@live@gt_pm.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-icl-y/igt@i915_selftest@live@gt_pm.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#3718]: https://gitlab.freedesktop.org/drm/intel/issues/3718


Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6135 -> IGTPW_6017

  CI-20190529: 20190529
  CI_DRM_10339: 5ff1081389a25152162a30fac19ae9c7e8248df7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6017: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/index.html
  IGT_6135: 3bf28f9dffd41b85c262d4e6664ffbdf5b7d9a93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@amdgpu/amd_assr@assr-links
+igt@amdgpu/amd_assr@assr-links-dpms
+igt@amdgpu/amd_assr@assr-links-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/index.html

--===============6755910835952450529==
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
<tr><td><b>Series:</b></td><td>New tests for ASSR Content Protection on DP/eDP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92472/">https://patchwork.freedesktop.org/series/92472/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10339 -&gt; IGTPW_6017</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6017 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-kbl-soraka/igt@amdgpu/amd_prime@amd-to-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3718">i915#3718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10339/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10339/fi-icl-y/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/fi-icl-y/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6135 -&gt; IGTPW_6017</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10339: 5ff1081389a25152162a30fac19ae9c7e8248df7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6017: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6017/index.html<br />
  IGT_6135: 3bf28f9dffd41b85c262d4e6664ffbdf5b7d9a93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@amdgpu/amd_assr@assr-links<br />
+igt@amdgpu/amd_assr@assr-links-dpms<br />
+igt@amdgpu/amd_assr@assr-links-suspend</p>

</body>
</html>

--===============6755910835952450529==--

--===============0221473671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0221473671==--
