Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3333713270213308958=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 21 Nov 2023 07:19:06 -0000
Message-ID: <170055114672.30157.4278620698986109786@emeril.freedesktop.org>
References: <20231121055900.1967991-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231121055900.1967991-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/in?=
 =?utf-8?q?tel/kms=5Fbig=5Fjoiner=3A_Fix_dangling_pointer?=
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

--===============3333713270213308958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_big_joiner: Fix dangling pointer
URL   : https://patchwork.freedesktop.org/series/126688/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7595_BAT -> XEIGTPW_10223_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10223_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10223_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 2)
------------------------------

  Missing    (2): bat-dg2-oem2 bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10223_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10223_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_guc_pc@freq_basic_api:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] ([Intel XE#935])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] ([Intel XE#935])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/935


Build changes
-------------

  * IGT: IGT_7595 -> IGTPW_10223
  * Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -> xe-510-f8f8df78c3736da3512ee2e720181cb0fc29599b

  IGTPW_10223: 10223
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23
  xe-510-f8f8df78c3736da3512ee2e720181cb0fc29599b: f8f8df78c3736da3512ee2e720181cb0fc29599b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/index.html

--===============3333713270213308958==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_big_joiner: Fix dangling pointer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126688/">https://patchwork.freedesktop.org/series/126688/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7595_BAT -&gt; XEIGTPW_10223_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10223_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10223_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 2)</h2>
<p>Missing    (2): bat-dg2-oem2 bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10223_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_guc_pc@freq_fixed_idle:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10223_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10223/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7595 -&gt; IGTPW_10223</li>
<li>Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -&gt; xe-510-f8f8df78c3736da3512ee2e720181cb0fc29599b</li>
</ul>
<p>IGTPW_10223: 10223<br />
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23<br />
  xe-510-f8f8df78c3736da3512ee2e720181cb0fc29599b: f8f8df78c3736da3512ee2e720181cb0fc29599b</p>

</body>
</html>

--===============3333713270213308958==--
