Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 10 Jul 2021 22:00:11 -0000
Message-ID: <162595441110.15857.6879801140602278931@emeril.freedesktop.org>
References: <20210710211923.784638-1-jason@jlekstrand.net>
In-Reply-To: <20210710211923.784638-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fparam=3A_Test_that_you_can_only_set_the_VM_onc?=
 =?utf-8?q?e?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1368561937=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1368561937==
Content-Type: multipart/alternative;
 boundary="===============8794532335839501761=="

--===============8794532335839501761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_ctx_param: Test that you can only set the VM once
URL   : https://patchwork.freedesktop.org/series/92401/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10330 -> IGTPW_6011
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/index.html

Known issues
------------

  Here are the changes found in IGTPW_6011 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@userptr:
    - fi-pnv-d510:        [PASS][1] -> [INCOMPLETE][2] ([i915#299])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10330/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-pnv-d510:        [FAIL][3] ([i915#2403] / [i915#2505] / [i915#2722] / [i915#3744]) -> [FAIL][4] ([i915#2403] / [i915#2505] / [i915#2722])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10330/fi-pnv-d510/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/fi-pnv-d510/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#3744]: https://gitlab.freedesktop.org/drm/intel/issues/3744


Participating hosts (41 -> 38)
------------------------------

  Missing    (3): fi-bsw-cyan fi-bdw-samus fi-bsw-n3050 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6134 -> IGTPW_6011

  CI-20190529: 20190529
  CI_DRM_10330: 4d00e2309398147acdbfefbe1deb4b0e78868466 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6011: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/index.html
  IGT_6134: cd63c83e23789eb194d38b8d272247a88122f2f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/index.html

--===============8794532335839501761==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_ctx_param: Test that you can only set the VM once</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92401/">https://patchwork.freedesktop.org/series/92401/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10330 -&gt; IGTPW_6011</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6011 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_parallel@engines@userptr:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10330/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10330/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3744">i915#3744</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): fi-bsw-cyan fi-bdw-samus fi-bsw-n3050 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6134 -&gt; IGTPW_6011</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10330: 4d00e2309398147acdbfefbe1deb4b0e78868466 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6011: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6011/index.html<br />
  IGT_6134: cd63c83e23789eb194d38b8d272247a88122f2f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8794532335839501761==--

--===============1368561937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1368561937==--
