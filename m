Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 22 Dec 2020 14:08:03 -0000
Message-ID: <160864608393.27826.2436274637779017140@emeril.freedesktop.org>
References: <20201222132354.2914268-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201222132354.2914268-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=5Fpmu=3A_Measure_accuracy_of_busyness?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0687711163=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0687711163==
Content-Type: multipart/alternative;
 boundary="===============7338526955413432781=="

--===============7338526955413432781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/perf_pmu: Measure accuracy of busyness
URL   : https://patchwork.freedesktop.org/series/85163/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9512 -> IGTPW_5323
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/index.html

Known issues
------------

  Here are the changes found in IGTPW_5323 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_vgem@basic-read:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9512/fi-tgl-y/igt@prime_vgem@basic-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/fi-tgl-y/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [DMESG-WARN][3] ([i915#402]) -> [PASS][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9512/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (42 -> 36)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5916 -> IGTPW_5323

  CI-20190529: 20190529
  CI_DRM_9512: 65aa74f3b78552b11b897a7e15c91de14513fafb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5323: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/index.html
  IGT_5916: 2100c6efd2de767a876977ae1a8a6366e4beb643 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@perf_pmu@busy-minimum

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/index.html

--===============7338526955413432781==
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
<tr><td><b>Series:</b></td><td>i915/perf_pmu: Measure accuracy of busyness</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85163/">https://patchwork.freedesktop.org/series/85163/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9512 -&gt; IGTPW_5323</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5323 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@prime_vgem@basic-read:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9512/fi-tgl-y/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/fi-tgl-y/igt@prime_vgem@basic-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_flink_basic@bad-flink:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9512/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 36)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5916 -&gt; IGTPW_5323</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9512: 65aa74f3b78552b11b897a7e15c91de14513fafb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5323: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5323/index.html<br />
  IGT_5916: 2100c6efd2de767a876977ae1a8a6366e4beb643 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@perf_pmu@busy-minimum</p>

</body>
</html>

--===============7338526955413432781==--

--===============0687711163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0687711163==--
