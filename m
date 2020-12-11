Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 11 Dec 2020 15:28:20 -0000
Message-ID: <160770050079.16100.9341830682748379623@emeril.freedesktop.org>
References: <20201211143909.2716931-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201211143909.2716931-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=5Fpmu=3A_Verify_RC6_measurements_before/after_suspend?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1054854256=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1054854256==
Content-Type: multipart/alternative;
 boundary="===============2470478321789558724=="

--===============2470478321789558724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/perf_pmu: Verify RC6 measurements before/after suspend
URL   : https://patchwork.freedesktop.org/series/84846/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9476 -> IGTPW_5273
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html

Known issues
------------

  Here are the changes found in IGTPW_5273 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-compute:
    - fi-cfl-guc:         NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/fi-cfl-guc/igt@amdgpu/amd_basic@cs-compute.html

  * igt@i915_selftest@live@coherency:
    - fi-gdg-551:         [PASS][2] -> [DMESG-FAIL][3] ([i915#1748])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/fi-gdg-551/igt@i915_selftest@live@coherency.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/fi-gdg-551/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7500u:       [PASS][4] -> [DMESG-WARN][5] ([i915#2605])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-cfl-guc:         [INCOMPLETE][6] ([i915#1037]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/fi-cfl-guc/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/fi-cfl-guc/igt@i915_selftest@live@execlists.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1748]: https://gitlab.freedesktop.org/drm/intel/issues/1748
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605


Participating hosts (42 -> 38)
------------------------------

  Missing    (4): fi-bdw-samus fi-tgl-y fi-dg1-1 fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5889 -> IGTPW_5273

  CI-20190529: 20190529
  CI_DRM_9476: d8abf7202ace9d800683176aab8df3137790a00c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5273: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html
  IGT_5889: 3e63914556947974bd2d1cf92dda5b83e36848e4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf_pmu@rc6-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html

--===============2470478321789558724==
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
<tr><td><b>Series:</b></td><td>i915/perf_pmu: Verify RC6 measurements before/after suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84846/">https://patchwork.freedesktop.org/series/84846/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9476 -&gt; IGTPW_5273</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5273 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-compute:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/fi-cfl-guc/igt@amdgpu/amd_basic@cs-compute.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/fi-gdg-551/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/fi-gdg-551/igt@i915_selftest@live@coherency.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1748">i915#1748</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/fi-cfl-guc/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/fi-cfl-guc/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): fi-bdw-samus fi-tgl-y fi-dg1-1 fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5889 -&gt; IGTPW_5273</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9476: d8abf7202ace9d800683176aab8df3137790a00c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5273: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html<br />
  IGT_5889: 3e63914556947974bd2d1cf92dda5b83e36848e4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@perf_pmu@rc6-suspend</p>

</body>
</html>

--===============2470478321789558724==--

--===============1054854256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1054854256==--
