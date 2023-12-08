Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0603780576565037760=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/3=5D_tests/intel/xe=3A_Align_change_in_the_name_of_frequency?=
 =?utf-8?q?_sysfs_attributes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Dec 2023 07:54:42 -0000
Message-ID: <170202208272.7325.2353669704124530071@emeril.freedesktop.org>
References: <20231208051230.664226-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231208051230.664226-1-rodrigo.vivi@intel.com>
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

--===============0603780576565037760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/intel/xe: Align change in the name of frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/127545/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7628_BAT -> XEIGTPW_10376_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_10376_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_gt_freq@freq_basic_api} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][1] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][2] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html
    - bat-pvc-2:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html

  * {igt@xe_gt_freq@freq_fixed_idle} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][4] +2 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html
    - bat-pvc-2:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html

  
New tests
---------

  New tests have been introduced between XEIGT_7628_BAT and XEIGTPW_10376_BAT:

### New IGT tests (3) ###

  * igt@xe_gt_freq@freq_basic_api:
    - Statuses : 4 fail(s)
    - Exec time: [0.02, 0.09] s

  * igt@xe_gt_freq@freq_fixed_idle:
    - Statuses : 3 fail(s) 1 skip(s)
    - Exec time: [0.02, 1.06] s

  * igt@xe_gt_freq@freq_range_idle:
    - Statuses : 3 fail(s) 1 skip(s)
    - Exec time: [0.01, 1.08] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10376_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-adlp-7:         [FAIL][6] ([i915#2346]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7628/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][8] ([Intel XE#480]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7628/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7628 -> IGTPW_10376
  * Linux: xe-558-2a7dcf14d4abe82a88d846a3bf875e0611d83b04 -> xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c

  IGTPW_10376: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10376/index.html
  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-558-2a7dcf14d4abe82a88d846a3bf875e0611d83b04: 2a7dcf14d4abe82a88d846a3bf875e0611d83b04
  xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c: ca0510637dca8ce9658a2797626a2a558025ec3c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/index.html

--===============0603780576565037760==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/intel/xe: Align change in the name of frequency sysfs attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127545/">https://patchwork.freedesktop.org/series/127545/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7628_BAT -&gt; XEIGTPW_10376_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10376_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_gt_freq@freq_basic_api} (NEW):</p>
<ul>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_fixed_idle} (NEW):</p>
<ul>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7628_BAT and XEIGTPW_10376_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.02, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>Statuses : 3 fail(s) 1 skip(s)</li>
<li>Exec time: [0.02, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>Statuses : 3 fail(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.08] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10376_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7628/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7628/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10376/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7628 -&gt; IGTPW_10376</li>
<li>Linux: xe-558-2a7dcf14d4abe82a88d846a3bf875e0611d83b04 -&gt; xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c</li>
</ul>
<p>IGTPW_10376: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10376/index.html<br />
  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-558-2a7dcf14d4abe82a88d846a3bf875e0611d83b04: 2a7dcf14d4abe82a88d846a3bf875e0611d83b04<br />
  xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c: ca0510637dca8ce9658a2797626a2a558025ec3c</p>

</body>
</html>

--===============0603780576565037760==--
