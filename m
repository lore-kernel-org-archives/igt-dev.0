Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3994293621991276742=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 22 Nov 2023 20:46:34 -0000
Message-ID: <170068599443.4726.10463128184424668071@emeril.freedesktop.org>
References: <20231122144406.6-1-francois.dugast@intel.com>
In-Reply-To: <20231122144406.6-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_uAPI_Ali?=
 =?utf-8?q?gnment_-_Cleanup_and_future_proof_=28rev3=29?=
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

--===============3994293621991276742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - Cleanup and future proof (rev3)
URL   : https://patchwork.freedesktop.org/series/126537/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7597_BAT -> XEIGTPW_10245_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10245_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10245_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10245_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@too-wide:
    - bat-dg2-oem2:       [PASS][1] -> [WARN][2] +7 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] +25 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - bat-atsm-2:         [PASS][5] -> [SKIP][6] +25 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +78 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][9] -> [CRASH][10] +5 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-atsm-2:         [PASS][11] -> [CRASH][12] +5 other tests crash
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][13] -> [FAIL][14] +91 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][15] -> [FAIL][16] +165 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][17] -> [FAIL][18] +32 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  * igt@xe_vm@munmap-style-unbind-front:
    - bat-pvc-2:          [PASS][19] -> [SKIP][20] +16 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_vm@munmap-style-unbind-front.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_vm@munmap-style-unbind-front.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#624]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][23] ([Intel XE#609]) -> [FAIL][24] +2 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][25] ([Intel XE#609]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][27] ([Intel XE#423]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][29] ([Intel XE#608]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [DMESG-FAIL][31] ([Intel XE#282] / [i915#2017]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][33] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][34] +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][35] ([Intel XE#936]) -> [SKIP][36] +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
    - bat-adlp-7:         [SKIP][37] ([Intel XE#261] / [Intel XE#688]) -> [FAIL][38] +15 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][39] ([Intel XE#482]) -> [SKIP][40] +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][41] ([Intel XE#288]) -> [FAIL][42] +17 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][43] ([Intel XE#263]) -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_mmap@vram.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_mmap@vram.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [PASS][45] -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
    - bat-pvc-2:          [PASS][47] -> [WARN][48] +1 other test warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][49] ([Intel XE#524]) -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-dg2-oem2:       [PASS][51] -> [FAIL][52] +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][53] ([Intel XE#524]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-atsm-2:         [PASS][55] -> [SKIP][56] +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-pvc-2:          [INCOMPLETE][57] ([Intel XE#392]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-overcommit-simple}:
    - bat-pvc-2:          [PASS][59] -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-simple.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-simple.html
    - bat-dg2-oem2:       [PASS][61] -> [SKIP][62] +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html
    - bat-adlp-7:         [SKIP][63] ([Intel XE#688]) -> [FAIL][64] +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:
    - bat-adlp-7:         [SKIP][65] ([Intel XE#288]) -> [FAIL][66] +14 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][67] -> [FAIL][68] +26 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][69] -> [FAIL][70] +16 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#936]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/936
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * IGT: IGT_7597 -> IGTPW_10245

  IGTPW_10245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10245/index.html
  IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc: 59f2e73469cace9c78aab7506284ae446d57b8bc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/index.html

--===============3994293621991276742==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - Cleanup and future proof (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126537/">https://patchwork.freedesktop.org/series/126537/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7597_BAT -&gt; XEIGTPW_10245_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10245_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10245_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10245_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +78 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">CRASH</a> +5 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">CRASH</a> +5 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +91 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +165 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_vm@munmap-style-unbind-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_vm@munmap-style-unbind-front.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/936">Intel XE#936</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +15 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_evict@evict-small-cm.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a></li>
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
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">WARN</a> +1 other test warn</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-simple}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10245/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7597 -&gt; IGTPW_10245</li>
</ul>
<p>IGTPW_10245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10245/index.html<br />
  IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc: 59f2e73469cace9c78aab7506284ae446d57b8bc</p>

</body>
</html>

--===============3994293621991276742==--
