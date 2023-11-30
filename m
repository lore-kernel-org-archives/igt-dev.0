Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2591544136095102423=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 30 Nov 2023 23:25:34 -0000
Message-ID: <170138673494.15642.18158697695007272620@emeril.freedesktop.org>
References: <20231130184536.7-1-francois.dugast@intel.com>
In-Reply-To: <20231130184536.7-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_uAPI_Ali?=
 =?utf-8?q?gnment_-_Cleanup_and_future_proof_=28rev5=29?=
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

--===============2591544136095102423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - Cleanup and future proof (rev5)
URL   : https://patchwork.freedesktop.org/series/126537/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7612_BAT -> XEIGTPW_10312_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10312_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10312_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10312_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-dg2-oem2:       [PASS][1] -> [WARN][2] +7 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-atsm-2:         [PASS][3] -> [CRASH][4] +5 other tests crash
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][5] -> [CRASH][6] +5 other tests crash
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +78 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +163 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][11] -> [FAIL][12] +91 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][13] -> [FAIL][14] +32 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] +9 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - bat-atsm-2:         [PASS][17] -> [SKIP][18] +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - bat-pvc-2:          [PASS][19] -> [SKIP][20] +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [SKIP][21] ([Intel XE#388]) -> [FAIL][22] +2 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#388]) -> [FAIL][24] +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [FAIL][25] ([i915#2346]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][27] ([Intel XE#423]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][29] ([Intel XE#480]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][31] ([Intel XE#282] / [i915#2017]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [FAIL][33] ([Intel XE#608]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][35] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][36] +2 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][37] ([Intel XE#261] / [Intel XE#688]) -> [FAIL][38] +15 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][39] ([Intel XE#288]) -> [FAIL][40] +17 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][41] ([Intel XE#263]) -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_mmap@vram.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_mmap@vram.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [PASS][43] -> [FAIL][44] +3 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-pvc-2:          [PASS][45] -> [WARN][46] +1 other test warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][47] ([Intel XE#524]) -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-adlp-7:         [SKIP][49] ([Intel XE#688]) -> [FAIL][50] +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][51] -> [FAIL][52] +29 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm}:
    - bat-adlp-7:         [SKIP][53] ([Intel XE#288]) -> [FAIL][54] +14 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  * {igt@xe_pat@pat-index-xe2}:
    - bat-adlp-7:         [SKIP][55] ([Intel XE#977]) -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * {igt@xe_pat@pat-index-xehpc}:
    - bat-adlp-7:         [SKIP][57] ([Intel XE#979]) -> [FAIL][58] +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  * {igt@xe_pat@pat-index-xelp}:
    - bat-adlp-7:         [PASS][59] -> [FAIL][60] +24 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_pat@pat-index-xelp.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_pat@pat-index-xelp.html

  * {igt@xe_waitfence@engine}:
    - bat-dg2-oem2:       [PASS][61] -> [FAIL][62] +4 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10312_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-massive-size:
    - bat-dg2-oem2:       [PASS][63] -> [FAIL][64] ([Intel XE#981])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_create@create-massive-size.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_create@create-massive-size.html
    - bat-atsm-2:         [PASS][65] -> [FAIL][66] ([Intel XE#981])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_create@create-massive-size.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_create@create-massive-size.html
    - bat-pvc-2:          [PASS][67] -> [FAIL][68] ([Intel XE#981])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_create@create-massive-size.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_create@create-massive-size.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][69] -> [SKIP][70] ([Intel XE#688]) +7 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][71] -> [SKIP][72] ([Intel XE#688]) +15 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-threads-small:
    - bat-dg2-oem2:       [PASS][73] -> [SKIP][74] ([Intel XE#688]) +15 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][75] ([Intel XE#482]) -> [SKIP][76] ([Intel XE#688]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][77] ([Intel XE#936]) -> [SKIP][78] ([Intel XE#688]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/388
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#936]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/936
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#978]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/978
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [Intel XE#981]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/981
  [Intel XE#982]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/982
  [Intel XE#984]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/984
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7612 -> IGTPW_10312
  * Linux: xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083 -> xe-541-68b673dd7ccbe64715e0a7492897e8d992040016

  IGTPW_10312: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10312/index.html
  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083: afdc645350a4b30d1ba6c52deed4ecc11bf7c083
  xe-541-68b673dd7ccbe64715e0a7492897e8d992040016: 68b673dd7ccbe64715e0a7492897e8d992040016

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/index.html

--===============2591544136095102423==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - Cleanup and future proof (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126537/">https://patchwork.freedesktop.org/series/126537/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7612_BAT -&gt; XEIGTPW_10312_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10312_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10312_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10312_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">CRASH</a> +5 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">CRASH</a> +5 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +78 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +163 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> +91 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_evict@evict-beng-small.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a></li>
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
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">WARN</a> +1 other test warn</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xe2}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xehpc}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xelp}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">FAIL</a> +24 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_waitfence@engine}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10312_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_create@create-massive-size:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/936">Intel XE#936</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10312/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7612 -&gt; IGTPW_10312</li>
<li>Linux: xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083 -&gt; xe-541-68b673dd7ccbe64715e0a7492897e8d992040016</li>
</ul>
<p>IGTPW_10312: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10312/index.html<br />
  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083: afdc645350a4b30d1ba6c52deed4ecc11bf7c083<br />
  xe-541-68b673dd7ccbe64715e0a7492897e8d992040016: 68b673dd7ccbe64715e0a7492897e8d992040016</p>

</body>
</html>

--===============2591544136095102423==--
