Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8114288543619243257=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Thu, 11 Aug 2022 06:46:15 -0000
Message-ID: <166020037581.11991.4706150217080289739@emeril.freedesktop.org>
References: <20220811051920.31077-1-karthik.b.s@intel.com>
In-Reply-To: <20220811051920.31077-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fmultiple=3A_Convert_tests_to_dynamic_=28rev2=29?=
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

--===============8114288543619243257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_multiple: Convert tests to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/107054/
State : success

== Summary ==

CI Bug Log - changes from IGT_6622 -> IGTPW_7636
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html

Participating hosts (31 -> 27)
------------------------------

  Missing    (4): fi-ctg-p8600 fi-hsw-4770 fi-apl-guc fi-hsw-4200u 

Known issues
------------

  Here are the changes found in IGTPW_7636 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem:
    - fi-pnv-d510:        [PASS][1] -> [DMESG-FAIL][2] ([i915#4528])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/fi-pnv-d510/igt@i915_selftest@live@gem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/fi-pnv-d510/igt@i915_selftest@live@gem.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][3] ([fdo#109271] / [i915#2403] / [i915#4312])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/fi-pnv-d510/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6622 -> IGTPW_7636

  CI-20190529: 20190529
  CI_DRM_11983: be61f160096902ab2f402179c81f6de59b016d82 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7636: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html
  IGT_6622: 12beb569038d43eb2193d3d42e1a213c31c1c2b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_multiple@tiling-4
+igt@kms_plane_multiple@tiling-none
+igt@kms_plane_multiple@tiling-x
+igt@kms_plane_multiple@tiling-y
+igt@kms_plane_multiple@tiling-yf
-igt@kms_plane_multiple@atomic-pipe-a-tiling-4
-igt@kms_plane_multiple@atomic-pipe-a-tiling-none
-igt@kms_plane_multiple@atomic-pipe-a-tiling-x
-igt@kms_plane_multiple@atomic-pipe-a-tiling-y
-igt@kms_plane_multiple@atomic-pipe-a-tiling-yf
-igt@kms_plane_multiple@atomic-pipe-b-tiling-4
-igt@kms_plane_multiple@atomic-pipe-b-tiling-none
-igt@kms_plane_multiple@atomic-pipe-b-tiling-x
-igt@kms_plane_multiple@atomic-pipe-b-tiling-y
-igt@kms_plane_multiple@atomic-pipe-b-tiling-yf
-igt@kms_plane_multiple@atomic-pipe-c-tiling-4
-igt@kms_plane_multiple@atomic-pipe-c-tiling-none
-igt@kms_plane_multiple@atomic-pipe-c-tiling-x
-igt@kms_plane_multiple@atomic-pipe-c-tiling-y
-igt@kms_plane_multiple@atomic-pipe-c-tiling-yf
-igt@kms_plane_multiple@atomic-pipe-d-tiling-4
-igt@kms_plane_multiple@atomic-pipe-d-tiling-none
-igt@kms_plane_multiple@atomic-pipe-d-tiling-x
-igt@kms_plane_multiple@atomic-pipe-d-tiling-y
-igt@kms_plane_multiple@atomic-pipe-d-tiling-yf
-igt@kms_plane_multiple@atomic-pipe-e-tiling-4
-igt@kms_plane_multiple@atomic-pipe-e-tiling-none
-igt@kms_plane_multiple@atomic-pipe-e-tiling-x
-igt@kms_plane_multiple@atomic-pipe-e-tiling-y
-igt@kms_plane_multiple@atomic-pipe-e-tiling-yf
-igt@kms_plane_multiple@atomic-pipe-f-tiling-4
-igt@kms_plane_multiple@atomic-pipe-f-tiling-none
-igt@kms_plane_multiple@atomic-pipe-f-tiling-x
-igt@kms_plane_multiple@atomic-pipe-f-tiling-y
-igt@kms_plane_multiple@atomic-pipe-f-tiling-yf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html

--===============8114288543619243257==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_multiple: Convert tests to dynamic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107054/">https://patchwork.freedesktop.org/series/107054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6622 -&gt; IGTPW_7636</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html</p>
<h2>Participating hosts (31 -&gt; 27)</h2>
<p>Missing    (4): fi-ctg-p8600 fi-hsw-4770 fi-apl-guc fi-hsw-4200u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7636 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6622/fi-pnv-d510/igt@i915_selftest@live@gem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6622 -&gt; IGTPW_7636</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11983: be61f160096902ab2f402179c81f6de59b016d82 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7636: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7636/index.html<br />
  IGT_6622: 12beb569038d43eb2193d3d42e1a213c31c1c2b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_multiple@tiling-4<br />
+igt@kms_plane_multiple@tiling-none<br />
+igt@kms_plane_multiple@tiling-x<br />
+igt@kms_plane_multiple@tiling-y<br />
+igt@kms_plane_multiple@tiling-yf<br />
-igt@kms_plane_multiple@atomic-pipe-a-tiling-4<br />
-igt@kms_plane_multiple@atomic-pipe-a-tiling-none<br />
-igt@kms_plane_multiple@atomic-pipe-a-tiling-x<br />
-igt@kms_plane_multiple@atomic-pipe-a-tiling-y<br />
-igt@kms_plane_multiple@atomic-pipe-a-tiling-yf<br />
-igt@kms_plane_multiple@atomic-pipe-b-tiling-4<br />
-igt@kms_plane_multiple@atomic-pipe-b-tiling-none<br />
-igt@kms_plane_multiple@atomic-pipe-b-tiling-x<br />
-igt@kms_plane_multiple@atomic-pipe-b-tiling-y<br />
-igt@kms_plane_multiple@atomic-pipe-b-tiling-yf<br />
-igt@kms_plane_multiple@atomic-pipe-c-tiling-4<br />
-igt@kms_plane_multiple@atomic-pipe-c-tiling-none<br />
-igt@kms_plane_multiple@atomic-pipe-c-tiling-x<br />
-igt@kms_plane_multiple@atomic-pipe-c-tiling-y<br />
-igt@kms_plane_multiple@atomic-pipe-c-tiling-yf<br />
-igt@kms_plane_multiple@atomic-pipe-d-tiling-4<br />
-igt@kms_plane_multiple@atomic-pipe-d-tiling-none<br />
-igt@kms_plane_multiple@atomic-pipe-d-tiling-x<br />
-igt@kms_plane_multiple@atomic-pipe-d-tiling-y<br />
-igt@kms_plane_multiple@atomic-pipe-d-tiling-yf<br />
-igt@kms_plane_multiple@atomic-pipe-e-tiling-4<br />
-igt@kms_plane_multiple@atomic-pipe-e-tiling-none<br />
-igt@kms_plane_multiple@atomic-pipe-e-tiling-x<br />
-igt@kms_plane_multiple@atomic-pipe-e-tiling-y<br />
-igt@kms_plane_multiple@atomic-pipe-e-tiling-yf<br />
-igt@kms_plane_multiple@atomic-pipe-f-tiling-4<br />
-igt@kms_plane_multiple@atomic-pipe-f-tiling-none<br />
-igt@kms_plane_multiple@atomic-pipe-f-tiling-x<br />
-igt@kms_plane_multiple@atomic-pipe-f-tiling-y<br />
-igt@kms_plane_multiple@atomic-pipe-f-tiling-yf</p>

</body>
</html>

--===============8114288543619243257==--
