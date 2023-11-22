Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2838626555605119364=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Date: Wed, 22 Nov 2023 19:03:47 -0000
Message-ID: <170067982738.4725.455476723670779649@emeril.freedesktop.org>
References: <20231122130021.20536-1-lukasz.laguna@intel.com>
In-Reply-To: <20231122130021.20536-1-lukasz.laguna@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIENJLnhlQkFUOiBzdWNjZXNzIGZvciB4ZS94ZV9x?=
 =?utf-8?q?uery=3A_add_media_GT_presence_checker?=
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

--===============2838626555605119364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/xe_query: add media GT presence checker
URL   : https://patchwork.freedesktop.org/series/126762/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7596_BAT -> XEIGTPW_10243_BAT
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

  Here are the changes found in XEIGTPW_10243_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][5] ([Intel XE#939]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [DMESG-WARN][7] ([Intel XE#939]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#935]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [FAIL][11] ([Intel XE#935]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#935]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
    - bat-atsm-2:         [FAIL][15] ([Intel XE#935]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-atsm-2:         [FAIL][17] ([Intel XE#940]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
    - bat-dg2-oem2:       [FAIL][19] ([Intel XE#940]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-adlp-7:         [FAIL][21] ([Intel XE#940]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/935
  [Intel XE#939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/939
  [Intel XE#940]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/940


Build changes
-------------

  * IGT: IGT_7596 -> IGTPW_10243
  * Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -> xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc

  IGTPW_10243: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10243/index.html
  IGT_7596: 9179b4310586865a1308634c22f19f7ebca98f61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9
  xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc: 59f2e73469cace9c78aab7506284ae446d57b8bc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/index.html

--===============2838626555605119364==
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
<tr><td><b>Series:</b></td><td>xe/xe_query: add media GT presence checker</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126762/">https://patchwork.freedesktop.org/series/126762/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7596_BAT -&gt; XEIGTPW_10243_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10243_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7596/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10243/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7596 -&gt; IGTPW_10243</li>
<li>Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -&gt; xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc</li>
</ul>
<p>IGTPW_10243: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10243/index.html<br />
  IGT_7596: 9179b4310586865a1308634c22f19f7ebca98f61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9<br />
  xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc: 59f2e73469cace9c78aab7506284ae446d57b8bc</p>

</body>
</html>

--===============2838626555605119364==--
