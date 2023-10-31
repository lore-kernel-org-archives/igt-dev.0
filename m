Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4245075926794756945=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 31 Oct 2023 14:22:31 -0000
Message-ID: <169876215127.27660.17802537918745162719@emeril.freedesktop.org>
References: <20231030160804.4083739-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231030160804.4083739-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/inte?=
 =?utf-8?q?l=5Faux=5Fpgtable=3A_Add_XE_support_for_pagetable_mapping_=28re?=
 =?utf-8?b?djIp?=
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

--===============4245075926794756945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_aux_pgtable: Add XE support for pagetable mapping (rev2)
URL   : https://patchwork.freedesktop.org/series/125766/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7566_BAT -> XEIGTPW_10095_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 2)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_10095_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#855]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10095/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/855


Build changes
-------------

  * IGT: IGT_7566 -> IGTPW_10095
  * Linux: xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700 -> xe-458-87f169fc90d74a88df33e0b34c02240308625a99

  IGTPW_10095: 10095
  IGT_7566: 7566
  xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700: d7eb9a5c3acda8d87699bc82add7e8d88f5f4700
  xe-458-87f169fc90d74a88df33e0b34c02240308625a99: 87f169fc90d74a88df33e0b34c02240308625a99

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10095/index.html

--===============4245075926794756945==
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
<tr><td><b>Series:</b></td><td>lib/intel_aux_pgtable: Add XE support for pagetable mapping (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125766/">https://patchwork.freedesktop.org/series/125766/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10095/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10095/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7566_BAT -&gt; XEIGTPW_10095_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 2)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10095_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7566/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/855">Intel XE#855</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10095/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7566 -&gt; IGTPW_10095</li>
<li>Linux: xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700 -&gt; xe-458-87f169fc90d74a88df33e0b34c02240308625a99</li>
</ul>
<p>IGTPW_10095: 10095<br />
  IGT_7566: 7566<br />
  xe-456-d7eb9a5c3acda8d87699bc82add7e8d88f5f4700: d7eb9a5c3acda8d87699bc82add7e8d88f5f4700<br />
  xe-458-87f169fc90d74a88df33e0b34c02240308625a99: 87f169fc90d74a88df33e0b34c02240308625a99</p>

</body>
</html>

--===============4245075926794756945==--
