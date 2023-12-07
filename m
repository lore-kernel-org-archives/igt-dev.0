Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2798417278854644464=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 07 Dec 2023 07:36:52 -0000
Message-ID: <170193461239.28722.6546047239196077454@emeril.freedesktop.org>
References: <20231207060351.438855-1-matthew.brost@intel.com>
In-Reply-To: <20231207060351.438855-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Syncs_vs?=
 =?utf-8?q?_async_exec/bind_uAPI_change?=
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

--===============2798417278854644464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Syncs vs async exec/bind uAPI change
URL   : https://patchwork.freedesktop.org/series/127473/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7626_BAT -> XEIGTPW_10363_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10363_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10363_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10363_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +287 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-pvc-2:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde:
    - bat-pvc-2:          [PASS][5] -> [FAIL][6] +1204 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde.html

  * igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] +776 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde.html

  * igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde:
    - bat-atsm-2:         [PASS][9] -> [FAIL][10] +718 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-atsm-2/igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [FAIL][11] ([i915#2346]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][15] ([Intel XE#482]) -> [FAIL][16] +3 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][17] ([Intel XE#1000]) -> [FAIL][18] +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-pvc-2:          [INCOMPLETE][19] ([Intel XE#392]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#288]) -> [FAIL][22] +32 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][23] ([Intel XE#288]) -> [FAIL][24] +32 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][25] ([Intel XE#288]) -> [FAIL][26] +32 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10363_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@prime-external-import-coh:
    - bat-adlp-7:         [PASS][27] -> [FAIL][28] ([Intel XE#984]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html
    - bat-dg2-oem2:       [PASS][29] -> [FAIL][30] ([Intel XE#984]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html
    - bat-atsm-2:         [PASS][31] -> [FAIL][32] ([Intel XE#984]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html

  * igt@xe_pat@userptr-coh-none:
    - bat-pvc-2:          [PASS][33] -> [FAIL][34] ([Intel XE#984]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_pat@userptr-coh-none.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_pat@userptr-coh-none.html

  
#### Possible fixes ####

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][35] ([Intel XE#999]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#984]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/984
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7626 -> IGTPW_10363
  * Linux: xe-556-d33ebd7511c2b53c5dc006e2daa25214fc8a5921 -> xe-557-668d13abebbbc3812de86be1f8477475e1d90728

  IGTPW_10363: 10363
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-556-d33ebd7511c2b53c5dc006e2daa25214fc8a5921: d33ebd7511c2b53c5dc006e2daa25214fc8a5921
  xe-557-668d13abebbbc3812de86be1f8477475e1d90728: 668d13abebbbc3812de86be1f8477475e1d90728

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/index.html

--===============2798417278854644464==
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
<tr><td><b>Series:</b></td><td>Syncs vs async exec/bind uAPI change</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127473/">https://patchwork.freedesktop.org/series/127473/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7626_BAT -&gt; XEIGTPW_10363_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10363_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10363_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10363_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +287 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt-system-system-wc-c1-wt-single-pde.html">FAIL</a> +1204 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render-vram01-system-uc-uc-mixed-pde.html">FAIL</a> +776 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-atsm-2/igt@xe_pat@pat-index-xelp@render-vram01-vram01-uc-wb-single-pde.html">FAIL</a> +718 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10363_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_pat@prime-external-import-coh:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/984">Intel XE#984</a>) +1 other test fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/984">Intel XE#984</a>) +1 other test fail</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/984">Intel XE#984</a>) +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_pat@userptr-coh-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-pvc-2/igt@xe_pat@userptr-coh-none.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/984">Intel XE#984</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_fd_dup:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10363/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7626 -&gt; IGTPW_10363</li>
<li>Linux: xe-556-d33ebd7511c2b53c5dc006e2daa25214fc8a5921 -&gt; xe-557-668d13abebbbc3812de86be1f8477475e1d90728</li>
</ul>
<p>IGTPW_10363: 10363<br />
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-556-d33ebd7511c2b53c5dc006e2daa25214fc8a5921: d33ebd7511c2b53c5dc006e2daa25214fc8a5921<br />
  xe-557-668d13abebbbc3812de86be1f8477475e1d90728: 668d13abebbbc3812de86be1f8477475e1d90728</p>

</body>
</html>

--===============2798417278854644464==--
