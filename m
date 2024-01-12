Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7520309334897597767=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fexec=5Freset?=
 =?utf-8?q?=3A_Do_not_validate_data_on_GT_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Fri, 12 Jan 2024 17:10:08 -0000
Message-ID: <170507940839.332901.16526166239565383237@5338d5abeb45>
References: <20240112154611.1395699-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240112154611.1395699-1-jonathan.cavitt@intel.com>
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

--===============7520309334897597767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_reset: Do not validate data on GT reset
URL   : https://patchwork.freedesktop.org/series/128730/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7672_BAT -> XEIGTPW_10526_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10526_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_exec_compute_mode} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10526/bat-dg2-oem2/igt@xe_exec_compute_mode.html

  
New tests
---------

  New tests have been introduced between XEIGT_7672_BAT and XEIGTPW_10526_BAT:

### New IGT tests (1) ###

  * igt@xe_exec_compute_mode:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7672 -> IGTPW_10526

  IGTPW_10526: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10526/index.html
  IGT_7672: 16d7484a28cc1aaf2dfb9e9c73c011daf602d926 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-624-7a20187068bed91b523795a18219e570f1e84eb1: 7a20187068bed91b523795a18219e570f1e84eb1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10526/index.html

--===============7520309334897597767==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_reset: Do not validate data on GT reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128730/">https://patchwork.freedesktop.org/series/128730/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10526/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10526/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7672_BAT -&gt; XEIGTPW_10526_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10526_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_exec_compute_mode} (NEW):<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10526/bat-dg2-oem2/igt@xe_exec_compute_mode.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7672_BAT and XEIGTPW_10526_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_exec_compute_mode:<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7672 -&gt; IGTPW_10526</li>
</ul>
<p>IGTPW_10526: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10526/index.html<br />
  IGT_7672: 16d7484a28cc1aaf2dfb9e9c73c011daf602d926 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-624-7a20187068bed91b523795a18219e570f1e84eb1: 7a20187068bed91b523795a18219e570f1e84eb1</p>

</body>
</html>

--===============7520309334897597767==--
