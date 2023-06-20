Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2929961751937623065=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Tue, 20 Jun 2023 05:30:00 -0000
Message-ID: <168723900023.10439.15252507280880605692@emeril.freedesktop.org>
References: <20230620043240.3312945-1-kunal1.joshi@intel.com>
In-Reply-To: <20230620043240.3312945-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUkZDIEVu?=
 =?utf-8?q?able_kms=5Ffrontbuffer=5Ftracking_on_XE_=28rev7=29?=
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

--===============2929961751937623065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC Enable kms_frontbuffer_tracking on XE (rev7)
URL   : https://patchwork.freedesktop.org/series/118648/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13290 -> IGTPW_9213
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9213 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9213, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (2): fi-kbl-soraka bat-dg1-8 
  Missing    (2): fi-tgl-1115g4 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9213:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1] +277 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][2] +569 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adls-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][3] +569 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - bat-dg2-8:          NOTRUN -> [SKIP][4] +676 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][5] +569 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlm-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render (NEW):
    - bat-adln-1:         NOTRUN -> [SKIP][6] +73 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adln-1/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-6/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][8] +191 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-3/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][9] +569 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-7/igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - bat-mtlp-8:         NOTRUN -> [SKIP][10] +37 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][11] +676 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-9/igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][12] +139 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][13] +676 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-11/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][14] +191 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt (NEW):
    - bat-rpls-1:         NOTRUN -> [SKIP][15] +569 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][16] +452 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-5/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-rte (NEW):
    - bat-adlp-11:        NOTRUN -> [SKIP][17] +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@psrdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc (NEW):
    - bat-rpls-2:         NOTRUN -> [SKIP][18] +569 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-2/igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][19] +569 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-mtlp-6/igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_compute@compute-square:
    - {bat-dg1-8}:        NOTRUN -> [SKIP][20] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-8/igt@xe_compute@compute-square.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13290 and IGTPW_9213:

### New IGT tests (570) ###

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 1 pass(s) 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - Statuses : 3 pass(s) 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - Statuses : 1 pass(s) 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 1 pass(s) 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - Statuses : 3 pass(s) 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 1 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - Statuses : 1 pass(s) 40 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-badstride:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - Statuses : 1 pass(s) 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-pri-indfb-multidraw:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-pri-indfb-multidraw:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-rte:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-badstride:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-indfb-scaledprimary:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-modesetfrombusy:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-blt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-cpu:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-wc:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-pwrite:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-render:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-blt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-cpu:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-wc:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-pwrite:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-render:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-shrfb-scaledprimary:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-slowdraw:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-stridechange:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-4:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-pri-indfb-multidraw:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-rte:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-pri-indfb-multidraw:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-rte:
    - Statuses : 41 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-move:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-indfb-scaledprimary:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-modesetfrombusy:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-blt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-cpu:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-pwrite:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-render:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-blt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-gtt:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-pwrite:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-render:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-shrfb-scaledprimary:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-slowdraw:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9213 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-x1275:       [PASS][21] -> [DMESG-FAIL][22] ([i915#5334] / [i915#7872])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13290/fi-kbl-x1275/igt@i915_selftest@live@gt_heartbeat.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-x1275/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-2:         [PASS][23] -> [TIMEOUT][24] ([i915#6794] / [i915#7392])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13290/bat-rpls-2/igt@i915_selftest@live@mman.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-2/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-2:         NOTRUN -> [ABORT][25] ([i915#6687] / [i915#8668])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][26] ([i915#6687] / [i915#7978])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][27] ([fdo#109271]) +702 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-skl-6600u/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][28] ([fdo#111825]) +494 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][29] ([fdo#109271]) +1000 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-x1275/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][30] ([fdo#111825]) +291 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - bat-adlp-11:        NOTRUN -> [SKIP][31] ([i915#4342])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - bat-rpls-1:         NOTRUN -> [SKIP][32] ([i915#1849]) +430 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - bat-adlp-11:        NOTRUN -> [DMESG-WARN][33] ([i915#6868])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - bat-dg1-7:          NOTRUN -> [SKIP][34] ([i915#4078] / [i915#4342]) +430 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - bat-atsm-1:         NOTRUN -> [SKIP][35] ([i915#6078]) +1000 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-atsm-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - bat-adlp-11:        NOTRUN -> [ABORT][36] ([i915#4423] / [i915#6868])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - bat-mtlp-6:         NOTRUN -> [SKIP][37] ([i915#4342]) +430 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - bat-dg2-8:          NOTRUN -> [SKIP][38] ([i915#5354]) +167 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][39] ([fdo#109271]) +84 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-soraka/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][40] ([fdo#109271]) +1000 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-bsw-n3050/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - fi-glk-j4005:       NOTRUN -> [SKIP][41] ([fdo#109271]) +929 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-glk-j4005/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
    - bat-adln-1:         NOTRUN -> [SKIP][42] ([fdo#111825] / [i915#1825]) +146 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adln-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - bat-adls-5:         NOTRUN -> [SKIP][43] ([i915#1849]) +430 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adls-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][44] ([i915#5439]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - bat-dg1-5:          NOTRUN -> [SKIP][45] ([i915#5439]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - bat-rplp-1:         NOTRUN -> [SKIP][46] ([i915#5439]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - bat-dg2-8:          NOTRUN -> [SKIP][47] ([i915#5460]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc (NEW):
    - bat-adln-1:         NOTRUN -> [SKIP][48] ([fdo#111825]) +159 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adln-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][49] ([fdo#109271]) +929 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-7567u/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][50] ([fdo#109271]) +1000 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-apl-guc/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - bat-jsl-3:          NOTRUN -> [FAIL][51] ([i915#7739]) +97 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - bat-dg2-9:          NOTRUN -> [SKIP][52] ([i915#3458]) +101 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - bat-dg2-8:          NOTRUN -> [SKIP][53] ([i915#3458]) +101 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - bat-dg1-5:          NOTRUN -> [SKIP][54] ([i915#3458]) +101 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - fi-rkl-11600:       NOTRUN -> [SKIP][55] ([i915#3023]) +137 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - bat-adlp-9:         NOTRUN -> [SKIP][56] ([i915#3458]) +137 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - fi-elk-e7500:       NOTRUN -> [SKIP][57] ([fdo#109271]) +826 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-elk-e7500/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - bat-adln-1:         NOTRUN -> [SKIP][58] ([i915#6497]) +36 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adln-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][59] ([fdo#109271]) +855 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - bat-dg2-11:         NOTRUN -> [SKIP][60] ([i915#3458]) +101 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
    - bat-adlp-11:        NOTRUN -> [SKIP][61] ([i915#3458]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - bat-adlp-6:         NOTRUN -> [SKIP][62] ([i915#6497]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][63] ([fdo#109271]) +1000 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-8809g/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - bat-dg2-11:         NOTRUN -> [SKIP][64] ([i915#5354]) +167 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - fi-bsw-nick:        NOTRUN -> [SKIP][65] ([fdo#109271]) +1000 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-bsw-nick/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
    - bat-kbl-2:          NOTRUN -> [SKIP][66] ([fdo#109271]) +1000 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-kbl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - bat-dg2-9:          NOTRUN -> [SKIP][67] ([i915#5354]) +167 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - bat-rpls-2:         NOTRUN -> [SKIP][68] ([i915#1849]) +430 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - bat-adlp-9:         NOTRUN -> [SKIP][69] ([i915#5439]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - bat-dg2-11:         NOTRUN -> [SKIP][70] ([i915#5460]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - bat-dg2-9:          NOTRUN -> [SKIP][71] ([i915#5460]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][72] ([fdo#109271]) +1000 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-ilk-650/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][73] ([fdo#111825]) +295 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - bat-rplp-1:         NOTRUN -> [SKIP][74] ([i915#3458]) +137 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - fi-blb-e6850:       NOTRUN -> [SKIP][75] ([fdo#109271]) +1000 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-blb-e6850/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][76] ([fdo#109271]) +929 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-cfl-8700k/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - bat-jsl-1:          NOTRUN -> [FAIL][77] ([i915#7739]) +96 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - bat-dg1-5:          NOTRUN -> [SKIP][78] ([fdo#111825]) +391 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - fi-skl-guc:         NOTRUN -> [SKIP][79] ([fdo#109271]) +1000 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-skl-guc/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
    - bat-mtlp-8:         NOTRUN -> [SKIP][80] ([i915#1825]) +82 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - bat-rplp-1:         NOTRUN -> [SKIP][81] ([fdo#111825] / [i915#1825]) +219 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - fi-rkl-11600:       NOTRUN -> [SKIP][82] ([fdo#111825] / [i915#1825]) +215 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - bat-adlp-9:         NOTRUN -> [SKIP][83] ([i915#1825]) +219 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - fi-hsw-4770:        NOTRUN -> [SKIP][84] ([fdo#109271]) +932 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-hsw-4770/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - bat-adlm-1:         NOTRUN -> [SKIP][85] ([i915#1849]) +430 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlm-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][86] ([fdo#109271]) +1000 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-ivb-3770/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][87] ([fdo#109271]) +929 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-cfl-guc/igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc (NEW):
    - fi-kbl-guc:         NOTRUN -> [SKIP][88] ([fdo#109271]) +1000 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-guc/igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][89] ([fdo#111825]) +492 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][90] ([fdo#109271]) +1000 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-pnv-d510/igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][91] -> [FAIL][92] ([i915#7932])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13290/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_pipe_crc_

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/index.html

--===============2929961751937623065==
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
<tr><td><b>Series:</b></td><td>RFC Enable kms_frontbuffer_tracking on XE (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118648/">https://patchwork.freedesktop.org/series/118648/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13290 -&gt; IGTPW_9213</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9213 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9213, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (2): fi-kbl-soraka bat-dg1-8 <br />
  Missing    (2): fi-tgl-1115g4 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9213:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> +277 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite (NEW):</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adls-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> +676 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlm-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adln-1/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-6/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-3/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> +191 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-7/igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-9/igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> +676 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> +139 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-11/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +676 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> +191 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt (NEW):</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc (NEW):</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-5/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +452 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-rte (NEW):</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@psrdrrs-2p-rte.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc (NEW):</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-2/igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-mtlp-6/igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_compute@compute-square:<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-8/igt@xe_compute@compute-square.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13290 and IGTPW_9213:</p>
<h3>New IGT tests (570)</h3>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>Statuses : 3 pass(s) 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>Statuses : 3 pass(s) 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-badstride:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>Statuses : 1 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-rte:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-badstride:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-modesetfrombusy:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-render:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-slowdraw:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-stridechange:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-4:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-rte:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-rte:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-modesetfrombusy:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-render:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-slowdraw:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9213 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13290/fi-kbl-x1275/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-x1275/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> ([i915#5334] / [i915#7872])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13290/bat-rpls-2/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-2/igt@i915_selftest@live@mman.html">TIMEOUT</a> ([i915#6794] / [i915#7392])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> ([i915#6687] / [i915#8668])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> ([i915#6687] / [i915#7978])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-skl-6600u/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +702 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#111825]) +494 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-x1275/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +291 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#4342])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#1849]) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">DMESG-WARN</a> ([i915#6868])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#4078] / [i915#4342]) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-atsm-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#6078]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">ABORT</a> ([i915#4423] / [i915#6868])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> ([i915#4342]) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) +167 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-soraka/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +84 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-bsw-n3050/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-glk-j4005/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +929 similar issues</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adln-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825] / [i915#1825]) +146 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adls-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#1849]) +430 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439]) +1 similar issue</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439]) +1 similar issue</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#5460]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adln-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#111825]) +159 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-7567u/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> ([fdo#109271]) +929 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt (NEW):</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-apl-guc/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> ([i915#7739]) +97 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> ([i915#3458]) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> ([i915#3458]) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3023]) +137 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#3458]) +137 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-elk-e7500/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109271]) +826 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adln-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> ([i915#6497]) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> ([fdo#109271]) +855 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#3458]) +101 similar issues</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#3458]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> ([i915#6497]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-8809g/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([i915#5354]) +167 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-bsw-nick/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +1000 similar issues</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-kbl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +1000 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([i915#5354]) +167 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rpls-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">SKIP</a> ([i915#1849]) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5460]) +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5460]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-ilk-650/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +295 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> ([i915#3458]) +137 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-blb-e6850/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-cfl-8700k/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +929 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> ([i915#7739]) +96 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg1-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#111825]) +391 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-skl-guc/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#1825]) +82 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-rplp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +219 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-rkl-11600/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> ([fdo#111825] / [i915#1825]) +215 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-rte:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</a> ([i915#1825]) +219 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-hsw-4770/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +932 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-adlm-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#1849]) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-ivb-3770/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-cfl-guc/igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +929 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc (NEW):</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-kbl-guc/igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-jsl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#111825]) +492 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/fi-pnv-d510/igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13290/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9213/bat-dg2-8/igt@kms_pipe_crc_">FAIL</a> ([i915#7932])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2929961751937623065==--
