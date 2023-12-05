Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6945741708764693844=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Date: Tue, 05 Dec 2023 14:25:17 -0000
Message-ID: <170178631718.24285.11991045043018542795@emeril.freedesktop.org>
References: <20231205081618.18143-1-lukasz.laguna@intel.com>
In-Reply-To: <20231205081618.18143-1-lukasz.laguna@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Initial_?=
 =?utf-8?q?SR-IOV_validation_=28rev8=29?=
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

--===============6945741708764693844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial SR-IOV validation (rev8)
URL   : https://patchwork.freedesktop.org/series/126034/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7620_BAT -> XEIGTPW_10335_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10335_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10335_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10335_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][1] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [SKIP][2] ([Intel XE#688]) -> [FAIL][3] +3 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-pvc-2:          [FAIL][4] -> [SKIP][5] +32 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [FAIL][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_mmap@vram.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_mmap@vram.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10335_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([Intel XE#623])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][9] ([Intel XE#423])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][10] ([i915#5274])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][11] ([Intel XE#608])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][12] ([Intel XE#400] / [Intel XE#616]) +2 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_psr@psr_cursor_plane_move:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#929]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_psr@psr_cursor_plane_move.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][14] ([Intel XE#672])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][15] ([Intel XE#288]) +32 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][16] ([Intel XE#255])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][17] ([Intel XE#977])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][18] ([Intel XE#979]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xehpc@render-system-vram01-uc-wc-mixed-pde:
    - bat-pvc-2:          NOTRUN -> [SKIP][19] ([Intel XE#976]) +647 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render-system-vram01-uc-wc-mixed-pde.html

  
#### Possible fixes ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-pvc-2:          [WARN][20] -> [PASS][21] +1 other test pass
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_create@create-massive-size:
    - bat-atsm-2:         [FAIL][22] ([Intel XE#981]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_create@create-massive-size.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_create@create-massive-size.html
    - bat-pvc-2:          [FAIL][24] ([Intel XE#981]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_create@create-massive-size.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_create@create-massive-size.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [SKIP][26] ([Intel XE#688]) -> [PASS][27] +8 other tests pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [SKIP][28] ([Intel XE#688]) -> [PASS][29] +17 other tests pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-atsm-2:         [CRASH][30] -> [PASS][31] +5 other tests pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [FAIL][32] -> [PASS][33] +73 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [FAIL][34] -> [PASS][35] +185 other tests pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_mmap@cpu-caching:
    - bat-pvc-2:          [FAIL][36] ([Intel XE#982]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_mmap@cpu-caching.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_mmap@cpu-caching.html
    - bat-atsm-2:         [FAIL][38] ([Intel XE#982]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_mmap@cpu-caching.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_mmap@cpu-caching.html

  * igt@xe_mmap@system:
    - bat-atsm-2:         [FAIL][40] -> [PASS][41] +34 other tests pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_mmap@system.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_mmap@system.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-pvc-2:          [INCOMPLETE][42] ([Intel XE#978]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-atsm-2:         [INCOMPLETE][44] ([Intel XE#978]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_pat@pat-index-xelp.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@prime-external-import-coh:
    - bat-atsm-2:         [FAIL][46] ([Intel XE#984]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html

  * igt@xe_pat@userptr-coh-none:
    - bat-pvc-2:          [FAIL][48] ([Intel XE#984]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_pat@userptr-coh-none.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_pat@userptr-coh-none.html

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - bat-atsm-2:         [SKIP][50] -> [PASS][51] +9 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - bat-pvc-2:          [SKIP][52] -> [PASS][53] +8 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [FAIL][54] -> [SKIP][55] ([Intel XE#423])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][56] -> [FAIL][57] ([Intel XE#524])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][58] -> [FAIL][59] ([Intel XE#524])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [FAIL][60] -> [SKIP][61] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [SKIP][62] ([Intel XE#688]) -> [DMESG-FAIL][63] ([Intel XE#482]) +3 other tests dmesg-fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         [FAIL][64] -> [SKIP][65] ([Intel XE#688]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-pvc-2:          [SKIP][66] ([Intel XE#688]) -> [INCOMPLETE][67] ([Intel XE#392])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [FAIL][68] -> [SKIP][69] ([Intel XE#288]) +32 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         [FAIL][70] -> [SKIP][71] ([Intel XE#977])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         [FAIL][72] -> [SKIP][73] ([Intel XE#979]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#978]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/978
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [Intel XE#981]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/981
  [Intel XE#982]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/982
  [Intel XE#984]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/984
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7620 -> IGTPW_10335
  * Linux: xe-549-9c26345b7aaf1e2fa46cf8ee34b60d587790d600 -> xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b

  IGTPW_10335: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/index.html
  IGT_7620: 6714b814e7f82743abf45c33361fbe057a22880a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-549-9c26345b7aaf1e2fa46cf8ee34b60d587790d600: 9c26345b7aaf1e2fa46cf8ee34b60d587790d600
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/index.html

--===============6945741708764693844==
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
<tr><td><b>Series:</b></td><td>Initial SR-IOV validation (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126034/">https://patchwork.freedesktop.org/series/126034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7620_BAT -&gt; XEIGTPW_10335_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10335_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10335_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10335_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10335_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr_cursor_plane_move:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@kms_psr@psr_cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render-system-vram01-uc-wc-mixed-pde:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render-system-vram01-uc-wc-mixed-pde.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>) +647 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-massive-size:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_create@create-massive-size.html">PASS</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_create@create-massive-size.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> +73 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> +185 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_mmap@cpu-caching.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/982">Intel XE#982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_mmap@cpu-caching.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_mmap@cpu-caching.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/982">Intel XE#982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_mmap@cpu-caching.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_mmap@system.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_mmap@system.html">PASS</a> +34 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_pat@pat-index-xelp.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_pat@pat-index-xelp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-external-import-coh:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/984">Intel XE#984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_pat@userptr-coh-none.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/984">Intel XE#984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_pat@userptr-coh-none.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_evict@evict-beng-small.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7620 -&gt; IGTPW_10335</li>
<li>Linux: xe-549-9c26345b7aaf1e2fa46cf8ee34b60d587790d600 -&gt; xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b</li>
</ul>
<p>IGTPW_10335: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/index.html<br />
  IGT_7620: 6714b814e7f82743abf45c33361fbe057a22880a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-549-9c26345b7aaf1e2fa46cf8ee34b60d587790d600: 9c26345b7aaf1e2fa46cf8ee34b60d587790d600<br />
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b</p>

</body>
</html>

--===============6945741708764693844==--
