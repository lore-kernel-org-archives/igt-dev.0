Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8808049930041393411=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Date: Fri, 17 Nov 2023 17:15:06 -0000
Message-ID: <170024130646.7874.12511043758170676110@emeril.freedesktop.org>
References: <20231116234312.3045053-1-jonathan.cavitt@intel.com>
In-Reply-To: <20231116234312.3045053-1-jonathan.cavitt@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/in?=
 =?utf-8?q?tel=3A_Do_not_error_on_-ECANCELED_in_xe=5Fvm_tests_=28rev2=29?=
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

--===============8808049930041393411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Do not error on -ECANCELED in xe_vm tests (rev2)
URL   : https://patchwork.freedesktop.org/series/126563/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7593_BAT -> XEIGTPW_10210_BAT
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

  Here are the changes found in XEIGTPW_10210_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
    - bat-pvc-2:          [WARN][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
    - bat-adlp-7:         [WARN][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-adlp-7/igt@xe_create@create-execqueues-leak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-adlp-7/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-dg2-oem2:       [WARN][7] -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [FAIL][9] -> [PASS][10] +114 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [FAIL][11] -> [PASS][12] +132 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [FAIL][13] -> [PASS][14] +163 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [FAIL][15] -> [PASS][16] +144 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [FAIL][17] -> [FAIL][18] ([Intel XE#692])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-dg2-oem2:       [FAIL][19] -> [FAIL][20] ([i915#2346])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-plain-flip:
    - bat-dg2-oem2:       [FAIL][21] -> [SKIP][22] ([i915#4098])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@kms_flip@basic-plain-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@kms_flip@basic-plain-flip.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][23] -> [FAIL][24] ([Intel XE#616] / [Intel XE#750])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][25] -> [FAIL][26] ([Intel XE#400] / [Intel XE#616]) +2 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [FAIL][27] -> [DMESG-FAIL][28] ([Intel XE#482]) +3 other tests dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/692
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098


Build changes
-------------

  * IGT: IGT_7593 -> IGTPW_10210
  * Linux: xe-501-33775eb43af96503d06773d54d4718cd486427f3 -> xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d

  IGTPW_10210: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/index.html
  IGT_7593: 9e0160a387768ffdffbd429c948eea8c5821ce4b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-501-33775eb43af96503d06773d54d4718cd486427f3: 33775eb43af96503d06773d54d4718cd486427f3
  xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d: 3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/index.html

--===============8808049930041393411==
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
<tr><td><b>Series:</b></td><td>tests/intel: Do not error on -ECANCELED in xe_vm tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126563/">https://patchwork.freedesktop.org/series/126563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7593_BAT -&gt; XEIGTPW_10210_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10210_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> +114 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> +132 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> +163 other tests pass</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> +144 other tests pass</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/692">Intel XE#692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@kms_flip@basic-plain-flip.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7593/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10210/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7593 -&gt; IGTPW_10210</li>
<li>Linux: xe-501-33775eb43af96503d06773d54d4718cd486427f3 -&gt; xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d</li>
</ul>
<p>IGTPW_10210: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/index.html<br />
  IGT_7593: 9e0160a387768ffdffbd429c948eea8c5821ce4b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-501-33775eb43af96503d06773d54d4718cd486427f3: 33775eb43af96503d06773d54d4718cd486427f3<br />
  xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d: 3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d</p>

</body>
</html>

--===============8808049930041393411==--
