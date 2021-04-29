Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 29 Apr 2021 12:54:28 -0000
Message-ID: <161970086830.20428.16492836305078684124@emeril.freedesktop.org>
References: <20210429084130.850426-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210429084130.850426-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fworkarounds=3A_Prepare_for_read_mask?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0733112008=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0733112008==
Content-Type: multipart/alternative;
 boundary="===============3444811874551931999=="

--===============3444811874551931999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_workarounds: Prepare for read mask
URL   : https://patchwork.freedesktop.org/series/89638/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10027 -> IGTPW_5770
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/index.html

Known issues
------------

  Here are the changes found in IGTPW_5770 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2] ([i915#155])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10027/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][3] ([i915#1888]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10027/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_frontbuffer_tracking@basic:
    - {fi-rkl-11500t}:    [SKIP][5] ([i915#1849] / [i915#3180]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10027/fi-rkl-11500t/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/fi-rkl-11500t/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#3180]: https://gitlab.freedesktop.org/drm/intel/issues/3180


Participating hosts (44 -> 39)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6077 -> IGTPW_5770

  CI-20190529: 20190529
  CI_DRM_10027: 1748cb1e8bdf543570b86f39487b171ad4c1f896 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5770: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/index.html
  IGT_6077: 126a3f6fc0e97786e2819085efc84e741093aed5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/index.html

--===============3444811874551931999==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_workarounds: Prepare for read mask</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89638/">https://patchwork.freedesktop.org/series/89638/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10027 -&gt; IGTPW_5770</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5770 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10027/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10027/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10027/fi-rkl-11500t/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3180">i915#3180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/fi-rkl-11500t/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6077 -&gt; IGTPW_5770</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10027: 1748cb1e8bdf543570b86f39487b171ad4c1f896 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5770: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5770/index.html<br />
  IGT_6077: 126a3f6fc0e97786e2819085efc84e741093aed5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3444811874551931999==--

--===============0733112008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0733112008==--
