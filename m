Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5230010182111558414=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Sep 2021 11:31:54 -0000
Message-ID: <163110071495.22224.962280341649623658@emeril.freedesktop.org>
References: <20210908104137.28851-1-ramalingam.c@intel.com>
In-Reply-To: <20210908104137.28851-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fprime=3A_Create_the_exporting_BO_with_smem_placement?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============5230010182111558414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_prime: Create the exporting BO with smem placement
URL   : https://patchwork.freedesktop.org/series/94471/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10562 -> IGTPW_6209
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/index.html

Known issues
------------

  Here are the changes found in IGTPW_6209 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@userptr:
    - fi-pnv-d510:        [PASS][1] -> [INCOMPLETE][2] ([i915#299])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10562/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][3] ([i915#2403])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/fi-pnv-d510/igt@runner@aborted.html

  
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299


Participating hosts (47 -> 39)
------------------------------

  Missing    (8): fi-ilk-m540 bat-adls-5 bat-dg1-6 fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6200 -> IGTPW_6209

  CI-20190529: 20190529
  CI_DRM_10562: d38c3e456e48f3cc74f454615dedc5a82e258402 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6209: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/index.html
  IGT_6200: 3a6585c472dff11ece952b745244f05e4c93ede5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/index.html

--===============5230010182111558414==
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
<tr><td><b>Series:</b></td><td>tests/kms_prime: Create the exporting BO with smem placement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94471/">https://patchwork.freedesktop.org/series/94471/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10562 -&gt; IGTPW_6209</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6209 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10562/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (47 -&gt; 39)</h2>
<p>Missing    (8): fi-ilk-m540 bat-adls-5 bat-dg1-6 fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6200 -&gt; IGTPW_6209</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10562: d38c3e456e48f3cc74f454615dedc5a82e258402 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6209: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6209/index.html<br />
  IGT_6200: 3a6585c472dff11ece952b745244f05e4c93ede5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5230010182111558414==--
