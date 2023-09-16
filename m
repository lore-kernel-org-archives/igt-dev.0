Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3962535693284403831=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 16 Sep 2023 02:25:49 -0000
Message-ID: <169483114921.10847.5490021400916287331@emeril.freedesktop.org>
References: <20230915233304.2241426-1-matthew.brost@intel.com>
In-Reply-To: <20230915233304.2241426-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_s?=
 =?utf-8?q?tarting_with_=5B1/3=5D_xe=5Fexec=5Fbalancer=3A_Enable_parallel_?=
 =?utf-8?q?submission_and_compute_mode?=
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

--===============3962535693284403831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] xe_exec_balancer: Enable parallel submission and compute mode
URL   : https://patchwork.freedesktop.org/series/123821/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7490_BAT -> XEIGTPW_9809_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9809_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9809_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9809_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9809_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] ([Intel XE#685])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#685])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/685


Build changes
-------------

  * IGT: IGT_7490 -> IGTPW_9809
  * Linux: xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63 -> xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d

  IGTPW_9809: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html
  IGT_7490: 7490
  xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63: 4a9681392cecd56a372d06b648f7b3a37fdd5c63
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/index.html

--===============3962535693284403831==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] xe_exec_balancer: Enable parallel submission and compute mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123821/">https://patchwork.freedesktop.org/series/123821/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7490_BAT -&gt; XEIGTPW_9809_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9809_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9809_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9809_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9809_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/685">Intel XE#685</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9809/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/685">Intel XE#685</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7490 -&gt; IGTPW_9809</li>
<li>Linux: xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63 -&gt; xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d</li>
</ul>
<p>IGTPW_9809: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html<br />
  IGT_7490: 7490<br />
  xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63: 4a9681392cecd56a372d06b648f7b3a37fdd5c63<br />
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d</p>

</body>
</html>

--===============3962535693284403831==--
