Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0101464288962224457=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Sep 2021 21:16:18 -0000
Message-ID: <163234537889.6941.15098726748069020143@emeril.freedesktop.org>
References: <20210922193623.3891030-1-markyacoub@chromium.org>
In-Reply-To: <20210922193623.3891030-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?template=3A_Use_DRIVER=5FANY_in_for_drm=5Fopen=5Fdriver?=
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0101464288962224457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/template: Use DRIVER_ANY in for drm_open_driver
URL   : https://patchwork.freedesktop.org/series/94961/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10629 -> IGTPW_6247
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/index.html

Known issues
------------

  Here are the changes found in IGTPW_6247 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2] ([i915#1888])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][3] -> [INCOMPLETE][4] ([i915#2940])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-bsw-nick/igt@i915_selftest@live@execlists.html
    - fi-kbl-soraka:      [PASS][5] -> [INCOMPLETE][6] ([i915#794])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-7567u:       [PASS][7] -> [DMESG-FAIL][8] ([i915#2291] / [i915#541])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-r:           [DMESG-FAIL][9] ([i915#2291] / [i915#541]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-kbl-r/igt@i915_selftest@live@gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-kbl-r/igt@i915_selftest@live@gt_heartbeat.html

  
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794


Participating hosts (42 -> 35)
------------------------------

  Missing    (7): fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6214 -> IGTPW_6247

  CI-20190529: 20190529
  CI_DRM_10629: ce6974ec90355ddef78e6bc2221cb2296e5ba349 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/index.html
  IGT_6214: 13550e92c6c7bd825abb6c9b087d12a524b4674c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/index.html

--===============0101464288962224457==
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
<tr><td><b>Series:</b></td><td>tests/template: Use DRIVER_ANY in for drm_open_driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94961/">https://patchwork.freedesktop.org/series/94961/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10629 -&gt; IGTPW_6247</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6247 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10629/fi-kbl-r/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/fi-kbl-r/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 35)</h2>
<p>Missing    (7): fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6214 -&gt; IGTPW_6247</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10629: ce6974ec90355ddef78e6bc2221cb2296e5ba349 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6247/index.html<br />
  IGT_6214: 13550e92c6c7bd825abb6c9b087d12a524b4674c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0101464288962224457==--
