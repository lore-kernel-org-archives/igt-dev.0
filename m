Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Mar 2021 13:15:55 -0000
Message-ID: <161615975519.8630.10940830746008428943@emeril.freedesktop.org>
References: <20210319123317.118694-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210319123317.118694-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Initialize_fb_height_width_to_0_?=
 =?utf-8?b?KHJldjMp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1388191633=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1388191633==
Content-Type: multipart/alternative;
 boundary="===============1520002293163124153=="

--===============1520002293163124153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_content_protection: Initialize fb height width to 0 (rev3)
URL   : https://patchwork.freedesktop.org/series/88114/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9875 -> IGTPW_5629
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/index.html

Known issues
------------

  Here are the changes found in IGTPW_5629 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [PASS][1] -> [TIMEOUT][2] ([i915#3145])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  
#### Possible fixes ####

  * igt@gem_tiled_fence_blits@basic:
    - fi-kbl-8809g:       [TIMEOUT][3] ([i915#3145]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_wait@busy@all:
    - fi-bsw-nick:        [FAIL][5] ([i915#3177]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/fi-bsw-nick/igt@gem_wait@busy@all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/fi-bsw-nick/igt@gem_wait@busy@all.html

  
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177


Participating hosts (44 -> 38)
------------------------------

  Missing    (6): fi-ilk-m540 fi-bdw-5557u fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6039 -> IGTPW_5629

  CI-20190529: 20190529
  CI_DRM_9875: 218e09274103c3117d90167bb3ee0ba3a0a63f84 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5629: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/index.html
  IGT_6039: 8c4a2cda2a92bdd87797969ef299ad7f6e8e993b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/index.html

--===============1520002293163124153==
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
<tr><td><b>Series:</b></td><td>tests/kms_content_protection: Initialize fb height width to 0 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88114/">https://patchwork.freedesktop.org/series/88114/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9875 -&gt; IGTPW_5629</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5629 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/fi-bsw-nick/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/fi-bsw-nick/igt@gem_wait@busy@all.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (44 -&gt; 38)</h2>
<p>Missing    (6): fi-ilk-m540 fi-bdw-5557u fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6039 -&gt; IGTPW_5629</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9875: 218e09274103c3117d90167bb3ee0ba3a0a63f84 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5629: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5629/index.html<br />
  IGT_6039: 8c4a2cda2a92bdd87797969ef299ad7f6e8e993b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1520002293163124153==--

--===============1388191633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1388191633==--
