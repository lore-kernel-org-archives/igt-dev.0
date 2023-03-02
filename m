Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9089277000939670519=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karolina Stolarek" <karolina.stolarek@intel.com>
Date: Thu, 02 Mar 2023 20:22:16 -0000
Message-ID: <167778853622.20550.3257095851594588290@emeril.freedesktop.org>
References: <20230302113946.1155746-1-karolina.stolarek@intel.com>
In-Reply-To: <20230302113946.1155746-1-karolina.stolarek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fccs=3A_Remove_inplace_subtests?=
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

--===============9089277000939670519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_ccs: Remove inplace subtests
URL   : https://patchwork.freedesktop.org/series/114563/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7178 -> IGTPW_8554
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8554 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8554, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8554/index.html

Participating hosts (39 -> 3)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_8554 prevented too many machines from booting.

  Missing    (36): fi-rkl-11600 bat-adls-5 bat-dg1-5 bat-adlp-6 fi-apl-guc fi-snb-2520m fi-pnv-d510 bat-rpls-1 bat-rpls-2 fi-blb-e6850 fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-ilk-650 fi-hsw-4770 bat-adln-1 fi-ivb-3770 bat-jsl-3 bat-rplp-1 fi-elk-e7500 bat-dg2-11 fi-bsw-nick fi-kbl-7567u bat-dg1-7 bat-kbl-2 bat-adlp-9 fi-skl-guc fi-cfl-8700k fi-glk-j4005 bat-jsl-1 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7178 -> IGTPW_8554
  * Linux: CI_DRM_12798 -> CI_DRM_12801

  CI-20190529: 20190529
  CI_DRM_12798: 6c2064dddd9ef900a337f7bbbfa2d5c712950242 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_12801: 6695d34a4e09a2371e6ad8a2ea8644bfa901744e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8554: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8554/index.html
  IGT_7178: ffe3f6670b91ab975f90799ab3fd0941b6eae019 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 0 lines
--- 789 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8554/index.html

--===============9089277000939670519==
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
<tr><td><b>Series:</b></td><td>tests/gem_ccs: Remove inplace subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114563/">https://patchwork.freedesktop.org/series/114563/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8554/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8554/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7178 -&gt; IGTPW_8554</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8554 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8554, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8554/index.html</p>
<h2>Participating hosts (39 -&gt; 3)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_8554 prevented too many machines from booting.</p>
<p>Missing    (36): fi-rkl-11600 bat-adls-5 bat-dg1-5 bat-adlp-6 fi-apl-guc fi-snb-2520m fi-pnv-d510 bat-rpls-1 bat-rpls-2 fi-blb-e6850 fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-ilk-650 fi-hsw-4770 bat-adln-1 fi-ivb-3770 bat-jsl-3 bat-rplp-1 fi-elk-e7500 bat-dg2-11 fi-bsw-nick fi-kbl-7567u bat-dg1-7 bat-kbl-2 bat-adlp-9 fi-skl-guc fi-cfl-8700k fi-glk-j4005 bat-jsl-1 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7178 -&gt; IGTPW_8554</li>
<li>Linux: CI_DRM_12798 -&gt; CI_DRM_12801</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12798: 6c2064dddd9ef900a337f7bbbfa2d5c712950242 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_12801: 6695d34a4e09a2371e6ad8a2ea8644bfa901744e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8554: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8554/index.html<br />
  IGT_7178: ffe3f6670b91ab975f90799ab3fd0941b6eae019 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 0 lines<br />
--- 789 lines</p>

</body>
</html>

--===============9089277000939670519==--
