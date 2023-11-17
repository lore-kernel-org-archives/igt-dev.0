Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8446029341863490092=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 17 Nov 2023 19:19:27 -0000
Message-ID: <170024876747.7876.6291891047342146626@emeril.freedesktop.org>
References: <20231117155802.100269-1-swati2.sharma@intel.com>
In-Reply-To: <20231117155802.100269-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/km?=
 =?utf-8?q?s=5Ffeature=5Fdiscovery=3A_update_display-1x?=
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

--===============8446029341863490092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_feature_discovery: update display-1x
URL   : https://patchwork.freedesktop.org/series/126591/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7594_BAT -> XEIGTPW_10211_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10211_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10211_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10211_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] +100 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][5] -> [FAIL][6] +104 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] +156 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +105 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#480]) -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#480]) -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][15] ([Intel XE#282] / [i915#2017]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][17] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][18] +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][19] ([Intel XE#482]) -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [PASS][21] -> [WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
    - bat-pvc-2:          [PASS][23] -> [WARN][24] +1 other test warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
    - bat-adlp-7:         [PASS][25] -> [WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_create@create-execqueues-leak.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][27] ([Intel XE#524]) -> [WARN][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-dg2-oem2:       [PASS][29] -> [WARN][30] +1 other test warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][31] ([Intel XE#524]) -> [WARN][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [INCOMPLETE][33] ([Intel XE#392]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][35] -> [FAIL][36] +13 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][37] -> [FAIL][38] +13 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][39] -> [FAIL][40] +27 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][41] -> [FAIL][42] +11 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * IGT: IGT_7594 -> IGTPW_10211
  * Linux: xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d -> xe-503-eba8bfb1dc87535362e28de282addc8752204df4

  IGTPW_10211: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10211/index.html
  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d: 3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d
  xe-503-eba8bfb1dc87535362e28de282addc8752204df4: eba8bfb1dc87535362e28de282addc8752204df4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/index.html

--===============8446029341863490092==
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
<tr><td><b>Series:</b></td><td>tests/kms_feature_discovery: update display-1x</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126591/">https://patchwork.freedesktop.org/series/126591/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7594_BAT -&gt; XEIGTPW_10211_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10211_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10211_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10211_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +100 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +104 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +156 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +105 other tests fail</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">WARN</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">WARN</a> +1 other test warn</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">WARN</a> +1 other test warn</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10211/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7594 -&gt; IGTPW_10211</li>
<li>Linux: xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d -&gt; xe-503-eba8bfb1dc87535362e28de282addc8752204df4</li>
</ul>
<p>IGTPW_10211: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10211/index.html<br />
  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d: 3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d<br />
  xe-503-eba8bfb1dc87535362e28de282addc8752204df4: eba8bfb1dc87535362e28de282addc8752204df4</p>

</body>
</html>

--===============8446029341863490092==--
