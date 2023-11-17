Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5918937617245427478=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 17 Nov 2023 19:53:18 -0000
Message-ID: <170025079853.7873.4601783187079975154@emeril.freedesktop.org>
References: <20231116145348.7-1-francois.dugast@intel.com>
In-Reply-To: <20231116145348.7-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_uAPI_Ali?=
 =?utf-8?q?gnment_-_Cleanup_and_future_proof_=28rev2=29?=
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

--===============5918937617245427478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - Cleanup and future proof (rev2)
URL   : https://patchwork.freedesktop.org/series/126537/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7594_BAT -> XEIGTPW_10212_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10212_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10212_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10212_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@too-wide:
    - bat-dg2-oem2:       [PASS][1] -> [WARN][2] +7 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] +86 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][5] -> [CRASH][6] +5 other tests crash
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-atsm-2:         [PASS][7] -> [CRASH][8] +5 other tests crash
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] +105 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][11] -> [FAIL][12] +164 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][13] -> [FAIL][14] +48 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  * {igt@xe_query@query-gt} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_query@query-gt.html

  * igt@xe_vm@munmap-style-unbind-front:
    - bat-pvc-2:          [PASS][16] -> [SKIP][17] +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_vm@munmap-style-unbind-front.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_vm@munmap-style-unbind-front.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - bat-atsm-2:         [PASS][18] -> [SKIP][19] +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_vm@munmap-style-unbind-one-partial.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_vm@munmap-style-unbind-one-partial.html
    - bat-dg2-oem2:       [PASS][20] -> [SKIP][21] +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][22] ([Intel XE#624]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][24] ([Intel XE#609]) -> [FAIL][25] +2 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][26] ([Intel XE#609]) -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][28] ([Intel XE#423]) -> [FAIL][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][30] ([Intel XE#480]) -> [FAIL][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [FAIL][32] ([Intel XE#480]) -> [FAIL][33] +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][34] ([Intel XE#608]) -> [FAIL][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [DMESG-FAIL][36] ([Intel XE#282] / [i915#2017]) -> [FAIL][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][38] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][39] +2 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-adlp-7:         [SKIP][40] ([Intel XE#261] / [Intel XE#688]) -> [FAIL][41] +15 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][42] ([Intel XE#482]) -> [FAIL][43] +3 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][44] ([Intel XE#288]) -> [FAIL][45] +17 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][46] ([Intel XE#263]) -> [FAIL][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_mmap@vram.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_mmap@vram.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-pvc-2:          [PASS][48] -> [WARN][49] +1 other test warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][50] ([Intel XE#524]) -> [FAIL][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][52] ([Intel XE#524]) -> [FAIL][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-atsm-2:         [PASS][54] -> [FAIL][55] +2 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-pvc-2:          [INCOMPLETE][56] ([Intel XE#392]) -> [FAIL][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-overcommit-simple}:
    - bat-dg2-oem2:       [PASS][58] -> [FAIL][59] +3 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html
    - bat-adlp-7:         [SKIP][60] ([Intel XE#688]) -> [FAIL][61] +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:
    - bat-adlp-7:         [SKIP][62] ([Intel XE#288]) -> [FAIL][63] +14 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][64] -> [FAIL][65] +27 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][66] -> [FAIL][67] +15 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
New tests
---------

  New tests have been introduced between XEIGT_7594_BAT and XEIGTPW_10212_BAT:

### New IGT tests (1) ###

  * igt@xe_query@query-gt:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.0] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * IGT: IGT_7594 -> IGTPW_10212
  * Linux: xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d -> xe-503-eba8bfb1dc87535362e28de282addc8752204df4

  IGTPW_10212: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10212/index.html
  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d: 3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d
  xe-503-eba8bfb1dc87535362e28de282addc8752204df4: eba8bfb1dc87535362e28de282addc8752204df4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/index.html

--===============5918937617245427478==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - Cleanup and future proof (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126537/">https://patchwork.freedesktop.org/series/126537/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7594_BAT -&gt; XEIGTPW_10212_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10212_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10212_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10212_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +86 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">CRASH</a> +5 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">CRASH</a> +5 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +105 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +164 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +48 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_query@query-gt} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_query@query-gt.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_vm@munmap-style-unbind-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_vm@munmap-style-unbind-front.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_vm@munmap-style-unbind-one-partial.html">SKIP</a> +8 other tests skip</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html">SKIP</a> +8 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a></li>
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
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">WARN</a> +1 other test warn</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-simple}:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html">FAIL</a> +3 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7594/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10212/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7594_BAT and XEIGTPW_10212_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_query@query-gt:<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7594 -&gt; IGTPW_10212</li>
<li>Linux: xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d -&gt; xe-503-eba8bfb1dc87535362e28de282addc8752204df4</li>
</ul>
<p>IGTPW_10212: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10212/index.html<br />
  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d: 3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d<br />
  xe-503-eba8bfb1dc87535362e28de282addc8752204df4: eba8bfb1dc87535362e28de282addc8752204df4</p>

</body>
</html>

--===============5918937617245427478==--
