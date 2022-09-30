Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5883811371290341188=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Fri, 30 Sep 2022 04:44:13 -0000
Message-ID: <166451305368.23344.13415286108406173270@emeril.freedesktop.org>
References: <20220930035249.6633-1-jeevan.b@intel.com>
In-Reply-To: <20220930035249.6633-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ29udmVy?=
 =?utf-8?q?t_PSR2_sf_=26_su_test_to_dynamic_=28rev6=29?=
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

--===============5883811371290341188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert PSR2 sf & su test to dynamic (rev6)
URL   : https://patchwork.freedesktop.org/series/108299/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12202 -> IGTPW_7896
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/index.html

Participating hosts (47 -> 43)
------------------------------

  Missing    (4): fi-ctg-p8600 fi-hsw-4770 fi-bdw-samus fi-hsw-4200u 

Known issues
------------

  Here are the changes found in IGTPW_7896 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-skl-6700k2:      [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12202/fi-skl-6700k2/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/fi-skl-6700k2/igt@i915_selftest@live@gt_heartbeat.html
    - fi-bxt-dsi:         [PASS][3] -> [DMESG-FAIL][4] ([i915#5334])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12202/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [INCOMPLETE][5] ([i915#4983]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12202/bat-rpls-1/igt@i915_selftest@live@requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/bat-rpls-1/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6670 -> IGTPW_7896

  CI-20190529: 20190529
  CI_DRM_12202: 0b9f0501c9541cf79fdfb43a7760360a81453d88 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7896: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/index.html
  IGT_6670: d618e9865fe5cbaf511ca43503abad442605d0a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/index.html

--===============5883811371290341188==
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
<tr><td><b>Series:</b></td><td>Convert PSR2 sf &amp; su test to dynamic (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108299/">https://patchwork.freedesktop.org/series/108299/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12202 -&gt; IGTPW_7896</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/index.html</p>
<h2>Participating hosts (47 -&gt; 43)</h2>
<p>Missing    (4): fi-ctg-p8600 fi-hsw-4770 fi-bdw-samus fi-hsw-4200u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7896 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12202/fi-skl-6700k2/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/fi-skl-6700k2/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12202/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12202/bat-rpls-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6670 -&gt; IGTPW_7896</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12202: 0b9f0501c9541cf79fdfb43a7760360a81453d88 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7896: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7896/index.html<br />
  IGT_6670: d618e9865fe5cbaf511ca43503abad442605d0a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5883811371290341188==--
