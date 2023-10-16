Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2549904611477521363=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 16 Oct 2023 20:03:12 -0000
Message-ID: <169748659258.13509.14412631247018078803@emeril.freedesktop.org>
References: <20231016141450.55936-1-matthew.auld@intel.com>
In-Reply-To: <20231016141450.55936-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_PAT_and_?=
 =?utf-8?q?cache_coherency_support_=28rev3=29?=
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

--===============2549904611477521363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev3)
URL   : https://patchwork.freedesktop.org/series/124667/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7541_BAT -> XEIGTPW_10006_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10006_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10006_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10006_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-dg2-oem2:       [PASS][1] -> [WARN][2] +7 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-high:
    - bat-adlp-7:         [PASS][3] -> [WARN][4] +8 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_addfb_basic@too-high.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_addfb_basic@too-high.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] +147 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +80 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +84 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * {igt@xe_pat@pat-index-common-blt@system-system-wt-uc} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][11] +74 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_pat@pat-index-common-blt@system-system-wt-uc.html

  * {igt@xe_pat@pat-index-common-blt@vram01-system-wb-uc} (NEW):
    - bat-pvc-2:          NOTRUN -> [FAIL][12] +67 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_pat@pat-index-common-blt@vram01-system-wb-uc.html

  * {igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-uc} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][13] +132 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-atsm-2/igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-uc.html

  * {igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][14] +132 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb.html

  * {igt@xe_pat@pat-index-xe2-blt} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-atsm-2/igt@xe_pat@pat-index-xe2-blt.html
    - bat-adlp-7:         NOTRUN -> [SKIP][16] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_pat@pat-index-xe2-blt.html

  * {igt@xe_pat@pat-index-xe2-render} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][17] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_pat@pat-index-xe2-render.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][18] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@xe_pat@pat-index-xe2-render.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][19] -> [FAIL][20] +88 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][21] ([Intel XE#609]) -> [FAIL][22] +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#624]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][25] ([Intel XE#609]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - bat-adlp-7:         [FAIL][27] ([i915#2346]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][29] ([Intel XE#480]) -> [FAIL][30] +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [INCOMPLETE][31] ([Intel XE#632]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [FAIL][33] ([Intel XE#608]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][35] ([Intel XE#400]) -> [FAIL][36] +2 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][37] ([Intel XE#389]) -> [FAIL][38] +3 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          [DMESG-FAIL][39] ([Intel XE#482]) -> [FAIL][40] +3 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-pvc-2:          [DMESG-WARN][41] ([Intel XE#696]) -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_basic@twice-bindexecqueue}:
    - bat-adlp-7:         [PASS][43] -> [FAIL][44] +5 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html

  * {igt@xe_exec_basic@twice-bindexecqueue-rebind}:
    - bat-dg2-oem2:       [PASS][45] -> [FAIL][46] +5 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][47] -> [FAIL][48] +5 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-rebind}:
    - bat-pvc-2:          [PASS][49] -> [FAIL][50] +11 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  
New tests
---------

  New tests have been introduced between XEIGT_7541_BAT and XEIGTPW_10006_BAT:

### New IGT tests (135) ###

  * igt@xe_mmap@cpu-caching-coh:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-all:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-uc:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-wb:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-wb-cpu-wc:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-wt:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-uc:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wb:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wt:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-uc:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-wb:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-wb-cpu-wc:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-wt:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-uc:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-wb:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-wb-cpu-wc:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-wt:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-uc-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-uc-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-uc-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-uc-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wt-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wt-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wt-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wt-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-uc-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-uc-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-uc-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-uc-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wt-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wt-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wt-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wt-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render:
    - Statuses : 3 fail(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-uc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-wb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-wb-cpu-wc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-wt:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-uc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-uc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-uc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-uc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wt-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wt-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wt-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wt-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-uc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-uc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-uc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-uc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wt-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wt-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wt-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wt-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-uc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wt-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xe2-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xe2-render:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@userptr-coh-none:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10006_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-pvc-2:          [PASS][51] -> [DMESG-WARN][52] ([Intel XE#696])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][53] ([Intel XE#753])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#696]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/696
  [Intel XE#753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/753
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7541 -> IGTPW_10006
  * Linux: xe-435-ab7cd1b4af95baba2d6ce5487d35ffda523e895d -> xe-436-9471d9e9efb920d70538445ffa07193d603b8cdb

  IGTPW_10006: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10006/index.html
  IGT_7541: fcddb77c3f8a77020f7f3b2660a66cae27cfaa2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-435-ab7cd1b4af95baba2d6ce5487d35ffda523e895d: ab7cd1b4af95baba2d6ce5487d35ffda523e895d
  xe-436-9471d9e9efb920d70538445ffa07193d603b8cdb: 9471d9e9efb920d70538445ffa07193d603b8cdb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/index.html

--===============2549904611477521363==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124667/">https://patchwork.freedesktop.org/series/124667/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7541_BAT -&gt; XEIGTPW_10006_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10006_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10006_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10006_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_addfb_basic@too-high.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +147 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +80 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +84 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-common-blt@system-system-wt-uc} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_pat@pat-index-common-blt@system-system-wt-uc.html">FAIL</a> +74 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-common-blt@vram01-system-wb-uc} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_pat@pat-index-common-blt@vram01-system-wb-uc.html">FAIL</a> +67 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-uc} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-atsm-2/igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-uc.html">FAIL</a> +132 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb.html">FAIL</a> +132 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xe2-blt} (NEW):</p>
<ul>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-atsm-2/igt@xe_pat@pat-index-xe2-blt.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_pat@pat-index-xe2-blt.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xe2-render} (NEW):</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_pat@pat-index-xe2-render.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@xe_pat@pat-index-xe2-render.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +88 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/696">Intel XE#696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">FAIL</a></li>
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
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@twice-bindexecqueue-rebind}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-rebind}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7541_BAT and XEIGTPW_10006_BAT:</p>
<h3>New IGT tests (135)</h3>
<ul>
<li>
<p>igt@xe_mmap@cpu-caching-coh:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-uc:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-wb:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-wt:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-uc:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-wb:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-wt:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-uc:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-wb:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-wt:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-uc-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-uc-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-uc-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wt-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wt-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wt-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-uc-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-uc-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-uc-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wt-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wt-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wt-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render:</p>
<ul>
<li>Statuses : 3 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-uc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-wb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-wt:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-uc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-uc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-uc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wt-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wt-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wt-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-uc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-uc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-uc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wt-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wt-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wt-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-uc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wt-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2-render:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10006_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7541/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/696">Intel XE#696</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10006/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/753">Intel XE#753</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7541 -&gt; IGTPW_10006</li>
<li>Linux: xe-435-ab7cd1b4af95baba2d6ce5487d35ffda523e895d -&gt; xe-436-9471d9e9efb920d70538445ffa07193d603b8cdb</li>
</ul>
<p>IGTPW_10006: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10006/index.html<br />
  IGT_7541: fcddb77c3f8a77020f7f3b2660a66cae27cfaa2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-435-ab7cd1b4af95baba2d6ce5487d35ffda523e895d: ab7cd1b4af95baba2d6ce5487d35ffda523e895d<br />
  xe-436-9471d9e9efb920d70538445ffa07193d603b8cdb: 9471d9e9efb920d70538445ffa07193d603b8cdb</p>

</body>
</html>

--===============2549904611477521363==--
