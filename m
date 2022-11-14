Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7369217092891256244=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <petri.latvala@intel.com>
Date: Mon, 14 Nov 2022 15:18:21 -0000
Message-ID: <166843910100.32752.3828827785964028041@emeril.freedesktop.org>
References: <20221111080529.2427645-1-petri.latvala@intel.com>
In-Reply-To: <20221111080529.2427645-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Fix_a_memory_leak_in_stderr=5Fcontains=5Fwarnings_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============7369217092891256244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Fix a memory leak in stderr_contains_warnings (rev2)
URL   : https://patchwork.freedesktop.org/series/110789/
State : success

== Summary ==

CI Bug Log - changes from IGT_7055 -> IGTPW_8096
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/index.html

Participating hosts (39 -> 37)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (3): bat-rpls-2 fi-bdw-samus bat-dg1-5 

Known issues
------------

  Here are the changes found in IGTPW_8096 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_tiled_blits@basic:
    - fi-apl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#7056])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/fi-apl-guc/igt@gem_render_tiled_blits@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@migrate:
    - {bat-adlp-6}:       [INCOMPLETE][3] ([i915#7348]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/bat-adlp-6/igt@i915_selftest@live@migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/bat-adlp-6/igt@i915_selftest@live@migrate.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size:
    - fi-blb-e6850:       [FAIL][5] ([i915#2346]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#7056]: https://gitlab.freedesktop.org/drm/intel/issues/7056
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7360]: https://gitlab.freedesktop.org/drm/intel/issues/7360
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7055 -> IGTPW_8096

  CI-20190529: 20190529
  CI_DRM_12376: ceb77a7b0d107112b1b4197917d8fdec9a3d0ca8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8096: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/index.html
  IGT_7055: f37bbbbce4d34c3220a2bd5492a2e9c2a7390288 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@kms_vrr@negative-basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/index.html

--===============7369217092891256244==
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
<tr><td><b>Series:</b></td><td>runner: Fix a memory leak in stderr_contains_warnings (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110789/">https://patchwork.freedesktop.org/series/110789/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7055 -&gt; IGTPW_8096</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (3): bat-rpls-2 fi-bdw-samus bat-dg1-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8096 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_render_tiled_blits@basic:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7056">i915#7056</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/bat-adlp-6/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/bat-adlp-6/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7055 -&gt; IGTPW_8096</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12376: ceb77a7b0d107112b1b4197917d8fdec9a3d0ca8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8096: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8096/index.html<br />
  IGT_7055: f37bbbbce4d34c3220a2bd5492a2e9c2a7390288 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@kms_vrr@negative-basic</p>

</body>
</html>

--===============7369217092891256244==--
