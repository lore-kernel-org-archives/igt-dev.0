Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 07 Jul 2021 07:03:18 -0000
Message-ID: <162564139870.30455.2168070708457186403@emeril.freedesktop.org>
References: <20210707063523.30233-1-swati2.sharma@intel.com>
In-Reply-To: <20210707063523.30233-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcdclk=3A_Fix_CDCLK_failure_condition?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0428141808=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0428141808==
Content-Type: multipart/alternative;
 boundary="===============4107071207533941844=="

--===============4107071207533941844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cdclk: Fix CDCLK failure condition
URL   : https://patchwork.freedesktop.org/series/92259/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10308 -> IGTPW_5987
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/index.html

Known issues
------------

  Here are the changes found in IGTPW_5987 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][1] ([i915#3718])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@cursor_plane_move:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][2] ([fdo#109271]) +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html

  * igt@vgem_basic@unload:
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][3] ([i915#3744])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-bdw-5557u/igt@vgem_basic@unload.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bdw-5557u:       [FAIL][4] ([i915#1602] / [i915#2029]) -> [FAIL][5] ([i915#2722])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10308/fi-bdw-5557u/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-bdw-5557u/igt@runner@aborted.html

  * igt@vgem_basic@unload:
    - fi-pnv-d510:        [INCOMPLETE][6] ([i915#299]) -> [INCOMPLETE][7] ([i915#299] / [i915#3744])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10308/fi-pnv-d510/igt@vgem_basic@unload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-pnv-d510/igt@vgem_basic@unload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#3718]: https://gitlab.freedesktop.org/drm/intel/issues/3718
  [i915#3744]: https://gitlab.freedesktop.org/drm/intel/issues/3744


Participating hosts (38 -> 33)
------------------------------

  Missing    (5): fi-bsw-n3050 fi-bsw-cyan fi-dg1-1 fi-cfl-8109u fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6129 -> IGTPW_5987

  CI-20190529: 20190529
  CI_DRM_10308: 9d1b5a9bdfbfb97b6e6b7ee3d863ee373ee9fd9e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5987: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/index.html
  IGT_6129: 687589e76f787d26ee2b539e551a9be06bd41ce3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/index.html

--===============4107071207533941844==
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
<tr><td><b>Series:</b></td><td>tests/kms_cdclk: Fix CDCLK failure condition</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92259/">https://patchwork.freedesktop.org/series/92259/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10308 -&gt; IGTPW_5987</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5987 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3718">i915#3718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-bdw-5557u/igt@vgem_basic@unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3744">i915#3744</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10308/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10308/fi-pnv-d510/igt@vgem_basic@unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/fi-pnv-d510/igt@vgem_basic@unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3744">i915#3744</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (38 -&gt; 33)</h2>
<p>Missing    (5): fi-bsw-n3050 fi-bsw-cyan fi-dg1-1 fi-cfl-8109u fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6129 -&gt; IGTPW_5987</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10308: 9d1b5a9bdfbfb97b6e6b7ee3d863ee373ee9fd9e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5987: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5987/index.html<br />
  IGT_6129: 687589e76f787d26ee2b539e551a9be06bd41ce3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4107071207533941844==--

--===============0428141808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0428141808==--
