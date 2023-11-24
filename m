Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7916363054898300843=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Fri, 24 Nov 2023 11:43:02 -0000
Message-ID: <170082618263.13023.13237056605872279721@emeril.freedesktop.org>
References: <20220422002230.19535-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220422002230.19535-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/in?=
 =?utf-8?q?tel/kms=5Fpm=5Fdc=3A_Fix_dc9-dpms_test_on_LNL_=28rev2=29?=
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

--===============7916363054898300843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Fix dc9-dpms test on LNL (rev2)
URL   : https://patchwork.freedesktop.org/series/126834/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7601_BAT -> XEIGTPW_10261_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10261_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7601/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#288]) +17 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [INCOMPLETE][4] ([Intel XE#764]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7601/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764


Build changes
-------------

  * IGT: IGT_7601 -> IGTPW_10261

  IGTPW_10261: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10261/index.html
  IGT_7601: 9c6e7f255724e327627be7c8ed30e23742e97386 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992: 1832821c7e4c5bd24353183f060f1435b2eb7992

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/index.html

--===============7916363054898300843==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Fix dc9-dpms test on LNL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126834/">https://patchwork.freedesktop.org/series/126834/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7601_BAT -&gt; XEIGTPW_10261_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10261_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7601/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7601/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10261/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7601 -&gt; IGTPW_10261</li>
</ul>
<p>IGTPW_10261: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10261/index.html<br />
  IGT_7601: 9c6e7f255724e327627be7c8ed30e23742e97386 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992: 1832821c7e4c5bd24353183f060f1435b2eb7992</p>

</body>
</html>

--===============7916363054898300843==--
