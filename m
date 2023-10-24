Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3730746507285873683=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 24 Oct 2023 00:13:28 -0000
Message-ID: <169810640875.18359.4665797851100660212@emeril.freedesktop.org>
References: <20231020093801.631809-1-matthew.auld@intel.com>
In-Reply-To: <20231020093801.631809-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_PAT_and_?=
 =?utf-8?q?cache_coherency_support_=28rev5=29?=
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

--===============3730746507285873683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev5)
URL   : https://patchwork.freedesktop.org/series/124667/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7551_BAT -> XEIGTPW_10038_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10038_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10038_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10038_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-dg2-oem2:       [PASS][1] -> [WARN][2] +7 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-high:
    - bat-adlp-7:         [PASS][3] -> [WARN][4] +8 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_addfb_basic@too-high.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@kms_addfb_basic@too-high.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-pvc-2:          [PASS][5] -> [FAIL][6] +34 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] +89 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +122 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * {igt@xe_pat@pat-index-common@blt-system-system-wt-wb-cpu-wc-single-pde} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][11] +72 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@xe_pat@pat-index-common@blt-system-system-wt-wb-cpu-wc-single-pde.html

  * {igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-mixed-pde} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][12] +276 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-atsm-2/igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-mixed-pde.html

  * {igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wt-mixed-pde} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][13] +276 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wt-mixed-pde.html

  * {igt@xe_pat@pat-index-xehpc} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][14] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][15] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         NOTRUN -> [SKIP][16] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][17] -> [FAIL][18] +88 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][19] ([Intel XE#609]) -> [FAIL][20] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#624]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][23] ([Intel XE#609]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][25] ([Intel XE#480]) -> [FAIL][26] +2 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][27] ([Intel XE#282]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][29] ([Intel XE#389]) -> [FAIL][30] +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          [DMESG-FAIL][31] ([Intel XE#482]) -> [FAIL][32] +3 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          [INCOMPLETE][33] ([Intel XE#613] / [Intel XE#814]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_basic@twice-bindexecqueue}:
    - bat-adlp-7:         [PASS][35] -> [FAIL][36] +5 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html

  * {igt@xe_exec_basic@twice-bindexecqueue-rebind}:
    - bat-dg2-oem2:       [PASS][37] -> [FAIL][38] +5 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][39] -> [FAIL][40] +5 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-rebind}:
    - bat-pvc-2:          [PASS][41] -> [FAIL][42] +10 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  
New tests
---------

  New tests have been introduced between XEIGT_7551_BAT and XEIGTPW_10038_BAT:

### New IGT tests (280) ###

  * igt@xe_mmap@cpu-caching-coh:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-all:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-uc-uc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-uc-uc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-uc-wb-cpu-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-uc-wb-cpu-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-uc-wb-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-uc-wb-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-uc-wt-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-uc-wt-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-uc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-uc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wb-cpu-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wb-cpu-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wb-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wb-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wt-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wt-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-uc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-uc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-wb-cpu-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-wb-cpu-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-wb-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-wb-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-wt-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wb-wt-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wt-uc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wt-uc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wt-wb-cpu-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wt-wb-cpu-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wt-wb-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wt-wb-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wt-wt-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-system-wt-wt-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-uc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-uc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-uc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-uc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-uc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-uc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-uc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-uc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wb-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wt-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wt-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wt-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wt-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wt-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wt-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wt-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-system-vram01-wt-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-uc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-uc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-uc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-uc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-uc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-uc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-uc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-uc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wb-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wt-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wt-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wt-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wt-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wt-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wt-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wt-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-system-wt-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-uc-uc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-uc-uc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-uc-wb-cpu-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-uc-wb-cpu-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-uc-wb-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-uc-wb-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-uc-wt-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-uc-wt-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-uc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-uc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wb-cpu-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wb-cpu-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wb-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wb-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wt-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wt-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-uc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-uc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-wb-cpu-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-wb-cpu-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-wb-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-wb-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-wt-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wb-wt-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wt-uc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wt-uc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wt-wb-cpu-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wt-wb-cpu-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wt-wb-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wt-wb-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wt-wt-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-system-wt-wt-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-uc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-uc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-uc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-uc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-uc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-uc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-uc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-uc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wb-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wt-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wt-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wt-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wt-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wt-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wt-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wt-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-system-vram01-wt-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-uc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-uc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-uc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-uc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-uc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-uc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-uc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-uc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wb-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wt-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wt-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wt-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wt-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wt-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wt-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wt-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-system-wt-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-uc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-uc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wt-uc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wt-uc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wb-cpu-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wb-cpu-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wb-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wb-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wt-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wt-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xe2:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xehpc:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@blt-system-system-wc-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@blt-system-system-wc-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@blt-system-vram01-wc-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@blt-system-vram01-wc-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@blt-vram01-system-wc-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@blt-vram01-system-wc-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@blt-vram01-vram01-wc-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@blt-vram01-vram01-wc-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@render-system-system-wc-wc-mixed-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@render-system-system-wc-wc-single-pde:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@render-system-vram01-wc-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@render-system-vram01-wc-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@render-vram01-system-wc-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@render-vram01-system-wc-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@render-vram01-vram01-wc-wc-mixed-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelp@render-vram01-vram01-wc-wc-single-pde:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xelpg:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@userptr-coh-none:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10038_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][43] ([Intel XE#814])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/613
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/814


Build changes
-------------

  * IGT: IGT_7551 -> IGTPW_10038

  IGTPW_10038: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10038/index.html
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-442-a0a80950176b39dbc76f8faa92fddf6caaa06191: a0a80950176b39dbc76f8faa92fddf6caaa06191

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/index.html

--===============3730746507285873683==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124667/">https://patchwork.freedesktop.org/series/124667/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7551_BAT -&gt; XEIGTPW_10038_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10038_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10038_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10038_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@kms_addfb_basic@too-high.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-rebind.html">FAIL</a> +34 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +89 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +122 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-common@blt-system-system-wt-wb-cpu-wc-single-pde} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@xe_pat@pat-index-common@blt-system-system-wt-wb-cpu-wc-single-pde.html">FAIL</a> +72 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-mixed-pde} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-atsm-2/igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-mixed-pde.html">FAIL</a> +276 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wt-mixed-pde} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wt-mixed-pde.html">FAIL</a> +276 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xehpc} (NEW):</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +88 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/613">Intel XE#613</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/814">Intel XE#814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_basic@twice-bindexecqueue}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@twice-bindexecqueue-rebind}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-rebind}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7551_BAT and XEIGTPW_10038_BAT:</p>
<h3>New IGT tests (280)</h3>
<ul>
<li>
<p>igt@xe_mmap@cpu-caching-coh:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-uc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-uc-uc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-uc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-uc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-uc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-uc-wb-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-uc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-uc-wt-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-uc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wb-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-cpu-wc-wt-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-uc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-uc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-wb-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-wb-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-wt-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wb-wt-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wt-uc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wt-uc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wt-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wt-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wt-wb-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wt-wb-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wt-wt-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-system-wt-wt-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-uc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-uc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-uc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-uc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-uc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-uc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-uc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-uc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-cpu-wc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wb-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wt-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wt-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wt-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wt-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wt-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wt-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wt-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-system-vram01-wt-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-uc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-uc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-uc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-uc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-uc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-uc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-uc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-uc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-cpu-wc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wb-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wt-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wt-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wt-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wt-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wt-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wt-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wt-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-system-wt-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-uc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-cpu-wc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wb-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@blt-vram01-vram01-wt-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-uc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-uc-uc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-uc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-uc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-uc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-uc-wb-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-uc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-uc-wt-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-uc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wb-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-cpu-wc-wt-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-uc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-uc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-wb-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-wb-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-wt-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wb-wt-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wt-uc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wt-uc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wt-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wt-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wt-wb-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wt-wb-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wt-wt-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-system-wt-wt-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-uc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-uc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-uc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-uc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-uc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-uc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-uc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-uc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-cpu-wc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wb-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wt-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wt-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wt-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wt-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wt-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wt-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wt-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-system-vram01-wt-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-uc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-uc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-uc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-uc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-uc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-uc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-uc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-uc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-cpu-wc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wb-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wt-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wt-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wt-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wt-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wt-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wt-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wt-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-system-wt-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-uc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-uc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-uc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-cpu-wc-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wb-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wt-uc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wt-uc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wb-cpu-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wb-cpu-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wb-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wb-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wt-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common@render-vram01-vram01-wt-wt-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt-system-system-wc-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt-system-system-wc-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt-system-vram01-wc-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt-system-vram01-wc-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt-vram01-system-wc-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt-vram01-system-wc-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt-vram01-vram01-wc-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt-vram01-vram01-wc-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-system-system-wc-wc-mixed-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-system-system-wc-wc-single-pde:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-system-vram01-wc-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-system-vram01-wc-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-vram01-system-wc-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-vram01-system-wc-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-vram01-vram01-wc-wc-mixed-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render-vram01-vram01-wc-wc-single-pde:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10038_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10038/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/814">Intel XE#814</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7551 -&gt; IGTPW_10038</li>
</ul>
<p>IGTPW_10038: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10038/index.html<br />
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-442-a0a80950176b39dbc76f8faa92fddf6caaa06191: a0a80950176b39dbc76f8faa92fddf6caaa06191</p>

</body>
</html>

--===============3730746507285873683==--
