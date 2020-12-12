Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 12 Dec 2020 00:29:08 -0000
Message-ID: <160773294898.10728.15678153597279450695@emeril.freedesktop.org>
References: <20201211233258.2952266-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201211233258.2952266-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Include_the_small_concurrent_tests_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1074324826=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1074324826==
Content-Type: multipart/alternative;
 boundary="===============6319277666007595445=="

--===============6319277666007595445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Include the small concurrent tests (rev2)
URL   : https://patchwork.freedesktop.org/series/84856/
State : success

== Summary ==

CI Bug Log - changes from IGT_5891 -> IGTPW_5275
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/index.html

Known issues
------------

  Here are the changes found in IGTPW_5275 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - fi-apl-guc:         NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_timelines:
    - fi-apl-guc:         [INCOMPLETE][2] ([i915#2750]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5891/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2750]: https://gitlab.freedesktop.org/drm/intel/issues/2750


Participating hosts (42 -> 38)
------------------------------

  Missing    (4): fi-bdw-samus fi-tgl-y fi-dg1-1 fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5891 -> IGTPW_5275

  CI-20190529: 20190529
  CI_DRM_9478: 94cf3a4cc350324f21728c70954c46e535405c87 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5275: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/index.html
  IGT_5891: d14fcf9235c223c29449ef907579e97086b2d4e5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/index.html

--===============6319277666007595445==
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
<tr><td><b>Series:</b></td><td>intel-ci: Include the small concurrent tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84856/">https://patchwork.freedesktop.org/series/84856/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5891 -&gt; IGTPW_5275</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5275 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@amdgpu/amd_cs_nop@nop-gfx0:<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_timelines:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5891/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2750">i915#2750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/fi-apl-guc/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): fi-bdw-samus fi-tgl-y fi-dg1-1 fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5891 -&gt; IGTPW_5275</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9478: 94cf3a4cc350324f21728c70954c46e535405c87 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5275: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5275/index.html<br />
  IGT_5891: d14fcf9235c223c29449ef907579e97086b2d4e5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============6319277666007595445==--

--===============1074324826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1074324826==--
