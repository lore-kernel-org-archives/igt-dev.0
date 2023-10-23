Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0601378854554903850=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 23 Oct 2023 20:34:24 -0000
Message-ID: <169809326458.19838.13653721384366778304@emeril.freedesktop.org>
References: <20231019193321.90009-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231019193321.90009-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_flat?=
 =?utf-8?q?-ccs_tests_=28rev3=29?=
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

--===============0601378854554903850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add flat-ccs tests (rev3)
URL   : https://patchwork.freedesktop.org/series/124626/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7549_BAT -> XEIGTPW_10032_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10032_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10032/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
    - bat-adlp-7:         NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10032/bat-adlp-7/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  
New tests
---------

  New tests have been introduced between XEIGT_7549_BAT and XEIGTPW_10032_BAT:

### New IGT tests (2) ###

  * igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd:
    - Statuses : 1 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict_ccs@evict-ccs-overcommit-simple:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10032_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7549 -> IGTPW_10032

  IGTPW_10032: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10032/index.html
  IGT_7549: bc3314b187318a4238c6fae583770b389afa83c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-442-a0a80950176b39dbc76f8faa92fddf6caaa06191: a0a80950176b39dbc76f8faa92fddf6caaa06191

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10032/index.html

--===============0601378854554903850==
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
<tr><td><b>Series:</b></td><td>Add flat-ccs tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124626/">https://patchwork.freedesktop.org/series/124626/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10032/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10032/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7549_BAT -&gt; XEIGTPW_10032_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10032_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd} (NEW):</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10032/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10032/bat-adlp-7/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7549_BAT and XEIGTPW_10032_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-ccs-overcommit-simple:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10032_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7549 -&gt; IGTPW_10032</li>
</ul>
<p>IGTPW_10032: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10032/index.html<br />
  IGT_7549: bc3314b187318a4238c6fae583770b389afa83c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-442-a0a80950176b39dbc76f8faa92fddf6caaa06191: a0a80950176b39dbc76f8faa92fddf6caaa06191</p>

</body>
</html>

--===============0601378854554903850==--
