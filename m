Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1964601573641615058=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Extend_xe=5Fquery_to_multi-?=
 =?utf-8?q?GPU?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 15 Dec 2023 20:20:16 -0000
Message-ID: <170267161648.27833.15732127543723668190@emeril.freedesktop.org>
References: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
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

--===============1964601573641615058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend xe_query to multi-GPU
URL   : https://patchwork.freedesktop.org/series/127887/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14033 -> IGTPW_10430
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10430 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10430, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html

Participating hosts (38 -> 15)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_10430 prevented too many machines from booting.

  Missing    (23): fi-rkl-11600 fi-apl-guc fi-snb-2520m bat-rpls-3 fi-pnv-d510 bat-rpls-2 fi-bsw-n3050 bat-adlm-1 bat-dg2-9 fi-ilk-650 bat-adln-1 fi-ivb-3770 bat-rplp-1 bat-dg2-11 fi-bsw-nick bat-dg1-7 bat-kbl-2 bat-adlp-9 bat-jsl-1 fi-tgl-1115g4 fi-cfl-guc fi-kbl-x1275 bat-dg2-14 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7643 -> IGTPW_10430

  CI-20190529: 20190529
  CI_DRM_14033: e6580f88bbde08a04d0cb7bb591c38e7b9f0076d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html
  IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_query@multigpu-query-config
+igt@xe_query@multigpu-query-cs-cycles
+igt@xe_query@multigpu-query-engines
+igt@xe_query@multigpu-query-gt-list
+igt@xe_query@multigpu-query-hwconfig
+igt@xe_query@multigpu-query-invalid-cs-cycles
+igt@xe_query@multigpu-query-invalid-extension
+igt@xe_query@multigpu-query-invalid-query
+igt@xe_query@multigpu-query-invalid-size
+igt@xe_query@multigpu-query-mem-usage
+igt@xe_query@multigpu-query-topology
+igt@xe_uevent@fake_reset_uevent_listener
-igt@xe_waitfence@exec_queue-reset-wait

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html

--===============1964601573641615058==
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
<tr><td><b>Series:</b></td><td>Extend xe_query to multi-GPU</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127887/">https://patchwork.freedesktop.org/series/127887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14033 -&gt; IGTPW_10430</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10430 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10430, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html</p>
<h2>Participating hosts (38 -&gt; 15)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_10430 prevented too many machines from booting.</p>
<p>Missing    (23): fi-rkl-11600 fi-apl-guc fi-snb-2520m bat-rpls-3 fi-pnv-d510 bat-rpls-2 fi-bsw-n3050 bat-adlm-1 bat-dg2-9 fi-ilk-650 bat-adln-1 fi-ivb-3770 bat-rplp-1 bat-dg2-11 fi-bsw-nick bat-dg1-7 bat-kbl-2 bat-adlp-9 bat-jsl-1 fi-tgl-1115g4 fi-cfl-guc fi-kbl-x1275 bat-dg2-14 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7643 -&gt; IGTPW_10430</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14033: e6580f88bbde08a04d0cb7bb591c38e7b9f0076d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10430/index.html<br />
  IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_query@multigpu-query-config<br />
+igt@xe_query@multigpu-query-cs-cycles<br />
+igt@xe_query@multigpu-query-engines<br />
+igt@xe_query@multigpu-query-gt-list<br />
+igt@xe_query@multigpu-query-hwconfig<br />
+igt@xe_query@multigpu-query-invalid-cs-cycles<br />
+igt@xe_query@multigpu-query-invalid-extension<br />
+igt@xe_query@multigpu-query-invalid-query<br />
+igt@xe_query@multigpu-query-invalid-size<br />
+igt@xe_query@multigpu-query-mem-usage<br />
+igt@xe_query@multigpu-query-topology<br />
+igt@xe_uevent@fake_reset_uevent_listener<br />
-igt@xe_waitfence@exec_queue-reset-wait</p>

</body>
</html>

--===============1964601573641615058==--
