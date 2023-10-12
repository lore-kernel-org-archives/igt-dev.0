Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7606328459387330550=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 12 Oct 2023 02:19:41 -0000
Message-ID: <169707718135.25005.2889460336588550763@emeril.freedesktop.org>
References: <20231011150953.284936-1-matthew.auld@intel.com>
In-Reply-To: <20231011150953.284936-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_PAT_and_?=
 =?utf-8?q?cache_coherency_support_=28rev2=29?=
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

--===============7606328459387330550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev2)
URL   : https://patchwork.freedesktop.org/series/124667/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7532_BAT -> XEIGTPW_9986_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9986_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9986_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9986_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-adlp-7:         [PASS][1] -> [WARN][2] +8 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-wide:
    - bat-dg2-oem2:       [PASS][3] -> [WARN][4] +7 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][5] +74 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][6] -> [FAIL][7] +145 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][8] -> [FAIL][9] +85 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  * {igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][10] +132 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb.html

  * {igt@xe_pat@pat-index-xe2-render} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@xe_pat@pat-index-xe2-render.html
    - bat-adlp-7:         NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@xe_pat@pat-index-xe2-render.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#624]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][15] ([Intel XE#609]) -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][17] ([Intel XE#609]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][19] ([Intel XE#480]) -> [FAIL][20] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][21] ([Intel XE#480]) -> [FAIL][22] +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][23] ([Intel XE#608]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [INCOMPLETE][25] ([Intel XE#632]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][27] ([Intel XE#400]) -> [FAIL][28] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][29] -> [FAIL][30] +5 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][31] -> [FAIL][32] +5 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
New tests
---------

  New tests have been introduced between XEIGT_7532_BAT and XEIGTPW_9986_BAT:

### New IGT tests (135) ###

  * igt@xe_mmap@cpu-caching-coh:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-all:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-uc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-uc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-uc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-uc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wb-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wt-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wt-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wt-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-vram01-wt-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-uc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-uc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-uc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-uc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wb-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wt-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wt-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wt-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-system-wt-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-uc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-wb:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-wb-cpu-wc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-wt:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-uc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-uc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-uc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-uc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wb-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wt-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wt-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wt-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-vram01-wt-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-uc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-uc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-uc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-uc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wb-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wt-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wt-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wt-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-system-wt-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-uc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wt-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wb-cpu-wc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xe2-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-xe2-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@userptr-coh-none:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_9986_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][33] ([Intel XE#753])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/753


Build changes
-------------

  * IGT: IGT_7532 -> IGTPW_9986
  * Linux: xe-429-81cbfcc83d65c3c69866f356cb83497a47f9d297 -> xe-430-fe4d6ceb20b5ebad356c722396c2c06d4485c359

  IGTPW_9986: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html
  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-429-81cbfcc83d65c3c69866f356cb83497a47f9d297: 81cbfcc83d65c3c69866f356cb83497a47f9d297
  xe-430-fe4d6ceb20b5ebad356c722396c2c06d4485c359: fe4d6ceb20b5ebad356c722396c2c06d4485c359

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/index.html

--===============7606328459387330550==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124667/">https://patchwork.freedesktop.org/series/124667/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7532_BAT -&gt; XEIGTPW_9986_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9986_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9986_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9986_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">FAIL</a> +74 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +145 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +85 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb.html">FAIL</a> +132 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xe2-render} (NEW):</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@xe_pat@pat-index-xe2-render.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@xe_pat@pat-index-xe2-render.html">SKIP</a> +1 other test skip</p>
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
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7532/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7532_BAT and XEIGTPW_9986_BAT:</p>
<h3>New IGT tests (135)</h3>
<ul>
<li>
<p>igt@xe_mmap@cpu-caching-coh:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-uc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-uc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-uc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wb-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wt-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wt-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-vram01-wt-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-uc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-uc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-uc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wb-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wt-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wt-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-system-wt-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-uc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wb-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@vram01-vram01-wt-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-uc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-wb:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-wt:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-uc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-uc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-uc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wb-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wt-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wt-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-vram01-wt-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-uc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-uc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-uc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wb-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wt-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wt-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-system-wt-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-uc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-uc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-cpu-wc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wb-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wt-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wb-cpu-wc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@vram01-vram01-wt-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9986_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@migrate:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9986/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/753">Intel XE#753</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7532 -&gt; IGTPW_9986</li>
<li>Linux: xe-429-81cbfcc83d65c3c69866f356cb83497a47f9d297 -&gt; xe-430-fe4d6ceb20b5ebad356c722396c2c06d4485c359</li>
</ul>
<p>IGTPW_9986: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html<br />
  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-429-81cbfcc83d65c3c69866f356cb83497a47f9d297: 81cbfcc83d65c3c69866f356cb83497a47f9d297<br />
  xe-430-fe4d6ceb20b5ebad356c722396c2c06d4485c359: fe4d6ceb20b5ebad356c722396c2c06d4485c359</p>

</body>
</html>

--===============7606328459387330550==--
