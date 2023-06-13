Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3540265997943676059=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Tue, 13 Jun 2023 20:35:42 -0000
Message-ID: <168668854241.21696.15148462939085407181@emeril.freedesktop.org>
References: <20230613165936.2930050-1-kunal1.joshi@intel.com>
In-Reply-To: <20230613165936.2930050-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUkZDIEVu?=
 =?utf-8?q?able_kms=5Ffrontbuffer=5Ftracking_on_XE_=28rev6=29?=
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

--===============3540265997943676059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC Enable kms_frontbuffer_tracking on XE (rev6)
URL   : https://patchwork.freedesktop.org/series/118648/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13267 -> IGTPW_9161
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9161 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9161, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9161:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][1] +277 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][2] +569 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adls-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][3] +569 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - bat-dg2-8:          NOTRUN -> [SKIP][4] +676 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][5] +569 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlm-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render (NEW):
    - bat-adln-1:         NOTRUN -> [SKIP][6] +65 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adln-1/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-6/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][8] +191 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-3/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][9] +569 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-7/igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - bat-mtlp-8:         NOTRUN -> [SKIP][10] +37 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc (NEW):
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-pnv-d510/igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][12] +676 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-9/igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu (NEW):
    - bat-dg2-11:         NOTRUN -> [SKIP][13] +676 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][14] +191 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt (NEW):
    - bat-rpls-1:         NOTRUN -> [SKIP][15] +569 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-rpls-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][16] +452 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-5/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][17] +569 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-mtlp-6/igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13267 and IGTPW_9161:

### New IGT tests (570) ###

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - Statuses : 1 pass(s) 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - Statuses : 2 pass(s) 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - Statuses : 1 pass(s) 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-badstride:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-pri-indfb-multidraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-pri-indfb-multidraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-rte:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-badstride:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-indfb-scaledprimary:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-modesetfrombusy:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-blt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-cpu:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-wc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-pwrite:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-render:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-blt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-cpu:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-wc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-pwrite:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-render:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-shrfb-scaledprimary:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-slowdraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-stridechange:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-4:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 incomplete(s) 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-pri-indfb-multidraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-rte:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-pri-indfb-multidraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-rte:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 30 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-move:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-indfb-scaledprimary:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-modesetfrombusy:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-blt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-cpu:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-pwrite:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-render:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-blt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-gtt:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-pwrite:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-render:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-shrfb-scaledprimary:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrdrrs-slowdraw:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9161 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][18] ([fdo#109271]) +702 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-skl-6600u/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][19] ([fdo#111825]) +494 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][20] ([fdo#109271]) +1000 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-kbl-x1275/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - bat-rpls-1:         NOTRUN -> [SKIP][21] ([i915#1849]) +430 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-rpls-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - bat-dg1-7:          NOTRUN -> [SKIP][22] ([i915#4078] / [i915#4342]) +430 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - bat-atsm-1:         NOTRUN -> [SKIP][23] ([i915#6078]) +644 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-atsm-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - bat-mtlp-6:         NOTRUN -> [SKIP][24] ([i915#4342]) +430 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][25] ([fdo#109280]) +511 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - bat-dg2-8:          NOTRUN -> [SKIP][26] ([i915#5354]) +167 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][27] ([fdo#109271]) +1000 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-bsw-n3050/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - fi-glk-j4005:       NOTRUN -> [SKIP][28] ([fdo#109271]) +929 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-glk-j4005/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
    - bat-adln-1:         NOTRUN -> [SKIP][29] ([fdo#111825] / [i915#1825]) +146 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adln-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - bat-adls-5:         NOTRUN -> [SKIP][30] ([i915#1849]) +430 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adls-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - bat-dg1-5:          NOTRUN -> [SKIP][31] ([i915#5439]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][32] ([i915#5439]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - bat-dg2-8:          NOTRUN -> [SKIP][33] ([i915#5460]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc (NEW):
    - bat-adln-1:         NOTRUN -> [SKIP][34] ([fdo#111825]) +147 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adln-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][35] ([fdo#109271]) +929 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-kbl-7567u/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][36] ([fdo#109271]) +1000 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-apl-guc/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - bat-jsl-3:          NOTRUN -> [FAIL][37] ([i915#7739]) +97 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - bat-dg2-9:          NOTRUN -> [SKIP][38] ([i915#3458]) +101 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - bat-dg2-8:          NOTRUN -> [SKIP][39] ([i915#3458]) +101 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - bat-dg1-5:          NOTRUN -> [SKIP][40] ([i915#3458]) +101 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - bat-adlp-9:         NOTRUN -> [SKIP][41] ([i915#3458]) +137 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - fi-elk-e7500:       NOTRUN -> [SKIP][42] ([fdo#109271]) +831 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-elk-e7500/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - bat-adln-1:         NOTRUN -> [SKIP][43] ([i915#6497]) +36 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adln-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][44] ([fdo#109271]) +855 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - bat-dg2-11:         NOTRUN -> [SKIP][45] ([i915#3458]) +101 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - bat-adlp-6:         NOTRUN -> [SKIP][46] ([i915#6497]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][47] ([fdo#109271]) +1000 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-kbl-8809g/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - bat-dg2-11:         NOTRUN -> [SKIP][48] ([i915#5354]) +167 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - fi-bsw-nick:        NOTRUN -> [SKIP][49] ([fdo#109271]) +1000 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-bsw-nick/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
    - bat-kbl-2:          NOTRUN -> [SKIP][50] ([fdo#109271]) +1000 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-kbl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - bat-dg2-9:          NOTRUN -> [SKIP][51] ([i915#5354]) +167 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - bat-adlp-9:         NOTRUN -> [SKIP][52] ([i915#5439]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - bat-dg2-11:         NOTRUN -> [SKIP][53] ([i915#5460]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - bat-dg2-9:          NOTRUN -> [SKIP][54] ([i915#5460]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][55] ([fdo#109271]) +1000 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-ilk-650/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - fi-blb-e6850:       NOTRUN -> [SKIP][56] ([fdo#109271]) +1000 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-blb-e6850/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][57] ([fdo#109271]) +929 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-cfl-8700k/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][58] ([fdo#110189]) +137 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - bat-jsl-1:          NOTRUN -> [FAIL][59] ([i915#7739]) +96 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - bat-dg1-5:          NOTRUN -> [SKIP][60] ([fdo#111825]) +391 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - fi-skl-guc:         NOTRUN -> [SKIP][61] ([fdo#109271]) +1000 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-skl-guc/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
    - bat-mtlp-8:         NOTRUN -> [SKIP][62] ([i915#1825]) +82 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - bat-adlp-9:         NOTRUN -> [SKIP][63] ([i915#1825]) +219 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - fi-hsw-4770:        NOTRUN -> [SKIP][64] ([fdo#109271]) +932 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-hsw-4770/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - bat-adlm-1:         NOTRUN -> [SKIP][65] ([i915#1849]) +430 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlm-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][66] ([fdo#109271]) +1000 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-ivb-3770/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][67] ([fdo#109271]) +929 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-cfl-guc/igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc (NEW):
    - fi-kbl-guc:         NOTRUN -> [SKIP][68] ([fdo#109271]) +1000 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-kbl-guc/igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][69] ([fdo#111825]) +492 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][70] ([fdo#109271]) +999 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-pnv-d510/igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][71] -> [FAIL][72] ([i915#7932])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13267/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-11:         [ABORT][73] ([i915#7913] / [i915#7979]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13267/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [DMESG-WARN][75] ([i915#4423]) -> [ABORT][76] ([i915#4423])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13267/bat-adlp-11/igt@i915_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [ABORT][77] ([i915#7911] / [i915#7920]) -> [ABORT][78] ([i915#4983] / [i915#7911] / [i915#7920])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13267/bat-rpls-1/igt@i915_selftest@live@requests.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-rpls-1/igt@i915_selftest@live@requests.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#7739]: https://gitlab.freedesktop.org/drm/intel/issues/7739
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7979]: https://gitlab.freedesktop.org/drm/intel/issues/7979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7327 -> IGTPW_9161

  CI-20190529: 20190529
  CI_DRM_13267: f289de77157f83b6846850bca9e03d6d6576ab3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9161: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/index.html
  IGT_7327: 34e48b7d6402c3d7af19a40d8951eae017cf64df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/index.html

--===============3540265997943676059==
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
<tr><td><b>Series:</b></td><td>RFC Enable kms_frontbuffer_tracking on XE (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118648/">https://patchwork.freedesktop.org/series/118648/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13267 -&gt; IGTPW_9161</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9161 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9161, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9161:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> +277 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite (NEW):</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adls-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> +676 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move (NEW):</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlm-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adln-1/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> +65 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-6/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-3/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> +191 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-7/igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-pnv-d510/igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-9/igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> +676 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +676 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> +191 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt (NEW):</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-rpls-1/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc (NEW):</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-5/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +452 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-mtlp-6/igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu.html">SKIP</a> +569 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13267 and IGTPW_9161:</p>
<h3>New IGT tests (570)</h3>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>Statuses : 1 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>Statuses : 2 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>Statuses : 1 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-badstride:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-rte:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-badstride:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-modesetfrombusy:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-rgb565-draw-render:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-slowdraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-stridechange:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-4:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 incomplete(s) 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-rte:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-rte:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-modesetfrombusy:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-render:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-slowdraw:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9161 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-skl-6600u/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +702 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +494 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-kbl-x1275/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-rpls-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-atsm-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +644 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +511 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +167 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-bsw-n3050/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-glk-j4005/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +929 similar issues</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adln-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +146 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adls-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) +430 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc (NEW):</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adln-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +147 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-kbl-7567u/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +929 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt (NEW):</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-apl-guc/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7739">i915#7739</a>) +97 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +137 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-elk-e7500/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +831 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adln-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6497">i915#6497</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +855 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6497">i915#6497</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-kbl-8809g/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +167 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-bsw-nick/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-kbl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +167 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>) +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-ilk-650/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-blb-e6850/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-cfl-8700k/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +929 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +137 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7739">i915#7739</a>) +96 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg1-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +391 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-skl-guc/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +82 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-rte:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +219 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-hsw-4770/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +932 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlm-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) +430 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-ivb-3770/igt@kms_frontbuffer_tracking@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-cfl-guc/igt@kms_frontbuffer_tracking@psrdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +929 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc (NEW):</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-kbl-guc/igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1000 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-jsl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +492 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/fi-pnv-d510/igt@kms_frontbuffer_tracking@psrdrrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +999 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13267/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13267/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7979">i915#7979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13267/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13267/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7327 -&gt; IGTPW_9161</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13267: f289de77157f83b6846850bca9e03d6d6576ab3c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9161: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9161/index.html<br />
  IGT_7327: 34e48b7d6402c3d7af19a40d8951eae017cf64df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3540265997943676059==--
