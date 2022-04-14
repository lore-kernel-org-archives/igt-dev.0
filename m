Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3211936128152348457=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 14 Apr 2022 10:08:51 -0000
Message-ID: <164993093136.1346.6409871654623725168@emeril.freedesktop.org>
References: <cover.1649924725.git.mchehab@kernel.org>
In-Reply-To: <cover.1649924725.git.mchehab@kernel.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQmV0dGVy?=
 =?utf-8?q?_handle_video_driver_unload_logic?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3211936128152348457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Better handle video driver unload logic
URL   : https://patchwork.freedesktop.org/series/102688/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11499 -> IGTPW_6930
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/index.html

Participating hosts (49 -> 43)
------------------------------

  Missing    (6): bat-dg1-5 bat-adlm-1 fi-bsw-cyan bat-hsw-1 bat-rpls-2 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_6930 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@coherency:
    - fi-bdw-5557u:       [PASS][1] -> [INCOMPLETE][2] ([i915#5674] / [i915#5685])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/fi-bdw-5557u/igt@i915_selftest@live@coherency.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/fi-bdw-5557u/igt@i915_selftest@live@coherency.html

  
#### Possible fixes ####

  * igt@gem_ringfill@basic-all:
    - {bat-dg2-8}:        [TIMEOUT][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/bat-dg2-8/igt@gem_ringfill@basic-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/bat-dg2-8/igt@gem_ringfill@basic-all.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#5674]: https://gitlab.freedesktop.org/drm/intel/issues/5674
  [i915#5685]: https://gitlab.freedesktop.org/drm/intel/issues/5685


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6420 -> IGTPW_6930

  CI-20190529: 20190529
  CI_DRM_11499: aad6e551495e0ff256adeae6106c8fa1bdb3faed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/index.html
  IGT_6420: a3885810ccc0ce9e6552a20c910a0a322eca466c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/index.html

--===============3211936128152348457==
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
<tr><td><b>Series:</b></td><td>Better handle video driver unload logic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102688/">https://patchwork.freedesktop.org/series/102688/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11499 -&gt; IGTPW_6930</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/index.html</p>
<h2>Participating hosts (49 -&gt; 43)</h2>
<p>Missing    (6): bat-dg1-5 bat-adlm-1 fi-bsw-cyan bat-hsw-1 bat-rpls-2 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6930 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@coherency:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/fi-bdw-5557u/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/fi-bdw-5557u/igt@i915_selftest@live@coherency.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5674">i915#5674</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5685">i915#5685</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_ringfill@basic-all:<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11499/bat-dg2-8/igt@gem_ringfill@basic-all.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/bat-dg2-8/igt@gem_ringfill@basic-all.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6420 -&gt; IGTPW_6930</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11499: aad6e551495e0ff256adeae6106c8fa1bdb3faed @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6930/index.html<br />
  IGT_6420: a3885810ccc0ce9e6552a20c910a0a322eca466c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3211936128152348457==--
