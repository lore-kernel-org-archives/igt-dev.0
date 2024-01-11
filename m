Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4089742615843024342=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_dsc+bigjoiner_subtest_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 11 Jan 2024 08:21:51 -0000
Message-ID: <170496131149.271298.14049283104265764512@5338d5abeb45>
References: <20240111073502.151340-1-swati2.sharma@intel.com>
In-Reply-To: <20240111073502.151340-1-swati2.sharma@intel.com>
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

--===============4089742615843024342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add dsc+bigjoiner subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/128266/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7668_BAT -> XEIGTPW_10509_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  Additional (1): bat-dg2-oem2 
  Missing    (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in XEIGTPW_10509_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([Intel XE#1136])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([i915#2575]) +52 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#1134]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#1130]) +184 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][5] ([Intel XE#1132])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575


Build changes
-------------

  * IGT: IGT_7668 -> IGTPW_10509
  * Linux: xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9 -> xe-617-bda9437030d914aefcbc145d3be1a9f5f05ea693

  IGTPW_10509: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10509/index.html
  IGT_7668: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9: bb9e8031d2feb59becdea41e54e62f1bc47f3ef9
  xe-617-bda9437030d914aefcbc145d3be1a9f5f05ea693: bda9437030d914aefcbc145d3be1a9f5f05ea693

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/index.html

--===============4089742615843024342==
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
<tr><td><b>Series:</b></td><td>Add dsc+bigjoiner subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128266/">https://patchwork.freedesktop.org/series/128266/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7668_BAT -&gt; XEIGTPW_10509_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>Additional (1): bat-dg2-oem2 <br />
  Missing    (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10509_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136">Intel XE#1136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +184 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10509/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132">Intel XE#1132</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7668 -&gt; IGTPW_10509</li>
<li>Linux: xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9 -&gt; xe-617-bda9437030d914aefcbc145d3be1a9f5f05ea693</li>
</ul>
<p>IGTPW_10509: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10509/index.html<br />
  IGT_7668: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9: bb9e8031d2feb59becdea41e54e62f1bc47f3ef9<br />
  xe-617-bda9437030d914aefcbc145d3be1a9f5f05ea693: bda9437030d914aefcbc145d3be1a9f5f05ea693</p>

</body>
</html>

--===============4089742615843024342==--
