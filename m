Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4090450644959307292=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@intel.com>
Date: Wed, 22 Nov 2023 11:36:47 -0000
Message-ID: <170065300700.4728.661861197989045770@emeril.freedesktop.org>
References: <20231122101951.6568-1-marcin.bernatowicz@intel.com>
In-Reply-To: <20231122101951.6568-1-marcin.bernatowicz@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIENJLnhlQkFUOiBzdWNjZXNzIGZvciB4ZV9jcmVh?=
 =?utf-8?q?te=3A_create-big-vram_subtest_=28rev3=29?=
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

--===============4090450644959307292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_create: create-big-vram subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/126347/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7595_BAT -> XEIGTPW_10235_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 

Known issues
------------

  Here are the changes found in XEIGTPW_10235_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#939])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#935])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [PASS][5] -> [FAIL][6] ([Intel XE#935])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
    - bat-atsm-2:         [PASS][7] -> [FAIL][8] ([Intel XE#935])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-atsm-2:         [PASS][9] -> [FAIL][10] ([Intel XE#940]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-adlp-7:         [PASS][11] -> [FAIL][12] ([Intel XE#940]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-adlp-7:         [FAIL][13] ([i915#2346]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][15] ([Intel XE#524]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/935
  [Intel XE#939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/939
  [Intel XE#940]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/940
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7595 -> IGTPW_10235
  * Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -> xe-515-a9ee4928479a5449991149cc38747e8e20376db9

  IGTPW_10235: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10235/index.html
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/index.html

--===============4090450644959307292==
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
<tr><td><b>Series:</b></td><td>xe_create: create-big-vram subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126347/">https://patchwork.freedesktop.org/series/126347/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7595_BAT -&gt; XEIGTPW_10235_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10235_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10235/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7595 -&gt; IGTPW_10235</li>
<li>Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -&gt; xe-515-a9ee4928479a5449991149cc38747e8e20376db9</li>
</ul>
<p>IGTPW_10235: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10235/index.html<br />
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23<br />
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9</p>

</body>
</html>

--===============4090450644959307292==--
