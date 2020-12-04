Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 04 Dec 2020 12:39:08 -0000
Message-ID: <160708554857.27542.6182079299190694892@emeril.freedesktop.org>
References: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Don=27t_kill_a_test_on_taint_if_watching_timeouts?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0970555611=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0970555611==
Content-Type: multipart/alternative;
 boundary="===============3022764724043932925=="

--===============3022764724043932925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Don't kill a test on taint if watching timeouts
URL   : https://patchwork.freedesktop.org/series/84577/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9441 -> IGTPW_5249
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html

Known issues
------------

  Here are the changes found in IGTPW_5249 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@blt:
    - fi-hsw-4770:        [PASS][1] -> [DMESG-FAIL][2] ([i915#1409])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/fi-hsw-4770/igt@i915_selftest@live@blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/fi-hsw-4770/igt@i915_selftest@live@blt.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [INCOMPLETE][3] ([i915#2405]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  
  [i915#1409]: https://gitlab.freedesktop.org/drm/intel/issues/1409
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405


Participating hosts (43 -> 37)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-tgl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5880 -> IGTPW_5249

  CI-20190529: 20190529
  CI_DRM_9441: 6e992bb7585d1bee238776d8fe0512a70a22a1a0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5249: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html
  IGT_5880: d67bad61dc9a7515f94a7eecadd3bcd6b4f9d49e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html

--===============3022764724043932925==
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
<tr><td><b>Series:</b></td><td>runner: Don&#39;t kill a test on taint if watching timeouts</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84577/">https://patchwork.freedesktop.org/series/84577/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9441 -&gt; IGTPW_5249</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5249 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@blt:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/fi-hsw-4770/igt@i915_selftest@live@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/fi-hsw-4770/igt@i915_selftest@live@blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1409">i915#1409</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 37)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-tgl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5880 -&gt; IGTPW_5249</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9441: 6e992bb7585d1bee238776d8fe0512a70a22a1a0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5249: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html<br />
  IGT_5880: d67bad61dc9a7515f94a7eecadd3bcd6b4f9d49e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3022764724043932925==--

--===============0970555611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0970555611==--
