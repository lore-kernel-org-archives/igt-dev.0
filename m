Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0453258366485125709=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Tue, 18 Oct 2022 19:38:22 -0000
Message-ID: <166612190291.20427.4663289031115553041@emeril.freedesktop.org>
References: <20221018145926.4014906-1-markyacoub@chromium.org>
In-Reply-To: <20221018145926.4014906-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUmVmYWN0?=
 =?utf-8?q?or_Display_Outputs_to_handle_MST_Connectors=2E?=
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

--===============0453258366485125709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor Display Outputs to handle MST Connectors.
URL   : https://patchwork.freedesktop.org/series/109831/
State : success

== Summary ==

CI Bug Log - changes from IGT_7019 -> IGTPW_7977
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): bat-adlm-1 

Known issues
------------

  Here are the changes found in IGTPW_7977 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-bdw-5557u:       [PASS][1] -> [INCOMPLETE][2] ([i915#7263])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][3] ([i915#2582]) -> [PASS][4] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/bat-rpls-2/igt@fbdev@read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/bat-rpls-2/igt@fbdev@read.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@random-engines:
    - fi-bdw-5557u:       [INCOMPLETE][5] -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/fi-bdw-5557u/igt@gem_lmem_swapping@random-engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/fi-bdw-5557u/igt@gem_lmem_swapping@random-engines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#7263]: https://gitlab.freedesktop.org/drm/intel/issues/7263


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7019 -> IGTPW_7977

  CI-20190529: 20190529
  CI_DRM_12257: b249abef9f86f788e6bacc657ae8eb7743948200 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html
  IGT_7019: fdbafce2b74e84739bb1d81223ae6f01fb442980 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html

--===============0453258366485125709==
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
<tr><td><b>Series:</b></td><td>Refactor Display Outputs to handle MST Connectors.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109831/">https://patchwork.freedesktop.org/series/109831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7019 -&gt; IGTPW_7977</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): bat-adlm-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7977 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7263">i915#7263</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@fbdev@read:<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_lmem_swapping@random-engines:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/fi-bdw-5557u/igt@gem_lmem_swapping@random-engines.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/fi-bdw-5557u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7019 -&gt; IGTPW_7977</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12257: b249abef9f86f788e6bacc657ae8eb7743948200 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html<br />
  IGT_7019: fdbafce2b74e84739bb1d81223ae6f01fb442980 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0453258366485125709==--
